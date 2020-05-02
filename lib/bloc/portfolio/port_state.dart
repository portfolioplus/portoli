import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:portoli/entities/portfolio.dart';

@immutable
abstract class PortfolioState extends Equatable {
  const PortfolioState();
}

class PortfolioStateLoading extends PortfolioState {
  @override
  String toString() => 'PortfolioStateLoading';

  @override
  List<Object> get props => [];
}

class PortfolioStateLoaded extends PortfolioState {
  final List<PortfolioEntity> portfolioItems;

  PortfolioStateLoaded(this.portfolioItems);

  @override
  String toString() => 'StockStateLoaded { Strategy: $portfolioItems }';

  @override
  List<Object> get props => [portfolioItems];
}

class PortfolioStateNotLoaded extends PortfolioState {
  @override
  String toString() => 'PortfolioStateNotLoaded';

  @override
  List<Object> get props => [];
}

class PortfolioStateSave extends PortfolioState {
  @override
  String toString() => 'PortfolioStateSave';

  @override
  List<Object> get props => [];
}

class PortfolioStateSaveErrName extends PortfolioState {
  PortfolioStateSaveErrName();
  @override
  String toString() => 'PortfolioStateSaveErrName';

  @override
  List<Object> get props => [];
}

class PortfolioStateSaveBack extends PortfolioState {
  PortfolioStateSaveBack();
  @override
  String toString() => 'PortfolioStateSaveBack';

  @override
  List<Object> get props => [];
}

class PortfolioStateSaveErrNameReset extends PortfolioState {
  PortfolioStateSaveErrNameReset();
  @override
  String toString() => 'PortfolioStateSaveErrNameReset';

  @override
  List<Object> get props => [];
}

class PortfolioStateSaveErrNameDuplicate extends PortfolioState {
  PortfolioStateSaveErrNameDuplicate();
  @override
  String toString() => 'PortfolioStateSaveErrNameDuplicate';

  @override
  List<Object> get props => [];
}

class PortfolioStateSelect extends PortfolioState {
  final PortfolioEntity item;

  PortfolioStateSelect(this.item);

  @override
  String toString() => 'PortfolioStateSelect';

  @override
  List<Object> get props => [item];
}

class PortfolioStatePieChart extends PortfolioState {
  PortfolioStatePieChart();
  @override
  String toString() => 'PortfolioStatePieChart';

  @override
  List<Object> get props => [];
}

class PortfolioStateBarChart extends PortfolioState {
  PortfolioStateBarChart();
  @override
  String toString() => 'PortfolioStateBarChart';

  @override
  List<Object> get props => [];
}

class PortfolioStateBarChartYear extends PortfolioState {
  PortfolioStateBarChartYear();
  @override
  String toString() => 'PortfolioStateBarChartYear';

  @override
  List<Object> get props => [];
}

class PortfolioStateIndexChart extends PortfolioState {
  PortfolioStateIndexChart();
  @override
  String toString() => 'PortfolioStateIndexChart';

  @override
  List<Object> get props => [];
}

class PortfolioStateIndustryChart extends PortfolioState {
  PortfolioStateIndustryChart();
  @override
  String toString() => 'PortfolioStateIndustryChart';

  @override
  List<Object> get props => [];
}

class PortfolioStateCountryChart extends PortfolioState {
  PortfolioStateCountryChart();
  @override
  String toString() => 'PortfolioStateCountryChart';

  @override
  List<Object> get props => [];
}
