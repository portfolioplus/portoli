import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:portoli/entities/strategy_item.dart';

@immutable
abstract class StockState extends Equatable {
  const StockState();
}

class StockStateLoading extends StockState {
  @override
  String toString() => 'StockStateLoading';
  
  @override
  List<Object> get props => [];
}

class StockStateLoaded extends StockState {
  final List<StockEntity> strategyItems;

  StockStateLoaded(this.strategyItems);

  @override
  String toString() => 'StockStateLoaded { Strategy: $strategyItems }';

  @override
  List<Object> get props => [strategyItems];
}

class StockStateNotLoaded extends StockState {
  @override
  String toString() => 'StockItemNotLoaded';

  @override
  List<Object> get props => [];
}

class StockStateCurrency extends StockState {
  final String currency;

  StockStateCurrency(this.currency);

  @override
  String toString() => 'StockStateCurrency { currency: $currency }';

  @override
  List<Object> get props => [currency];
}
