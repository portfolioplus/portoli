import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:portoli/entities/portfolio.dart';
import 'package:portoli/entities/strategy.dart';
import 'package:portoli/entities/strategy_item.dart';

@immutable
abstract class NavEvent extends Equatable {
  const NavEvent();
}
class NavEventPortfolios extends NavEvent {
  final bool closeDrawer;

  NavEventPortfolios({this.closeDrawer = true});

  @override
  String toString() => 'NavEventPortfolios';

  @override
  List<Object> get props => [closeDrawer];
}


class NavEventStrategies extends NavEvent {
  final bool closeDrawer;

  NavEventStrategies({this.closeDrawer = true});

  @override
  String toString() => 'NavEventStrategies';

  @override
  List<Object> get props => [closeDrawer];
}

class NavEventLicense extends NavEvent {
  final BuildContext context;

  NavEventLicense(this.context);
  @override
  String toString() => 'NavEventLicense';

  @override
  List<Object> get props => [context];
}

class NavEventBack extends NavEvent {
  @override
  String toString() => 'NavEventBack';

  @override
  List<Object> get props => [];
}

class NavEventDrawerBack extends NavEvent {
  @override
  String toString() => 'NavEventDrawerBack';

  @override
  List<Object> get props => [];
}

class NavEventSettingsFilter extends NavEvent {
  final StrategyEntity strategyItem;
  final List<String> filterItems;
  final String title;
  NavEventSettingsFilter(this.strategyItem, this.title, this.filterItems);
  @override
  String toString() => 'NavEventSettingsFilter';

  @override
  List<Object> get props => [strategyItem, filterItems, title];
}

class NavEventSettings extends NavEvent {
  final StrategyEntity strategyItem;
  NavEventSettings(this.strategyItem);
  @override
  String toString() => 'NavEventSettings';

  @override
  List<Object> get props => [strategyItem];
}


class NavEventAddPortfolio extends NavEvent {
  NavEventAddPortfolio();

  @override
  String toString() => 'NavEventAddPortfolio';

  @override
  List<Object> get props => [];
}

class NavEventLogin extends NavEvent {
  final bool closeDrawer;

  NavEventLogin({this.closeDrawer = true});

  @override
  String toString() => 'NavEventLogin';

  @override
  List<Object> get props => [closeDrawer];
}

class NavEventAddOrder extends NavEvent {
  final PortfolioEntity portfolio;

  NavEventAddOrder(this.portfolio);

  @override
  String toString() => "NavEventAddOrder ${portfolio.name}";

  @override
  List<Object> get props => [this.portfolio];
}

class NavEventDeleteOrder extends NavEvent {
  final BuildContext context;
  final PortfolioEntity portfolio;
  final Orders order;

  NavEventDeleteOrder(this.context, this.portfolio, this.order);

  @override
  String toString() =>
      "NavEventDeletePortfolioItem ${portfolio.name} - ${order.symbol}";

  @override
  List<Object> get props => [this.context, this.portfolio, this.order];
}

class NavEventDeleteUser extends NavEvent {
  final BuildContext context;
  final String username;


  NavEventDeleteUser(this.context,  this.username);

  @override
  String toString() =>
      "NavEventDeleteUser: $username";

  @override
  List<Object> get props => [this.context, this.username];
}

class NavEventEditUserName extends NavEvent {
  final BuildContext context;


  NavEventEditUserName(this.context);

  @override
  String toString() =>
      "NavEventEditUserName";

  @override
  List<Object> get props => [this.context];
}

class NavEventEditEmail extends NavEvent {
  final BuildContext context;


  NavEventEditEmail(this.context);

  @override
  String toString() =>
      "NavEventEditEmail";

  @override
  List<Object> get props => [this.context];
}

class NavEventSuccess extends NavEvent {
  final NavEvent next;

    final bool closeDrawer;


  NavEventSuccess(this.next, {this.closeDrawer = false});

