import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portoli/bloc/nav/nav_bloc.dart';
import 'package:portoli/bloc/nav/nav_event.dart';
import 'package:portoli/bloc/strategy/strategy_bloc.dart';
import 'package:portoli/bloc/strategy/strategy_state.dart';
import 'package:portoli/entities/strategy.dart';
import 'package:portoli/widgets/loading.dart';

class StrategiesView extends StatelessWidget {
  final Map<int, Color> _colorData = {
    0: Colors.blueAccent,
    1: Colors.redAccent,
    2: Colors.greenAccent,
    3: Colors.black12,
    4: Colors.yellowAccent,
    5: Colors.orangeAccent,
    6: Colors.purpleAccent,
    7: Colors.tealAccent,
    8: Colors.limeAccent,
    9: Colors.pink,
    10: Colors.lightBlue
  };

  final Map<int, IconData> _iconData = {
    0: Icons.trending_up,
    1: Icons.assessment,
    2: Icons.attach_money,
    3: Icons.alarm,
    4: Icons.gavel,
    5: Icons.flight_takeoff,
    6: Icons.grade,
    7: Icons.timeline,
    8: Icons.thumb_up,
    9: Icons.star,
    10: Icons.sentiment_very_satisfied
  };

  @override
  Widget build(BuildContext context) {
    final startegyBloc = BlocProvider.of<StrategyBloc>(context);
    return Scaffold(
      body: BlocBuilder(
        bloc: startegyBloc,
        builder: (context, state) {
          if (state is StrategyStateLoading) {
            return Container(
              color: Colors.lightBlue,
              child: Center(
                child: LoadingWidget(),
              ),
            );
          }
          if (state is StrategyStateLoaded) {
            return ListView.builder(
              itemCount: state.strategies.length,
              itemBuilder: (context, index) {
                return _makeCard(context, state.strategies[index]);
              },
            );
          }
          return Text('Unknown');
        },
      ),
    );
  }

  Widget _makeCard(BuildContext context, StrategyEntity strategy) {
    return InkWell(
      onTap: () {
        BlocProvider.of<NavDrawerBloc>(context)
            .add(NavEventStrategy(strategy));
      },
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(height: 130),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(_iconData[strategy.iconId],
                    size: strategy.iconSize.toDouble(),
                    color: _colorData[strategy.iconColor]),
                title: Text(strategy.title),
                subtitle: Text(strategy.description),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
