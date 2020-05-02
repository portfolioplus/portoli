import 'package:equatable/equatable.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:portoli/entities/portfolio.dart';

abstract class PortfolioEvent extends Equatable {
  const PortfolioEvent();
}

class PortfolioEventLoad extends PortfolioEvent {

  PortfolioEventLoad();

  @override
  String toString() => 'PortfolioEventLoad';

  @override
  List<Object> get props => [];
}

class PortfolioEventAddItem extends PortfolioEvent {
  final PortfolioEntity item;

  PortfolioEventAddItem(this.item);

  @override
  String toString() => 'PortfolioEventAddItem';

  @override
  List<Object> get props => [item];
}

class PortfolioEventDeleteItem extends PortfolioEvent {
  final PortfolioEntity item;

  PortfolioEventDeleteItem(this.item);

  @override
  String toString() => 'PortfolioEventDeleteItem';

  @override
  List<Object> get props => [item];
}

class PortfolioEventDeleteDividend extends PortfolioEvent {
  final PortfolioEntity portfolio;
  final Dividend dividend;

  PortfolioEventDeleteDividend(this.portfolio, this.dividend);

  @override
  String toString() => 'PortfolioEventDeleteDividend';

  @override
  List<Object> get props => [portfolio, dividend];
}

class PortfolioEventAddDividend extends PortfolioEvent {
  final PortfolioEntity portfolio;
  final Dividend dividend;

  PortfolioEventAddDividend(this.portfolio, this.dividend);

  @override
  String toString() => 'PortfolioEventAddDividend';

  @override
  List<Object> get props => [portfolio, dividend];
}

class PortfolioEventDeleteOrder extends PortfolioEvent {
  final PortfolioEntity portfolio;
  final Orders order;

  PortfolioEventDeleteOrder(this.portfolio, this.order);

  @override
  String toString() => 'PortfolioEventDeleteOrder';

  @override
  List<Object> get props => [portfolio, order];
}

class PortfolioEventAddOrder extends PortfolioEvent {
  final PortfolioEntity portfolio;
  final Orders order;

  PortfolioEventAddOrder(this.portfolio, this.order);

  @override
  String toString() => 'PortfolioEventAddOrder';

  @override
  List<Object> get props => [portfolio, order];
}

class PortfolioEventSelect extends PortfolioEvent {
  final PortfolioEntity item;

  PortfolioEventSelect(this.item);

  @override
  String toString() => 'PortfolioEventSelect';

  @override
  List<Object> get props => [item];
}

class PortfolioEventDelete extends PortfolioEvent {
  final int portfolioId;

  PortfolioEventDelete(this.portfolioId);

  @override
  String toString() => 'PortfolioEventDelete';

  @override
  List<Object> get props => [portfolioId];
}

class PortfolioEventCreate extends PortfolioEvent {
  final String name;
  final String description;
  final bool isPrivate;
  final List<PortfolioEntity> portfolioItems;

  PortfolioEventCreate(
      this.name, this.description, this.isPrivate, this.portfolioItems);

  @override
  String toString() => 'PortfolioEventCreate';

  @override
  List<Object> get props => [name, description, isPrivate, portfolioItems];
}

class PortfolioEventSave extends PortfolioEventCreate {
  PortfolioEventSave(String name, String description, bool isPrivate,
      List<PortfolioEntity> portfolioItems)
      : super(name, description, isPrivate, portfolioItems);
}

class PortfolioEventLoaded extends PortfolioEvent {
  final List<PortfolioEntity> items;

  PortfolioEventLoaded(this.items);
  @override
  String toString() => 'PortfolioEventLoaded';

  @override
  List<Object> get props => [items];
}

class PortfolioEvenSaveBack extends PortfolioEvent {
  PortfolioEvenSaveBack();
  @override
  String toString() => 'PortfolioEvenSaveBack';

  @override
  List<Object> get props => [];
}

class PortfolioEventPieChart extends PortfolioEvent {
  PortfolioEventPieChart();
  @override
  String toString() => 'PortfolioEventPieChart';

  @override
  List<Object> get props => [];
}

class PortfolioEventBarChart extends PortfolioEvent {
  PortfolioEventBarChart();
  @override
  String toString() => 'PortfolioEventBarChart';

  @override
  List<Object> get props => [];
}

class PortfolioEventBarChartYear extends PortfolioEvent {
  PortfolioEventBarChartYear();
  @override
  String toString() => 'PortfolioEventBarChartYear';

  @override
  List<Object> get props => [];
}

class PortfolioEventCountryChart extends PortfolioEvent {
  PortfolioEventCountryChart();
  @override
  String toString() => 'PortfolioEventCountryChart';

  @override
  List<Object> get props => [];
}

class PortfolioEventIndustryChart extends PortfolioEvent {
  PortfolioEventIndustryChart();
  @override
  String toString() => 'PortfolioEventIndustryChart';

  @override
  List<Object> get props => [];
}

class PortfolioEventIndexChart extends PortfolioEvent {
  PortfolioEventIndexChart();
  @override
  String toString() => 'PortfolioEventIndexChart';

  @override
  List<Object> get props => [];
}
