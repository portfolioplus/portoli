import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:portoli/entities/strategy.dart';

@immutable
abstract class StrategyState extends Equatable {
  const StrategyState();
}

class StrategyStateLoading extends StrategyState {
  @override
  String toString() => 'StrategyStateLoading';

  @override
  List<Object> get props => [];
}

class StrategyStateLoaded extends StrategyState {
  final List<StrategyEntity> strategies;

  StrategyStateLoaded(this.strategies);

  @override
  String toString() => 'StrategyStateLoaded { Strategy: $strategies }';

    @override
  List<Object> get props => [strategies];
}

class StrategyStateNotLoaded extends StrategyState {
  @override
  String toString() => 'StrategyStateNotLoaded';

    @override
  List<Object> get props => [];
}
