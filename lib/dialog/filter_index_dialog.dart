import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preferences/switch_preference.dart';
import 'package:portoli/bloc/stock/stock_bloc.dart';
import 'package:portoli/bloc/stock/stock_event.dart';
import 'package:portoli/constants/stocks.dart';
import 'package:portoli/entities/strategy.dart';

class FilterIndexDialog extends StatelessWidget {
  final StrategyEntity strategy;

  const FilterIndexDialog(this.strategy);

  @override
  Widget build(BuildContext context) {
    var simpleDialog = SimpleDialog(
      title: Text('Filter Indices'),
      children: INDICES
          .map(
            (index) => SwitchPreference(
              index,
              index,
              defaultVal: true,
              onChange: () {
                BlocProvider.of<StockBloc>(context)
                    .add(StockEventLoad(strategy));
              },
            ),
          )
          .toList(),
    );
    return simpleDialog;
  }
}
