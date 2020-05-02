import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:portoli/constants/stocks.dart';

import 'entity.dart';

class Price {
  final double price;
  final String currency;

  Price(this.price, this.currency)
      : assert(price != null),
        assert(currency != null);

  Map<String, dynamic> toJson() => {'price': price, 'currency': currency};

  Price.fromJson(Map<dynamic, dynamic> json)
      : price = json['price'],
        currency = json['currency'];

  @override
  String toString() =>  NumberFormat.currency(symbol: currency).format(price); 

  Price singlePrice(double amount) {
    return Price(this.price/amount, this.currency);
  }

  Price singlePriceNow(double priceNow) {
      return Price(priceNow, this.currency);
  }

}

class Filter {
  final String value;
  final String name;
  final String suffix;
  final String prefix;
  final int status;

  Filter(this.value, this.name, this.suffix, this.prefix, this.status)
      : assert(value != null),
        assert(name != null),
        assert(suffix != null),
        assert(prefix != null),
        assert(status != null);

  Map<String, dynamic> toJson() => {
        'value': value,
        'name': name,
        'suffix': suffix,
        'prefix': prefix,
        'status': status,
      };
}

class StockEntity extends Equatable implements Entity {
  final String id;
  final String name;
  final List<dynamic> industries;
  final Map<String, Price> prices;
  final List<Filter> filters;
  final String country;
  final List<dynamic> symbols;
  final List<dynamic> indices;

  StockEntity(this.id, this.name, this.industries, this.prices, this.filters,
      this.country, this.symbols, this.indices);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'industries': industries,
        'prices': prices,
        'filters': filters,
        'country': country,
        'symbols': symbols,
        'indices': indices
      };

  @override
  String toString() => 'StockItem { id: $id, name: $name, country: $country }';

  static StockEntity fromJson(Map<String, dynamic> json) {
    return StockEntity(
      json['id'] as String,
      json['name'] as String,
      json['industries'] as List<String>,
      json['prices'] as Map<String, Price>,
      json['filters'] as List<Filter>,
      json['country'] as String,
      json['symbols'] as List<String>,
      json['indices'] as List<String>,
    );
  }

  static StockEntity fromSnapshot(DocumentSnapshot snap) {
    List<Filter> filters = [];
    snap.data.forEach((final String key, final value) {
      if (key.contains('_status')) {
        String filterName = key.replaceFirst('_status', '');
        String filterValue = '';
        if (snap.data[filterName + '_value'] is double) {
          filterValue = snap.data[filterName + '_value'].toStringAsFixed(2);
        } else {
          filterValue = snap.data[filterName + '_value'];
        }
        filters.add(Filter(
            filterValue,
            filterName,
            snap.data[filterName + '_suffix'] ?? "",
            snap.data[filterName + '_prefix'] ?? "",
            value));
      }
    });
    // create price map
    Map<String, Price> prices = {};
    var piceCurPair = [[snap.data['last_price_usd'], USD], [snap.data['last_price_eur'], EUR]];
    piceCurPair.forEach((priceCur)
    {
      priceCur[0]?.entries?.forEach((price)
      {
        double value = price.value != null ? price.value : -1;
        prices[price.key] = Price(value, priceCur[1]);
      });
    });
    return StockEntity(
        snap.documentID,
        snap.data['name'],
        snap.data['tags'],
        prices,
        filters,
        snap.data['country'],
        [...snap.data['symbols_usd'], ...snap.data['symbols_eur']],
        snap.data['indices']);
  }

  Map<String, Object> toDocument() {
    return toJson();
  }

  Filter getFilter(String filterName) {
    Filter myFilter;
    this.filters.forEach((f) {
      if (f.name == filterName) {
        myFilter = f;
      }
    });
    return myFilter;
  }

  @override
  List<Object> get props =>
      [id, name, industries, prices, filters, country, symbols, indices];
}
