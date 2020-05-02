import 'package:flutter/material.dart';
import 'package:portoli/bloc/authentication/authentication_bloc.dart';
import 'package:portoli/bloc/authentication/authentication_event.dart';
import 'package:portoli/bloc/stepper/stepper_bloc.dart';
import 'package:portoli/login/user_repository.dart';
import 'package:preferences/preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portoli/bloc/bloc.dart';
import 'package:portoli/bloc/portfolio/port_bloc.dart';
import 'package:portoli/bloc/portfolio/port_event.dart';
import 'package:portoli/constants/settings.dart';
import 'package:portoli/constants/stocks.dart';
import 'package:portoli/services/navigation.dart';
import 'bloc/nav/nav_bloc.dart';
import 'bloc/strategy/strategy_bloc.dart';
import 'package:portoli/constants/route_paths.dart' as routes;
import 'package:portoli/routes.dart' as router;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init(prefix: 'pref_');
  var defaultValues = Map<String, dynamic>.fromIterable(INDICES + INDUSTRIES + COUNTRIES,
      key: (v) => v, value: (v) => true);
  defaultValues[SET_SYNC] = false;
  PrefService.setDefaultValues(defaultValues);
  setupLocator();
  runApp(
    BlocProvider(
      create: (context) => NavDrawerBloc(),
      child: portoliApp(),
    ),
  );
}

class portoliApp extends StatelessWidget {
  UserRepository _userRepository = UserRepository();
  portoliApp();

  @override
  Widget build(BuildContext context) {
    String cur = PrefService.getString(SET_CUR) ?? EUR;
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavDrawerBloc>(
          create: (context) {
            return NavDrawerBloc();
          },
        ),
        BlocProvider<NavBloc>(
          create: (context) {
            return NavBloc();
          },
        ),
        BlocProvider<StrategyBloc>(
          create: (context) {
            return StrategyBloc()..add(StrategyEventLoad());
          },
        ),
        BlocProvider<PortfolioBloc>(
          create: (context) {
            return PortfolioBloc()..add(PortfolioEventLoad());
          },
        ),
        BlocProvider<PortfolioDiversificationBloc>(
          create: (context) {
            return PortfolioDiversificationBloc();
          },
        ),
        BlocProvider<PortfolioAddBloc>(
          create: (context) {
            return PortfolioAddBloc();
          },
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(userRepository: _userRepository)
              ..add(AppStarted());
          },
        ),
        BlocProvider<PortfolioOrderBloc>(
          create: (context) {
            return PortfolioOrderBloc();
          },
        ),
        BlocProvider<StockBloc>(
          create: (context) {
            return StockBloc()..add(StockEventInitial());
          },
        ),
        BlocProvider<StockViewBloc>(
          create: (context) {
            return StockViewBloc()..add(StockEventCurrency(cur));
          },
        ),
        BlocProvider<PortfolioDividendBloc>(
          create: (context) {
            return PortfolioDividendBloc();
          },
        ),
        BlocProvider<StepperDeleteUserBloc>(
          create: (context) {
            return StepperDeleteUserBloc(
                maxSteps: 3, userRepository: _userRepository);
          },
        ),
        BlocProvider<StepperChangeProfileBloc>(
          create: (context) {
            return StepperChangeProfileBloc(
                maxSteps: 4, userRepository: _userRepository);
          },
        ),
      ],
      child: MaterialApp(
        title: 'portoli',
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
        initialRoute: routes.InitialRoute,
      ),
    );
  }
}
