import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portoli/bloc/bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:portoli/bloc/portfolio/port_bloc.dart';
import 'package:portoli/bloc/portfolio/port_event.dart';
import 'package:portoli/bloc/portfolio/port_state.dart';
import 'package:portoli/constants/colors.dart';
import 'package:portoli/entities/portfolio.dart';
import 'package:portoli/entities/strategy_item.dart';
import 'package:portoli/screens/strategy.dart';
import 'package:portoli/widgets/loading.dart';

class PortfoliosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PortfolioBloc portfolioBloc = BlocProvider.of<PortfolioBloc>(context);
    return Scaffold(
      body: BlocBuilder(
        bloc: portfolioBloc,
        builder: (context, state) {
          if (state is PortfolioStateLoading) {
            return Container(
              color: Colors.lightBlue,
              child: Center(
                child: LoadingWidget(),
              ),
            );
          } else if (state is PortfolioStateLoaded) {
            if (state.portfolioItems.length > 0) {
              return ListView.builder(
                itemCount: state.portfolioItems.length,
                itemBuilder: (context, index) {
                  return _makeCard(context, state.portfolioItems[index]);
                },
              );
            }
          }
          return NoPortfolio();
        },
      ),
    );
  }

  Widget _makeCard(BuildContext context, PortfolioEntity portfolioItem) {
    int status = 0;
    double myYield = portfolioItem.getYield();
    String myYieldStr = myYield.isNaN ?  "" : "${myYield.toStringAsFixed(2)}%";
    if (myYield >= 1) {
      status = 2;
    } else if (myYield >= 0) {
      status = 1;
    }
    var values = portfolioItem.getValues();
    var valueList = [];
    values.forEach((currency, value) {
      valueList.add("$value$currency");
    });
    String valueStr = valueList.join(' ');
    valueStr = '$valueStr\n$myYieldStr';
    Filter myFilter =
        Filter( '', portfolioItem.name, valueStr, '', status);
    IconSlideAction delete = IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () {
          BlocProvider.of<PortfolioBloc>(context)
              .add(PortfolioEventDeleteItem(portfolioItem));
          _showSnackBar(context, 'Delete ${portfolioItem.name}');
        });
    IconSlideAction add = IconSlideAction(
        caption: 'Add',
        color: Colors.green,
        icon: Icons.add_circle,
        onTap: () {
          BlocProvider.of<NavDrawerBloc>(context)
              .add(NavEventAddOrder(portfolioItem));
        });
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: InkWell(
        onTap: () {
          BlocProvider.of<NavDrawerBloc>(context)
              .add(NavEventPortfolio(portfolioItem));
        },
        child: FilterItem(
            filter: myFilter,
            circleText: portfolioItem.name[0],
            title: portfolioItem.name,
            subTitle: portfolioItem.description,
            color: nameToColor(portfolioItem.name)),
      ),
      actions: <Widget>[delete, add],
      secondaryActions: <Widget>[delete, add],
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}

class NoPortfolio extends StatelessWidget {
  const NoPortfolio({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.sms_failed, size: 100, color: Colors.black26),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("No portfolios has been created yet."),
          ),
          OutlineButton(
            child: const Text('Add Portfolio',
                semanticsLabel: 'Add Portfolio 1'),
            onPressed: () {
              BlocProvider.of<NavDrawerBloc>(context)
                  .add(NavEventAddPortfolio());
            },
          )
        ],
      ),
    );
  }
}
