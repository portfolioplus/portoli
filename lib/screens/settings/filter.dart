import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portoli/entities/strategy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preferences/preference_service.dart';
import 'package:preferences/switch_preference.dart';
import 'package:portoli/bloc/bloc.dart';
import 'package:portoli/bloc/stock/stock_bloc.dart';

class SettingsFilterView extends StatelessWidget {
  final List<String> filterItems;
  final StrategyEntity strategy;
  final String title;

  const SettingsFilterView(
      {Key key, this.filterItems, this.title, this.strategy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = filterItems
        .map(
          (index) => _createSwitch(index, context),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: items,
      ),
    );
  }

  SwitchPreference _createSwitch(String name, BuildContext context) {
    // create default values
    if (PrefService.getBool(name) == null) {
      PrefService.setBool(name, true);
    }

    return SwitchPreference(
      name,
      name,
      defaultVal: true,
      onChange: () {
        if (strategy != null) {
          BlocProvider.of<StockBloc>(context).add(StockEventLoad(strategy));
        }
      },
    );
  }
}
