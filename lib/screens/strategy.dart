import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:portoli/bloc/bloc.dart';
import 'package:portoli/constants/colors.dart';
import 'package:portoli/entities/strategy.dart';
import 'package:portoli/entities/strategy_item.dart';
import 'package:portoli/widgets/loading.dart';

class StrategyView extends StatelessWidget {
  StrategyView(this.strategyItem);
  final StrategyEntity strategyItem;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<StockBloc>(context).add(StockEventLoad(strategyItem));
    return Scaffold(
      body: StockList(
        query: strategyItem.toQuery(),
        filterName: strategyItem.filterName,
      ),
    );
  }
}

class StockList extends StatelessWidget {
  const StockList({
    @required this.query,
    @required this.filterName,
  })  : assert(query != null),
        assert(filterName != null);

  final Query query;
  final String filterName;

  @override
  Widget build(BuildContext context) {
    final startegyItemBloc = BlocProvider.of<StockBloc>(context);
    return Scaffold(
      body: BlocBuilder(
        bloc: startegyItemBloc,
        builder: (context, state) {
          if (state is StockStateLoaded) {
            return ListView.builder(
              itemCount: state.strategyItems.length,
              itemBuilder: (context, index) {
                StockEntity stock = state.strategyItems[index];
                Filter myFilter = stock.getFilter(filterName);
                if (myFilter != null) {
                  return InkWell(
                    onTap: () {
                      BlocProvider.of<NavDrawerBloc>(context)
                          .add(NavEventStock(stock));
                    },
                    child: FilterItem(
                        filter: myFilter,
                        circleText: stock.name[0],
                        title: stock.name,
                        subTitle: stock.symbols[0],
                        color: nameToColor(stock.name)),
                  );
                }
              },
            );
          }
          return Container(
            color: Colors.lightBlue,
            child: Center(
              child: LoadingWidget(),
            ),
          );
        },
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  const FilterItem(
      {@required this.filter,
      @required this.color,
      @required this.circleText,
      @required this.title,
      @required this.subTitle})
      : assert(filter != null),
        assert(circleText != null),
        assert(title != null),
        assert(subTitle != null),
        assert(color != null);

  final Filter filter;
  final Color color;
  final String circleText;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    Color borderColor = statusColorMap[filter.status] ?? Colors.transparent;
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: 130),
      child: Card(
        elevation: 2,
        child: ClipPath(
          child: Container(
            height: 100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: color,
                    child: Text(circleText.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                  ),
                  title: Text(title),
                  subtitle: Text(subTitle),
                ),
                Center(
                    child: Text(
                        filter.prefix + filter.value + filter.suffix))
              ],
            ),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: borderColor, width: 15),
              ),
            ),
          ),
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
      ),
    );
  }
}
