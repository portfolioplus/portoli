import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portoli/bloc/authentication/authentication_bloc.dart';
import 'package:portoli/bloc/authentication/authentication_event.dart';
import 'package:portoli/bloc/authentication/authentication_state.dart';
import 'package:portoli/bloc/bloc.dart';
import 'package:portoli/bloc/portfolio/port_bloc.dart';
import 'package:portoli/bloc/portfolio/port_event.dart';
import 'package:portoli/constants/settings.dart';
import 'package:portoli/constants/stocks.dart';
import 'package:portoli/entities/strategy.dart';
import 'package:portoli/screens/forms/add_dividends.dart';
import 'package:portoli/screens/forms/add_order.dart';
import 'package:portoli/screens/forms/add_order_chose_port.dart';
import 'package:portoli/screens/forms/add_portfolio.dart';
import 'package:portoli/screens/forms/edit_dividends.dart';
import 'package:portoli/screens/forms/edit_order.dart';
import 'package:portoli/screens/forms/login.dart';
import 'package:portoli/screens/forms/register.dart';
import 'package:portoli/screens/portfolio.dart';
import 'package:portoli/screens/portfolios.dart';
import 'package:portoli/screens/stocks.dart';
import 'package:portoli/screens/strategies.dart';
import 'package:portoli/screens/strategy.dart';
import 'package:portoli/screens/success.dart';
import 'package:portoli/widgets/rnd_btn.dart';
import 'package:portoli/widgets/round_button.dart';
import 'package:preferences/preference_service.dart';

class DrawerView extends StatefulWidget {
  final String title;

  DrawerView(this.title) {}

  _drawerViewState createState() => _drawerViewState();
}

