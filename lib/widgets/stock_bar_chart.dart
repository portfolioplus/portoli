import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portoli/constants/colors.dart';
import 'package:portoli/entities/portfolio.dart';

class StockBarChart extends StatefulWidget {
  final List<BarChartGroupData> data;
  final Map<int, String> titles;
  final double interval;

  const StockBarChart(
      {Key key,
      @required this.data,
      @required this.titles,
      @required this.interval})
      : super(key: key);

  static Map<String, Object> generateData(
      List<Dividend> dividends,
      Function dateGroupFunc,
      Function dateFilterFunc,
      int barSize,
      String dateFormat) {
    // generate dates
    var map = List<int>.generate(barSize, (i) => i).map(dateGroupFunc);
    var dates = map.toList().reversed.toList();
    // generate titles
    var titles = dates
        .map((date) => DateFormat(dateFormat).format(date))
        .toList()
        .asMap();
    // group dividends
    var cluster = dates
        .map((date) =>
            dividends.where(((div) => dateFilterFunc(date, div))).toList())
        .toList();
    var data = cluster.asMap().entries.map((f) {
      double start = 0;
      List<BarChartRodStackItem> stack = [];
      f.value.forEach((div) {
        stack.add(BarChartRodStackItem(
            start, start + div.dividend.price, nameToColor(div.symbol)));
        start += div.dividend.price;
      });
      return BarChartGroupData(
        x: f.key,
        barsSpace: 4,
        showingTooltipIndicators: [0],
        barRods: [
          BarChartRodData(
              y: start, rodStackItem: stack, isRound: false, width: 25),
        ],
      );
    }).toList();

    double interval = data.fold(
        10,
        (curr, next) =>
            max(curr, next.barRods.length > 0 ? next.barRods[0].y : 0));
    if (interval != 10) {
      interval /= 4;
    }
    return {'data': data, 'titles': titles, 'interval': interval};
  }

  @override
  State<StatefulWidget> createState() => StockBarChartState();
}

class StockBarChartState extends State<StockBarChart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.66,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.center,
              barTouchData: BarTouchData(
                enabled: true,
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.transparent,
                  tooltipPadding: const EdgeInsets.all(0),
                  tooltipBottomMargin: 8,
                  getTooltipItem: (
                    BarChartGroupData group,
                    int groupIndex,
                    BarChartRodData rod,
                    int rodIndex,
                  ) {
                    return BarTooltipItem(
                      "Hallo",
                      TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  textStyle:
                      TextStyle(color: const Color(0xff939393), fontSize: 10),
                  margin: 10,
                  getTitles: (double value) {
                    return this.widget.titles[value.toInt()];
                  },
                ),
                leftTitles: SideTitles(
                  showTitles: true,
                  textStyle: TextStyle(
                      color: const Color(
                        0xff939393,
                      ),
                      fontSize: 10),
                  getTitles: (double value) {
                    return value.toInt().toString();
                  },
                  interval: this.widget.interval,
                  margin: 0,
                ),
              ),
              gridData: FlGridData(
                show: true,
                checkToShowHorizontalGrid: (value) =>
                    value % this.widget.interval == 0,
                getDrawingHorizontalGridLine: (value) => const FlLine(
                  color: Color(0xffe7e8ec),
                  strokeWidth: 1,
                ),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              groupsSpace: 4,
              barGroups: this.widget.data,
            ),
            swapAnimationDuration: Duration.zero,
          ),
        ),
      ),
    );
  }
}
