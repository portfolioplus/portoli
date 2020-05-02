import 'package:equatable/equatable.dart';
import 'package:portoli/entities/strategy.dart';
import 'package:portoli/entities/strategy_item.dart';

abstract class StockEvent extends Equatable {
  const StockEvent();
}

class StockEventInitial extends StockEvent {
  @override
  String toString() => 'StockEventInitial';
  @override
  List<Object> get props => [];
}

class StockEventLoad extends StockEvent {
  final StrategyEntity strategyItem;

  StockEventLoad(this.strategyItem);

  @override
  String toString() => 'StockEventLoad';

  @override
  List<Object> get props => [strategyItem];
}

class StockEventLoaded extends StockEvent {
  final List<StockEntity> items;

  StockEventLoaded(this.items);
  @override
  String toString() => 'StockEventLoaded';

  @override
  List<Object> get props => [items];
}

class StockEventCurrency extends StockEvent {
  final String currency;

  StockEventCurrency(this.currency);
  @override
  String toString() => 'StockEventCurrency';

  @override
  List<Object> get props => [currency];
}
