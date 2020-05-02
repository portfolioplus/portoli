import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:portoli/entities/chart_item.dart';
import 'package:portoli/constants/colors.dart';
import 'package:portoli/widgets/no_data.dart';
import 'indicator.dart';

class StockPieChart extends StatefulWidget {
  final List<ChartItem> data;
  List<PieChartSectionData> sections;
  
  StockPieChart({Key key, this.data, this.sections}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State();

  static   List<PieChartSectionData> generateData(List<ChartItem> data, int touchedIndex) {
    return List.generate(
      data.length,
      (i) {
        final isTouched = i == touchedIndex;
        final double fontSize = isTouched ? 25 : 16;
        final double radius = isTouched ? 60 : 50;
        var title = data[i].toString();
        return PieChartSectionData(
          color: nameToColor(data[i].group),
          value: data[i].val.toDouble(),
          title: title,
          radius: radius,
          showTitle: false,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      },
    );
  }
}

class PieChart2State extends State<StockPieChart> {

  int touchedIndex;
  String tooltip = "";
  Color tooltipColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    List<Widget> legend = this.widget.data.asMap().entries.map((item) {
      return Indicator(
        color: nameToColor(item.value.group),
        text: item.value.group,
        isSquare: true,
        onTapIndicator: () {
          setState(() {
            tooltip = item.value.toString();
            touchedIndex = item.key;
            tooltipColor = nameToColor(item.value.group);
            this.widget.sections = StockPieChart.generateData(this.widget.data, touchedIndex);
          });
        },
      );
    }).toList();
    if (legend.length == 0) {
      return Column(children: <Widget>[
        const SizedBox(
          height: 28,
        ),
        NoData(),
        const SizedBox(
          height: 28,
        ),
      ]);
    }
    return Container(
      child: Column(
        children: <Widget>[
          Wrap(
            runSpacing: 5.0,
            spacing: 5.0,
            children: legend,
          ),
          Container(
            height: (MediaQuery.of(context).size.width * 0.6).toDouble(),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: PieChart(
                            PieChartData(
                              pieTouchData: PieTouchData(
                                  touchCallback: (pieTouchResponse) {
                                setState(() {
                                  if (pieTouchResponse.touchedSectionIndex ==
                                          null &&
                                      this.widget.data.length == 1) {
                                    touchedIndex = 0;
                                  } else {
                                    touchedIndex =
                                        pieTouchResponse.touchedSectionIndex;
                                  }

                                  if (pieTouchResponse.touchInput
                                          is FlLongPressEnd ||
                                      pieTouchResponse.touchInput is FlPanEnd) {
                                    touchedIndex = -1;
                                    tooltip = "";
                                  }

                                  if (touchedIndex != null &&
                                      touchedIndex >= 0) {
                                    tooltipColor =
                                        nameToColor(this.widget.data[touchedIndex].group);
                                    tooltip = this.widget.data[touchedIndex].toString();
                                  }
                                  this.widget.sections = StockPieChart.generateData(this.widget.data, touchedIndex);
                                });
                              }),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 0,
                              centerSpaceRadius: 40,
                              sections: this.widget.sections,
                            ),
                            swapAnimationDuration: Duration.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    tooltip,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        background: Paint()
                          ..strokeWidth = 24.0
                          ..color = tooltipColor.withOpacity(0.5)
                          ..style = PaintingStyle.stroke
                          ..strokeJoin = StrokeJoin.round),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