class _drawerViewState extends State<DrawerView> {
  StrategyEntity _currentStrategy;
  IconData _curIcon = PrefService.getString(SET_CUR) == USD
      ? Icons.attach_money
      : Icons.euro_symbol;

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent) {
    BlocProvider.of<NavDrawerBloc>(context).add(NavEventDrawerBack());
    return true;
  }

  @override
  Widget build(BuildContext context) {
    List<StatelessWidget> items = [
      DrawerHeader(
        child: BlocBuilder(
          bloc: BlocProvider.of<AuthenticationBloc>(context),
          builder: (BuildContext context, AuthenticationState state) {
            if (state is Authenticated) {
              return InkWell(
                onTap: () => BlocProvider.of<NavBloc>(context)
                    .add(NavEventSettings(_currentStrategy)),
                child: Column(
                  children: [
                    CircleAvatar(
                      child: Text(
                        '${state.displayName[0]}${state.displayName[1]}'
                            .toUpperCase(),
                        style: TextStyle(fontSize: 30),
                      ),
                      radius: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Hello ${state.displayName}',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              );
            } else if (state is NotVerified) {
              return Column(
                children: [
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(
                          MdiIcons.accountAlert,
                          size: 50.0,
                          color: Colors.white,
                        ),
                        radius: 40.0,
                      ),
                      RoundIconButton(
                          icon: Icons.refresh,
                          colorIcon: Colors.white,
                          colorBackground: Color(0xFF1976d2),
                          onPressed: () =>
                              BlocProvider.of<AuthenticationBloc>(context)
                                  .add(LoggedIn())),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Email ${state.email} is not verified.',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              );
            } else {
              return Column(
                children: [
                  CircleAvatar(
                    child: Icon(
                      MdiIcons.account,
                      size: 50.0,
                      color: Colors.white,
                    ),
                    radius: 40.0,
                  ),
                  RoundButton(
                      paddingAll: 0.0,
                      text: 'Login',
                      onPressed: () => BlocProvider.of<NavDrawerBloc>(context)
                          .add(NavEventLogin()))
                ],
              );
            }
          },
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: Text('Strategies'),
        leading: Icon(Icons.bubble_chart, size: 20),
        onTap: () {
          BackButtonInterceptor.remove(myInterceptor);
          BackButtonInterceptor.add(myInterceptor);
          BlocProvider.of<NavDrawerBloc>(context).add(NavEventStrategies());
        },
      ),
      ListTile(
        title: Text('Portfolios'),
        leading: Icon(Icons.pie_chart, size: 20),
        onTap: () {
          BackButtonInterceptor.remove(myInterceptor);
          BackButtonInterceptor.add(myInterceptor);
          BlocProvider.of<NavDrawerBloc>(context).add(NavEventPortfolios());
        },
      ),
      ListTile(
        title: Text('Settings'),
        leading: Icon(Icons.settings, size: 20),
        onTap: () {
          BackButtonInterceptor.remove(myInterceptor);
          BlocProvider.of<NavBloc>(context)
              .add(NavEventSettings(_currentStrategy));
        },
      ),
      ListTile(
        title: Text('about'),
        leading: Icon(Icons.info, size: 20),
        onTap: () {
          BackButtonInterceptor.remove(myInterceptor);
          BlocProvider.of<NavBloc>(context).add(NavEventLicense(context));
        },
      )
    ];

    return Scaffold(
      body: BlocBuilder(
        bloc: BlocProvider.of<NavDrawerBloc>(context),
        builder: (context, state) {
          BackButtonInterceptor.remove(myInterceptor);
          BackButtonInterceptor.add(myInterceptor);
          Widget fragment;
          Widget appBar = AppBar(title: Text(this.widget.title));
          if (state is NavSateStrategies) {
            fragment = StrategiesView();
          } else if (state is NavStatePortfolios) {
            appBar = _buildAppBarPortfolios(context);
            fragment = PortfoliosView();
            BlocProvider.of<PortfolioBloc>(context).add(PortfolioEventLoad());
          } else if (state is NavStatePortfolio) {
            appBar = _buildAppBarPortfolio(state);
            fragment = PortfolioView(state.portfolio);
          } else if (state is NavStateAddPortfolios) {
            appBar = AppBar(title: Text('Add Portfolio'));
            fragment = AddPortfolioForm();
          } else if (state is NavStateStrategy) {
            appBar = buildAppBarStrategy(state, context);
            _currentStrategy = state.strategyItem;
            fragment = StrategyView(_currentStrategy);
          } else if (state is NavStateStock) {
            appBar = buildAppBarStock(state, context);
            fragment = StockView(state.stock);
          } else if (state is NavStateAddStockChosePort) {
            appBar =
                AppBar(title: Text('Add ${state.stock.name} to portfolio'));
            fragment = AddOrderChosePortForm(
                stock: state.stock, portfolios: state.portfolios);
          } else if (state is NavStateAddDividend) {
            appBar = AppBar(title: Text('Add Dividend'));
            fragment = AddDividednsForm(portfolio: state.portfolio);
          } else if (state is NavStateAddOrder) {
            appBar = AppBar(title: Text('Add Order'));
            fragment = AddOrderForm(portfolio: state.portfolio);
          } else if (state is NavStateEditOrder) {
            appBar = AppBar(title: Text('Edit Order'));
            fragment =
                EditOrderForm(portfolio: state.portfolio, order: state.order);
          } else if (state is NavStateEditDividend) {
            appBar = AppBar(title: Text('Edit Dividend'));
            fragment = EditDividendForm(
                portfolio: state.portfolio, dividend: state.dividend);
          } else if (state is NavStateSuccess) {
            appBar = null;
            fragment = SuccessView(next: state.next);
          } else if (state is NavStateLogin) {
            appBar = AppBar(title: Text('Login'));
            fragment = LoginForm(
                userRepository: BlocProvider.of<AuthenticationBloc>(context)
                    .userRepository);
          } else if (state is NavStateRegister) {
            appBar = AppBar(title: Text('Register'));
            fragment = RegisterForm(
                userRepository: BlocProvider.of<AuthenticationBloc>(context)
                    .userRepository);
          }
          return Scaffold(
            appBar: appBar,
            body: fragment,
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: items,
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBarStock(NavStateStock state, BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add, size: 30),
          onPressed: () {
            BlocProvider.of<NavDrawerBloc>(context)
                .add(NavEventStockLoadPortfolios(state.stock, context));
          },
        ),
        // action button
        IconButton(
          icon: Icon(_curIcon, size: 30),
          onPressed: () {
            setState(() {
              var v = PrefService.getString(SET_CUR);
              if (v == USD) {
                PrefService.setString(SET_CUR, EUR);
                _curIcon = Icons.euro_symbol;
                v = EUR;
              } else {
                PrefService.setString(SET_CUR, USD);
                v = USD;
                _curIcon = Icons.attach_money;
              }
              BlocProvider.of<StockViewBloc>(context)
                  .add(StockEventCurrency(v));
            });
          },
        )
      ],
    );
  }

  AppBar buildAppBarStrategy(NavStateStrategy state, BuildContext context) {
    return AppBar(
      title: Text(state.strategyItem.name),
      actions: <Widget>[
        // action button
        IconButton(
          icon: Icon(Icons.filter_list, size: 30),
          onPressed: () {
            BlocProvider.of<NavBloc>(context)
                .add(NavEventFilterDialog(_currentStrategy, context));
          },
        )
      ],
    );
  }

  AppBar _buildAppBarPortfolios(BuildContext context) {
    return AppBar(
      title: Text('Portfolios'),
      actions: <Widget>[
        // action button
        IconButton(
          icon: Icon(Icons.add, size: 30),
          onPressed: () {
            BlocProvider.of<NavDrawerBloc>(context).add(NavEventAddPortfolio());
          },
        )
      ],
    );
  }

  Widget _buildAppBarPortfolio(NavStatePortfolio sate) {
    return AppBar(
      title: Text(sate.portfolio.name),
      actions: <Widget>[
        // action button
        IconButton(
          icon: Icon(Icons.toll, size: 30),
          onPressed: () {
            BlocProvider.of<NavDrawerBloc>(context)
                .add(NavEventAddDividend(sate.portfolio));
          },
        ),
        IconButton(
          icon: Icon(Icons.add, size: 30),
          onPressed: () {
            BlocProvider.of<NavDrawerBloc>(context)
                .add(NavEventAddOrder(sate.portfolio));
          },
        )
      ],
    );
  }
}
