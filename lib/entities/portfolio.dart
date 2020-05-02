import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:preferences/preference_service.dart';
import 'package:portoli/constants/perf_keys.dart';
import 'package:portoli/entities/strategy_item.dart';

import 'entity.dart';

class DepotItem {
  String symbol;
  String name;
  double amount;
  double value;
  double dividends = 0;
  double performance;
  String currency;

  DepotItem(Orders order) {
    name = order.name;
    symbol = order.symbol;
    amount = order.amount;
    value = order.price.price;
    currency = order.price.currency;
    performance = _calcPerformance(order);
  }

  void add(Orders i) {
    amount += i.amount;
    value += i.price.price;
    performance = _calcPerformance(i);
  }

  void addDividends(Dividend div)
  {
    assert(this.symbol == div.symbol);
    assert(this.currency == div.dividend.currency);
    dividends += div.dividend.price;
  }

  double _calcPerformance(Orders order) {
    if (order.priceNow < 0) {
      return double.negativeInfinity;
    }
    return (order.priceNow * order.amount / order.price.price - 1) * 100;
  }
}

@immutable
class PortfolioEntity extends Equatable implements Entity {
  final String id;
  final String name;
  final String description;
  final bool isPrivate;
  final List<Orders> orders;
  final List<Dividend> dividends;
  List<StockEntity> stockItems = [];

  PortfolioEntity(this.id, this.name, this.description, this.isPrivate,
      this.orders, this.dividends);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'private': isPrivate,
      'orders': orders.map((f) => f.toJson()).toList(),
      'dividends': dividends.map((f) => f.toJson()).toList(),
    };
  }

  String toHash() {
    String str = toJson().toString();
    return base64.encode(utf8.encode(str));
  }

  @override
  String toString() {
    return 'PortfolioEntity { id: $id, name: $name, description: $description, enable: $isPrivate }';
  }

  static PortfolioEntity fromJson(Map<dynamic, dynamic> json) {
    var myOrders = (json['orders'] as List<dynamic> ?? [])
        .map((item) => Orders.fromJson(item))
        .toList();
    var myDividends = (json['dividends'] as List<dynamic> ?? [])
        .map((item) => Dividend.fromJson(item))
        .toList();
    return PortfolioEntity(
        json['id'] as String,
        json['name'] as String,
        json['description'] as String,
        json['private'] as bool,
        myOrders,
        myDividends);
  }

  static PortfolioEntity fromSnapshot(DocumentSnapshot snap) {
    return PortfolioEntity(
      snap.documentID,
      snap.data['name'],
      snap.data['description'],
      snap.data['private'],
      snap.data['orders'],
      snap.data['dividend'],
    );
  }

  static List<PortfolioEntity> load() {
    List<PortfolioEntity> items = [];
    String portfolioString = PrefService.getString(PORTFOLIO_PERF_KEY) ?? null;

    if (portfolioString != null) {
      Map<String, dynamic> portfolios = jsonDecode(portfolioString);
      items = (portfolios['items'] as List)
          .map((i) => PortfolioEntity.fromJson(i))
          .toList();
    }
    return items;
  }

  static save(PortfolioEntity item) {
    List<PortfolioEntity> items = load();
    // remove old item
    int index = items.indexWhere((st) => st.name == item.name);
    if (index > -1) {
      items.removeAt(index);
      items.insert(index, item);
    } else {
      items.add(item);
    }

    Map<String, dynamic> portfolios = {
      'items': items.map((i) => i.toJson()).toList()
    };
    String portfoliosString = jsonEncode(portfolios);
    PrefService.setString(PORTFOLIO_PERF_KEY, portfoliosString);
  }

  static delete(PortfolioEntity item) {
    List<PortfolioEntity> items = load();
    items.removeWhere((x) => item.name == x.name);
    Map<String, dynamic> portfolios = {
      'items': items.map((i) => i.toJson()).toList()
    };
    String portfoliosString = jsonEncode(portfolios);
    PrefService.setString(PORTFOLIO_PERF_KEY, portfoliosString);
  }

  Map<String, Object> toDocument() {
    return toJson();
  }

  @override
  List<Object> get props =>
      [id, name, description, isPrivate, orders, dividends];

  double getYield() {
    var mydepot = getDepot();
    var filterdData = mydepot.values
        .toList()
        .where((test) => test.performance != double.negativeInfinity)
        .toList();
    var yieldOverall = filterdData.fold(0, (prev, element) {
      return prev + element.performance;
    });
    return yieldOverall / filterdData.length;
  }

  Map<String, double> getValues() {
    Map<String, double> values = {};
    for (Orders order in this.orders) {
      if (values.containsKey(order.price.currency)) {
        values[order.price.currency] += order.price.price;
      } else {
        values[order.price.currency] = order.price.price;
      }
    }
    return values;
  }

  Set<String> getCurrencies() {
    return this.orders.map((f) {
      return f.price.currency;
    }).toSet();
  }

  Map<String, DepotItem> getDepot() {
    var currencies = this.getCurrencies();
    Map<String, DepotItem> items = {};
    currencies.forEach((f) {
      this.orders.where((order) => order.price.currency == f).map((i) {
        var label = '${i.symbol} ${i.price.currency}';
        if (items.containsKey(label)) {
          items[label].add(i);
        } else {
          items[label] = DepotItem(i);
        }
      }).toList();
    });
    items.forEach((key, value) {
      dividends.where((div) => div.symbol == value.symbol).forEach((div) => value.addDividends(div));
    });
    return items;
  }

  void updatePrices(List<StockEntity> stockItems) {
    if (stockItems != null) {
      this.stockItems = stockItems;
      this.orders.forEach((order) {
        var stock = stockItems.firstWhere((stock) => stock.name == order.name);
        var priceNow = stock.prices[order.symbol];
        order.priceNow = priceNow.price;
      });
    }
  }
}

class Orders {
  final Price price;
  final double amount;
  final String symbol;
  final String name;
  final DateTime date;
  double priceNow;

  Orders(this.price, this.amount, this.date, this.symbol, this.name,
      this.priceNow);

  Map<String, dynamic> toJson() {
    return {
      'price': price.toJson(),
      'amount': amount,
      'date': date.toString(),
      'symbol': symbol,
      'name': name,
      'priceNow': priceNow
    };
  }

  @override
  String toString() {
    return 'Orders { price: $price, amount: $amount, date: $date, symbol: $symbol }';
  }

  static Orders fromJson(Map<dynamic, dynamic> json) {
    return Orders(
        Price.fromJson(json['price']),
        json['amount'] as double,
        DateTime.parse(json['date']),
        json['symbol'] as String,
        json['name'] as String,
        json['priceNow'] as double);
  }
}

class Dividend {
  final Price dividend;
  final String symbol;
  final DateTime date;

  Dividend(this.dividend, this.symbol, this.date);

  Map<String, dynamic> toJson() {
    return {
      'dividend': dividend.toJson(),
      'symbol': symbol,
      'date': date.toString(),
    };
  }

  @override
  String toString() {
    return 'Dividend { price: $dividend, symbol: $symbol, date: $date}';
  }

  static Dividend fromJson(Map<dynamic, dynamic> json) {
    return Dividend(Price.fromJson(json['dividend']), json['symbol'] as String,
        DateTime.parse(json['date']));
  }
}
