import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:preferences/preference_service.dart';
import 'package:portoli/bloc/nav/nav_bloc.dart';
import 'package:portoli/bloc/nav/nav_event.dart';
import 'package:portoli/bloc/portfolio/port_bloc.dart';
import 'package:portoli/bloc/portfolio/port_event.dart';
import 'package:portoli/bloc/portfolio/port_state.dart';
import 'package:portoli/constants/colors.dart';
import 'package:portoli/constants/perf_keys.dart';
import 'package:portoli/constants/stocks.dart';
import 'package:portoli/entities/chart_item.dart';
import 'package:portoli/entities/portfolio.dart';
import 'package:portoli/widgets/chart_btn.dart';
import 'package:portoli/widgets/expandable.dart';
import 'package:portoli/widgets/loading.dart';
import 'package:portoli/widgets/no_data.dart';
import 'package:portoli/widgets/portfolio_slider.dart';
import 'package:portoli/widgets/stock_bar_chart.dart';
import 'package:portoli/widgets/stock_pie_chart.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PortfolioView extends StatelessWidget {
  final PortfolioEntity portfolio;

  var barCartCtx = 2;

  PortfolioView(this.portfolio);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: BlocProvider.of<PortfolioBloc>(context),
        builder: (context, state) {
          if (state is PortfolioStateLoading) {
            return Container(
              color: Colors.lightBlue,
              child: Center(
                child: LoadingWidget(),
              ),
            );
          }

          final List<Widget> _widgets = [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: const Text(
                'Depot',
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            PortfolioSlider(items: this.portfolio.getDepot()),
            _buildChartValue(context),
            _buildChartDiversification(context),
            _buildOrderHistory(context),
            _buildDividendHistory(context),
            _buildIndicators(context),
          ];
          return ListView.builder(
            itemCount: _widgets.length,
            itemBuilder: (context, index) {
              return _widgets[index];
            },
          );
        },
      ),
    );
  }

  Widget _buildChartDiversification(BuildContext context) {
    return Expandable(
      perfKey: PORTFOLIO_DIVERS_KEY,
      title: 'Diversification',
      children: [
        BlocBuilder(
          bloc: BlocProvider.of<PortfolioDividendBloc>(context),
          builder: (BuildContext context, PortfolioState state) {
            if (state is PortfolioStateIndexChart) {
              var data = _dataListItem('indices');
              var sections = StockPieChart.generateData(data, -1);
              return StockPieChart(data: data, sections: sections);
            } else if (state is PortfolioStateIndustryChart) {
              var data = _dataListItem('tags');
              var sections = StockPieChart.generateData(data, -1);
              return StockPieChart(data: data, sections: sections);
            } else {
              var data = _dataCountry();
              var sections = StockPieChart.generateData(data, -1);
              return StockPieChart(data: data, sections: sections);
            }
          },
        ),
        Wrap(
          runSpacing: 5.0,
          spacing: 5.0,
          children: <Widget>[
            ChartButton(
                icon: Icons.public,
                onPressed: () {
                  BlocProvider.of<PortfolioDiversificationBloc>(context)
                      .add(PortfolioEventCountryChart());
                }),
            ChartButton(
                icon: Icons.category,
                onPressed: () {
                  BlocProvider.of<PortfolioDiversificationBloc>(context)
                      .add(PortfolioEventIndexChart());
                }),
            ChartButton(
                icon: MdiIcons.factoryIcon,
                onPressed: () {
                  BlocProvider.of<PortfolioDiversificationBloc>(context)
                      .add(PortfolioEventIndustryChart());
                }),
          ],
        ),
      ],
    );
  }

  Widget _buildChartValue(BuildContext context) {
    var now = DateTime.now();
    return Expandable(
      perfKey: PORTFOLIO_VALUE_KEY,
      title: 'Earnings',
      children: [
        BlocBuilder<PortfolioDividendBloc, PortfolioState>(
          builder: (BuildContext context, PortfolioState state) {
            if (state is PortfolioStateBarChart) {
              var val = StockBarChart.generateData(
                  this.portfolio.dividends,
                  (d) => DateTime(now.year, now.month - d, 1),
                  (DateTime date, Dividend val) =>
                      val.date.year == date.year &&
                      val.date.month == date.month,
                  12,
                  'MMM');
              return StockBarChart(
                titles: val['titles'] as Map<int, String>,
                data: val['data'] as List<BarChartGroupData>,
                interval: val['interval'],
              );
            } else if (state is PortfolioStateBarChartYear) {
              var val = StockBarChart.generateData(
                  this.portfolio.dividends,
                  (int d) => DateTime(now.year - d, now.month, 1),
                  (DateTime date, Dividend val) => val.date.year == date.year,
                  5,
                  'y');
              return StockBarChart(
                titles: val['titles'] as Map<int, String>,
                data: val['data'] as List<BarChartGroupData>,
                interval: val['interval'],
              );
            } else {
              String currency = "";
              Map<String, double> valueMap = {};
              this.portfolio.getDepot().entries.forEach(
                (item) {
                  currency = item.value.currency;
                  valueMap[item.value.symbol] = item.value.value;
                  if (item.value.dividends > 0) {
                    valueMap['Dividend ${item.value.symbol}'] =
                        item.value.dividends;
                  }
                },
              );
              List<ChartItem> data = [];
              valueMap.forEach((key, value) {
                data.add(ChartItemCurrency(currency, key, value));
              });
              List<PieChartSectionData> sections =
                  StockPieChart.generateData(data, -1);
              return StockPieChart(
                data: data,
                sections: sections,
              );
            }
          },
        ),
        Wrap(
          runSpacing: 5.0,
          spacing: 5.0,
          children: <Widget>[
            ChartButton(
                icon: Icons.pie_chart,
                onPressed: () {
                  BlocProvider.of<PortfolioDividendBloc>(context)
                      .add(PortfolioEventPieChart());
                }),
            ChartButton(
                icon: MdiIcons.chartBar,
                onPressed: () {
                  BlocProvider.of<PortfolioDividendBloc>(context)
                      .add(PortfolioEventBarChart());
                }),
            ChartButton(
                icon: MdiIcons.chartBarStacked,
                onPressed: () {
                  BlocProvider.of<PortfolioDividendBloc>(context)
                      .add(PortfolioEventBarChartYear());
                }),
          ],
        ),
      ],
    );
  }

  Widget _buildIndicators(BuildContext context) {
    String allowedStrategiesStr =
        PrefService.getString(ALLOWED_STRATEGIES_KEY) ?? null;

    if (allowedStrategiesStr != null) {
      var allowedStrategies = jsonDecode(allowedStrategiesStr);
      var cells = this.portfolio.stockItems.map<DataRow>((stockItem) {
        var filterList = allowedStrategies.map<DataCell>((f) {
          var item = stockItem.filters
              .firstWhere((test) => test.name == f, orElse: () => null);
          if (item != null) {
            String statusMsg = 'sell';
            if (item.status == 2) {
              statusMsg = 'buy';
            } else if (item.status == 1) {
              statusMsg = 'hold';
            }
            return DataCell(
              Container(
                color: statusColorMap[item.status],
                width: 100.0,
                child: Center(
                  child: Text(
                    statusMsg,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          } else {
            return DataCell(
              Container(
                color: Colors.grey,
                width: 100.0,
                child: Center(
                  child: Text(
                    '-',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          }
        }).toList();
        filterList.insert(0, DataCell(Text(stockItem.name)));
        return DataRow(cells: filterList);
      }).toList();
      var colHeader = allowedStrategies
          .map<DataColumn>((f) => DataColumn(label: Text(f)))
          .toList();
      colHeader.insert(
        0,
        DataColumn(
          label: Text('Stock'),
        ),
      );
      return Expandable(
          perfKey: PORTFOLIO_ANALYSIS_KEY,
          title: 'Technical analysis',
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: colHeader,
                rows: cells,
              ),
            ),
          ]);
    }
    return NoData();
  }

  Widget _buildOrderHistory(BuildContext context) {
    var orders = this.portfolio.orders.map(
      (order) {
        return DataRow(cells: [
          DataCell(Text(order.symbol)),
          DataCell(Text(order.price.singlePrice(order.amount).toString())),
          DataCell(Text(order.price.singlePriceNow(order.priceNow).toString())),
          DataCell(Text(order.amount.toString())),
          DataCell(Text(order.price.toString())),
          DataCell(Text(DateFormat.yMMMd().format(order.date))),
          DataCell(Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ButtonTheme(
                minWidth: 50.0,
                child: RaisedButton(
                  padding: EdgeInsets.all(1.0),
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () => BlocProvider.of<NavDrawerBloc>(context)
                      .add(NavEventEditOrder(context, this.portfolio, order)),
                  child: Icon(
                    Icons.edit,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 5),
              ButtonTheme(
                minWidth: 50.0,
                child: RaisedButton(
                  padding: EdgeInsets.all(1.0),
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: () => BlocProvider.of<NavBloc>(context)
                      .add(NavEventDeleteOrder(context, this.portfolio, order)),
                  child: Icon(
                    Icons.delete,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )),
        ]);
      },
    ).toList();
    return Expandable(
      perfKey: PORTFOLIO_HIST_KEY,
      title: 'Order History',
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(
                label: Text('Symbol'),
              ),
              DataColumn(
                label: Text('Price'),
              ),
              DataColumn(
                label: Text('Price now'),
              ),
              DataColumn(
                label: Text('Amount'),
              ),
              DataColumn(
                label: Text('Total'),
              ),
              DataColumn(
                label: Text('Date'),
              ),
              DataColumn(
                label: Text(''), // for delete button
              )
            ],
            rows: orders,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Center(
            child: RaisedButton(
              padding: EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () => BlocProvider.of<NavDrawerBloc>(context)
                  .add(NavEventAddOrder(this.portfolio)),
              child: new Text("Add"),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDividendHistory(BuildContext context) {
    var orders = this.portfolio.dividends.map(
      (dividend) {
        return DataRow(cells: [
          DataCell(Text(dividend.symbol)),
          DataCell(Text(dividend.dividend.toString())),
          DataCell(Text(DateFormat.yMMMd().format(dividend.date))),
          DataCell(Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ButtonTheme(
                minWidth: 50.0,
                child: RaisedButton(
                  padding: EdgeInsets.all(1.0),
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () => BlocProvider.of<NavDrawerBloc>(context).add(
                      NavEventEditDividend(context, this.portfolio, dividend)),
                  child: Icon(
                    Icons.edit,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 5),
              ButtonTheme(
                minWidth: 50.0,
                child: RaisedButton(
                  padding: EdgeInsets.all(1.0),
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: () => BlocProvider.of<NavBloc>(context).add(
                      NavEventDeleteDividend(
                          context, this.portfolio, dividend)),
                  child: Icon(
                    Icons.delete,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )),
        ]);
      },
    ).toList();
    return Expandable(
      perfKey: PORTFOLIO_DIVIDEND_KEY,
      title: 'Dividend History',
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(
                label: Text('Symbol'),
              ),
              DataColumn(
                label: Text('Dividend'),
              ),
              DataColumn(
                label: Text('Date'),
              ),
              DataColumn(
                label: Text(''), // for delete button
              )
            ],
            rows: orders,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Center(
            child: RaisedButton(
              padding: EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () => BlocProvider.of<NavDrawerBloc>(context)
                  .add(NavEventAddDividend(this.portfolio)),
              child: new Text("Add"),
            ),
          ),
        ),
      ],
    );
  }

  // todo: fix code redundance later
  List _dataListItem(String key) {
    double totalValue = 0;
    Map<String, double> valueMap = {};
    this.portfolio.orders.forEach(
      (order) {
        var value = order.price.price;

        var stock = STOCKS.firstWhere((item) =>
            item['symbols_eur'].contains(order.symbol) ||
            item['symbols_usd'].contains(order.symbol));
        stock[key].forEach((item) {
          if (valueMap.containsKey(item)) {
            valueMap[item] += value;
          } else {
            valueMap[item] = value;
          }
          totalValue += value;
        });
      },
    );
    List<ChartItem> data = [];
    valueMap.forEach((key, value) {
      data.add(ChartItem(key, (value) / totalValue));
    });

    return data;
  }

  List _dataCountry() {
    double totalValue = 0;
    Map<String, double> valueMap = {};
    this.portfolio.orders.forEach(
      (order) {
        var value = order.price.price;
        totalValue += value;
        var stock = STOCKS.firstWhere((item) =>
            item['symbols_eur'].contains(order.symbol) ||
            item['symbols_usd'].contains(order.symbol));

        if (valueMap.containsKey(stock['country'])) {
          valueMap[stock['country']] += value;
        } else {
          valueMap[stock['country']] = value;
        }
      },
    );
    List<ChartItem> data = [];
    valueMap.forEach((key, value) {
      data.add(ChartItem(key, (value) / totalValue));
    });

    return data;
  }
}
