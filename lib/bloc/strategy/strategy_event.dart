import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:portoli/entities/strategy.dart';

@immutable
abstract class StrategyEvent extends Equatable {
  const StrategyEvent();
}


class StrategyEventLoad extends StrategyEvent {
  @override
  String toString() => 'StrategyEventLoad';

    @override
  List<Object> get props => [];
}


class StrategyEventLoaded extends StrategyEvent {
  final List<StrategyEntity> strategyItems;

  StrategyEventLoaded(this.strategyItems);

  @override
  String toString() => 'StrategyEventLoaded';

    @override
  List<Object> get props => [strategyItems];
}
