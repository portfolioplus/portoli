import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portoli/entities/portfolio.dart';

import 'no_data.dart';

class PortfolioSlider extends StatelessWidget {
  final Map<String, DepotItem> items;

  const PortfolioSlider({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (items.entries.length == 0) {
      return NoData();
    }

    var sortedKeys = items.keys.toList()
      ..sort((a, b) => items[b].performance.compareTo(items[a].performance));
    Map<String, Color> depotColors = _createColorMap(items);

    return CarouselSlider(
      height: 100.0,
      enableInfiniteScroll: false,
      viewportFraction: 0.31,
      items: sortedKeys.map((key) {
        var entry = items[key];
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(color: depotColors[entry.symbol]),
              child: Column(children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${entry.symbol}',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '${entry.value}',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  (double.negativeInfinity == entry.performance)
                      ? 'Unknown'
                      : '${entry.performance.toStringAsFixed(2)} %',
                  style: TextStyle(color: Colors.white),
                )
              ]),
            );
          },
        );
      }).toList(),
    );
  }

  Map<String, Color> _createColorMap(Map<String, DepotItem> items) {
    Map<String, Color> depotColors = {};
    // min max
    double minVal = items.values
        .where((f) => f.performance != double.negativeInfinity)
        .fold(6000, (cur, next) => min(cur, next.performance));
    double maxVal =
        items.values.fold(0, (cur, next) => max(cur, next.performance));

    List<Color> myDepotColorsPositiv = [
      Colors.green,
      Colors.green[400],
      Colors.green[300],
      Colors.green[200],
      Colors.green[100],
      Colors.grey,
    ];

    List<Color> myDepotColorsNegativ = [
      Colors.red[100],
      Colors.red[200],
      Colors.red[300],
      Colors.red[400],
      Colors.red
    ];

    double diff = (maxVal - minVal).abs();
    items.values.forEach((item) {
      double perf = item.performance;
      List<Color> myDepotColors =
          (perf > 0) ? myDepotColorsPositiv : myDepotColorsNegativ;
      int colId = myDepotColors.length - 1;
      if (diff == 0) {
        if (perf > 0) {
          colId = 0;
        }
      } else {
        double step = diff / myDepotColors.length;
        Iterable<int>.generate(myDepotColors.length - 1).forEach((f) {
          if ((maxVal - step - step * f) <= perf &&
              perf <= (maxVal - step * f)) {
            colId = f;
          }
        });
      }
      depotColors[item.symbol] = myDepotColors[colId];
    });
    return depotColors;
  }
}