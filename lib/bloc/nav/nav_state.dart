import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:portoli/bloc/nav/nav_event.dart';
import 'package:portoli/entities/portfolio.dart';
import 'package:portoli/entities/strategy.dart';
import 'package:portoli/entities/strategy_item.dart';
import 'package:portoli/login/user_repository.dart';

@immutable
abstract class NavState extends Equatable {
  const NavState();
}

class NavStateStrategy extends NavState {
  final StrategyEntity strategyItem;

  NavStateStrategy(this.strategyItem);

  @override
  String toString() => 'NavStateStrategy  { Strategy: $strategyItem }';

  @override
  List<Object> get props => [strategyItem];
}

class NavStateStock extends NavState {
  final StockEntity stock;

  NavStateStock(this.stock, );

  @override
  String toString() => 'NavStateStock  { Stock: $stock }';

  @override
  List<Object> get props => [stock];
}

class NavSateStrategies extends NavState {
  @override
  List<Object> get props => [];
}

class NavStateLicense extends NavState {
  @override
  List<Object> get props => [];
}

class NavStatePortfolios extends NavState {
  @override
  List<Object> get props => [];
}

class NavStatePortfolio extends NavState {
  final PortfolioEntity portfolio;

  NavStatePortfolio(this.portfolio);

  @override
  String toString() => 'NavStateStock  { Portfolio: $portfolio }';

  @override
  List<Object> get props => [portfolio];
}


class NavStateAddPortfolios extends NavState {
  @override
  List<Object> get props => [];
}

class NavStateAddStock extends NavState {
  final StockEntity stock;

  NavStateAddStock(this.stock);

  @override
  String toString() => 'NavStateAddStock  { Stock: $stock }';

  @override
  List<Object> get props => [stock];
}

class NavStateAddStockChosePort extends NavState {
  final StockEntity stock;
  final List<PortfolioEntity> portfolios;

  NavStateAddStockChosePort(this.stock, this.portfolios);

  @override
  String toString() => 'NavStateAddStockChosePort  { Stock: $stock }';

  @override
  List<Object> get props => [stock, portfolios];
}

class NavStateEditOrder extends NavState {
  final PortfolioEntity portfolio;
  final Orders order;
  NavStateEditOrder(this.portfolio, this.order);

  @override
  String toString() => 'NavStateEditOrder ';

  @override
  List<Object> get props => [portfolio, order];
}

class NavStateSuccess extends NavState {
  final NavEvent next;
  NavStateSuccess(this.next);

  @override
  String toString() => 'NavStateSuccess ';

  @override
  List<Object> get props => [next];
}

class NavStateEditDividend extends NavState {
  final PortfolioEntity portfolio;
  final Dividend dividend;
  NavStateEditDividend(this.portfolio, this.dividend);

  @override
  String toString() => 'NavStateEditDividend ';

  @override
  List<Object> get props => [portfolio, dividend];
}
class NavStateAddOrder extends NavState {
  final PortfolioEntity portfolio;

  NavStateAddOrder(this.portfolio);
  
  @override
  String toString() => "NavStateAddOrder ${portfolio.name}";

  @override
  List<Object> get props => [this.portfolio];
}

class NavStateAddDividend extends NavState {
  final PortfolioEntity portfolio;

  NavStateAddDividend(this.portfolio);

  @override
  String toString() => 'NavStateAddDividend  { Portfolio: $portfolio }';

  @override
  List<Object> get props => [portfolio];
}


class NavStateLogin extends NavState {
  NavStateLogin();

  @override
  String toString() => 'NavStateLogin';

  @override
  List<Object> get props => [];
}

class NavStateRegister extends NavState {
  NavStateRegister();

  @override
  String toString() => 'NavStateRegister';

  @override
  List<Object> get props => [];
}


class NavStateProfile extends NavState {


  NavStateProfile();

  @override
  String toString() => 'NavStateProfile';

  @override
  List<Object> get props => [];
}