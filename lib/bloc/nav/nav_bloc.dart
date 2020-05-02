import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portoli/bloc/nav/nav_event.dart';
import 'package:portoli/bloc/nav/nav_state.dart';
import 'package:portoli/bloc/portfolio/port_bloc.dart';
import 'package:portoli/bloc/portfolio/port_event.dart';
import 'package:portoli/bloc/portfolio/port_state.dart';
import 'package:portoli/constants/perf_keys.dart';
import 'package:portoli/dialog/delete_dividend_dialog.dart';
import 'package:portoli/dialog/delete_order_dialog.dart';
import 'package:portoli/dialog/delete_user.dart';
import 'package:portoli/dialog/filter_index_dialog.dart';
import 'package:portoli/services/navigation.dart';
import 'package:portoli/constants/route_paths.dart' as routes;
import 'package:portoli/bloc/bloc.dart';
import 'package:preferences/preference_service.dart';

class NavDrawerBloc extends Bloc<NavEvent, NavState> {
  List<NavEvent> _eventCache = [];
  NavEvent lastEvent;
  @override
  NavState get initialState => NavSateStrategies();

  @override
  Stream<NavState> mapEventToState(NavEvent event) async* {
    bool isBack = false;
    if (event is NavEventDrawerBack) {
      isBack = true;
      if (this.state == this.initialState) {
        exit(0);
      }

      if (_eventCache.length > 0) {
        event = _eventCache.removeLast();
      }
    } else {
      if (lastEvent != null &&
          (_eventCache.length == 0 || _eventCache.last != lastEvent)) {
        _eventCache.add(lastEvent);
      }
    }

    // set last event. Only new page events are allowed
    if (!(event is NavEventDrawerBack) &&
        !(event is NavEventStockLoadPortfolios)) {
      lastEvent = event;
    }

    if (event is NavEventStrategies) {
      // this forces to close the drawer
      if (event.closeDrawer) {
        locator<NavigationService>().goBack();
      }
      _eventCache.clear();
      lastEvent = NavEventStrategies(closeDrawer: false);
      _eventCache.add(lastEvent);
      yield NavSateStrategies();
    } else if (event is NavEventStrategy) {
      yield NavStateStrategy(event.strategyItem);
    } else if (event is NavEventStock) {
      yield NavStateStock(event.stock);
    } else if (event is NavEventStockLoadPortfolios) {
      BlocProvider.of<PortfolioOrderBloc>(event.context)
          .add(PortfolioEventLoad());
      var stock = event.stock;
      BlocProvider.of<PortfolioOrderBloc>(event.context).listen((onData) {
        if (onData is PortfolioStateLoaded) {
          this.add(NavEventAddStockChosePort(stock, onData.portfolioItems));
        }
      });
    } else if (event is NavEventPortfolios) {
      // this forces to close the drawer
      if (event.closeDrawer) {
        locator<NavigationService>().goBack();
      }
      _eventCache.clear();
      lastEvent = NavEventPortfolios(closeDrawer: false);
      _eventCache.add(lastEvent);
      yield NavStatePortfolios();
    } else if (event is NavEventAddPortfolio) {
      yield NavStateAddPortfolios();
    } else if (event is NavEventAddStock) {
      yield NavStateAddStock(event.stock);
    } else if (event is NavEventAddStockChosePort) {
      yield NavStateAddStockChosePort(event.stock, event.portfolios);
    } else if (event is NavEventAddDividend) {
      yield NavStateAddDividend(event.portfolio);
    } else if (event is NavEventAddOrder) {
      yield NavStateAddOrder(event.portfolio);
    } else if (event is NavEventPortfolio) {
      yield NavStatePortfolio(event.portfolio);
    } else if (event is NavEventEditOrder) {
      yield NavStateEditOrder(event.portfolio, event.order);
    } else if (event is NavEventEditDividend) {
      yield NavStateEditDividend(event.portfolio, event.dividend);
    } else if (event is NavEventSuccess) {
      if (event.closeDrawer) {
        locator<NavigationService>().goBack();
      }
      yield NavStateSuccess(event.next);
    } else if (event is NavEventLogin) {
      // this forces to close the drawer
      if (event.closeDrawer) {
        locator<NavigationService>().goBack();
      }
      yield NavStateLogin();
    } else if (event is NavEventRegister) {
      yield NavStateRegister();
    } else if (event is NavEventProfile) {
      if (event.closeDrawer) {
        locator<NavigationService>().goBack();
      }
      yield NavStateProfile();
    }
  }
}

class NavBloc extends Bloc<NavEvent, NavState> {
  @override
  NavState get initialState => NavSateStrategies();

  @override
  Stream<NavState> mapEventToState(NavEvent event) async* {
    if (event is NavEventStrategies) {
      locator<NavigationService>().navigateTo(routes.InitialRoute);
    } else if (event is NavEventLicense) {
      showDialog(
        context: event.context,
        builder: (ctxt) => AboutDialog(
          applicationVersion: '1.0.0',
          applicationIcon: Image.asset('assets/icon/icon.png', height: 100),
        ),
      );
    } else if (event is NavEventSettingsFilter) {
      locator<NavigationService>().navigateTo(routes.SettingsFilter,
          arguments: [event.strategyItem, event.title, event.filterItems]);
    } else if (event is NavEventSettings) {
      locator<NavigationService>()
          .navigateTo(routes.Settings, arguments: event.strategyItem);
    } else if (event is NavEventDeleteUser) {
      locator<NavigationService>()
          .navigateTo(routes.DeleteUser, arguments: event.username);
    } else if (event is NavEventEditUserName) {
      locator<NavigationService>()
          .navigateTo(routes.EditUserName, arguments: event.context);
    } else if (event is NavEventEditEmail) {
      locator<NavigationService>()
          .navigateTo(routes.EditEmail, arguments: event.context);
    } else if (event is NavEventFilterDialog) {
      showDialog(
        context: event.context,
        builder: (ctxt) => FilterIndexDialog(event.strategyItem),
      );
    } else if (event is NavEventBack) {
      locator<NavigationService>().goBack();
    } else if (event is NavEventDeleteOrder) {
      showDialog(
        context: event.context,
        builder: (ctxt) => DeleteOrderDialog(event.portfolio, event.order),
      );
    } else if (event is NavEventDeleteDividend) {
      showDialog(
        context: event.context,
        builder: (ctxt) =>
            DeleteDividendDialog(event.portfolio, event.dividend),
      );
    }
  }
}