  @override
  String toString() => 'NavEventSuccess';

  @override
  List<Object> get props => [next, closeDrawer];
}

class NavEventEditOrder extends NavEvent {
  final BuildContext context;
  final PortfolioEntity portfolio;
  final Orders order;

  NavEventEditOrder(this.context, this.portfolio, this.order);

  @override
  String toString() => "NavEventEditOrder ${portfolio.name} - ${order.symbol}";

  @override
  List<Object> get props => [this.context, this.portfolio, this.order];
}

class NavEventDeleteDividend extends NavEvent {
  final BuildContext context;
  final PortfolioEntity portfolio;
  final Dividend dividend;

  NavEventDeleteDividend(this.context, this.portfolio, this.dividend);

  @override
  String toString() =>
      "NavEventDeleteDividend ${portfolio.name} - ${dividend.symbol}";

  @override
  List<Object> get props => [this.context, this.portfolio, this.dividend];
}

class NavEventEditDividend extends NavEvent {
  final BuildContext context;
  final PortfolioEntity portfolio;
  final Dividend dividend;

  NavEventEditDividend(this.context, this.portfolio, this.dividend);

  @override
  String toString() =>
      "NavEventEditOrder ${portfolio.name} - ${dividend.symbol}";

  @override
  List<Object> get props => [this.context, this.portfolio, this.dividend];
}

class NavEventAddStock extends NavEvent {
  final StockEntity stock;

  NavEventAddStock(this.stock);

  @override
  String toString() => 'NavEventAddStock';

  @override
  List<Object> get props => [this.stock];
}

class NavEventAddStockChosePort extends NavEvent {
  final StockEntity stock;
  final List<PortfolioEntity> portfolios;

  NavEventAddStockChosePort(this.stock, this.portfolios);

  @override
  String toString() => 'NavEventAddStockChosePort  { Stock: $stock }';

  @override
  List<Object> get props => [stock];
}

class NavEventPortfolio extends NavEvent {
  final PortfolioEntity portfolio;
  NavEventPortfolio(this.portfolio);

  @override
  String toString() => 'NavEventPortfolio';

  @override
  List<Object> get props => [portfolio];
}

class NavEventAddDividend extends NavEvent {
  final PortfolioEntity portfolio;
  NavEventAddDividend(this.portfolio);

  @override
  String toString() => 'NavEventAddDividend';

  @override
  List<Object> get props => [portfolio];
}

class NavEventFilterDialog extends NavEvent {
  final StrategyEntity strategyItem;
  final BuildContext context;
  NavEventFilterDialog(this.strategyItem, this.context);

  @override
  String toString() => 'NavEventFilterDialog';

  @override
  List<Object> get props => [strategyItem, context];
}

class NavEventStrategy extends NavEvent {
  final StrategyEntity strategyItem;

  NavEventStrategy(this.strategyItem);

  @override
  String toString() => 'NavEventStrategy';

  @override
  List<Object> get props => [strategyItem];
}

class NavEventStock extends NavEvent {
  final StockEntity stock;
  NavEventStock(this.stock);

  @override
  String toString() => 'NavEventStock';

  @override
  List<Object> get props => [stock];
}

class NavEventRegister extends NavEvent {
  @override
  String toString() => 'NavEventRegister';

  @override
  List<Object> get props => [];
}

class NavEventStockLoadPortfolios extends NavEvent {
  final StockEntity stock;
  final BuildContext context;


  NavEventStockLoadPortfolios(this.stock, this.context);

  @override
  String toString() => 'NavEventStockLoadPortfolios';

  @override
  List<Object> get props => [stock, context];
}

class NavEventProfile extends NavEvent {
  final bool closeDrawer;

  NavEventProfile({bool closeDrawer = false}) : this.closeDrawer = closeDrawer;

  @override
  String toString() => 'NavEventProfile';

  @override
  List<Object> get props => [closeDrawer];
}
