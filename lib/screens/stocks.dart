import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preferences/preference_service.dart';
import 'package:portoli/bloc/bloc.dart';
import 'package:portoli/bloc/stock/stock_bloc.dart';
import 'package:portoli/constants/colors.dart';
import 'package:portoli/constants/perf_keys.dart';
import 'package:portoli/constants/stocks.dart';
import 'package:portoli/entities/strategy_item.dart';
import 'package:portoli/screens/strategy.dart';
import 'package:portoli/widgets/no_data.dart';

class StockView extends StatelessWidget {
  StockView(this.stock);
  final StockEntity stock;

  List<String> _getPriceAndSymbol(StockState state) {
    String sym, cur = "";
    if (state is StockStateCurrency) {
      sym = stock.symbols.firstWhere(
          (test) =>
              state.currency == USD && !test.toString().endsWith('.F') ||
              state.currency == EUR && test.toString().endsWith('.F'),
          orElse: () => null);

      Price myPrice = stock.prices[sym] ?? null;
      if (myPrice != null && myPrice.price != -1.0) {
        cur = "~${myPrice.price.toStringAsFixed(2)}${myPrice.currency}";
        sym = "$sym ";
      } else {
        return null;
      }
    }
    return [cur, sym];
  }

  @override
  Widget build(BuildContext context) {
    final StockViewBloc startegyItemBloc =
        BlocProvider.of<StockViewBloc>(context);
    return Scaffold(
      body: BlocBuilder(
        bloc: startegyItemBloc,
        builder: (context, state) {
          var curSym = _getPriceAndSymbol(state);
          if (curSym == null) {
            return Center(child: NoData());
          }
          String cur = curSym[0];
          String sym = curSym[1];
          List<Widget> chips = [
            Chip(
                label:
                    Text(stock.country, style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.green)
          ];
          chips.addAll(stock.indices
              .map((f) => Chip(
                  label: Text(f, style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.redAccent))
              .toList());
          chips.addAll(stock.industries
              .map((f) => Chip(
                  label: Text(f, style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.lightBlue))
              .toList());
          String allowedStrategiesStr =
              PrefService.getString(ALLOWED_STRATEGIES_KEY) ?? null;
          List<FilterItem> filters = [];

          if (allowedStrategiesStr != null) {
            var allowedStrategies = jsonDecode(allowedStrategiesStr);
            filters = allowedStrategies
                .map<FilterItem>((f) {
                  var filter = stock.filters
                      .firstWhere((fi) => fi.name == f, orElse: () => null);
                  if (filter != null) {
                    return FilterItem(
                        filter: filter,
                        circleText: filter.name[0],
                        title: filter.name,
                        subTitle: "",
                        color: nameToColor(filter.name));
                  }
                  return null;
                })
                .where((ff) => ff != null).toList();
          }

          List<Widget> items = [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 2.5,
                children: [
                  RichText(
                    text: new TextSpan(
                      style: new TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: sym,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "${stock.name}",
                          style: TextStyle(fontSize: 30, color: Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  cur,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 2.5,
                children: chips,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 2.5,
                children: filters,
              ),
            ),
          ];
          return Scaffold(
            body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return items[index];
              },
            ),
          );
        },
      ),
    );
  }
}
