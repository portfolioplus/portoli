import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portoli/constants/route_paths.dart' as routes;
import 'package:portoli/entities/strategy.dart';
import 'package:portoli/screens/drawer.dart';
import 'package:portoli/screens/settings/change_email_stepper.dart';
import 'package:portoli/screens/settings/change_username_stepper..dart';
import 'package:portoli/screens/settings/delete_user_stepper.dart';
import 'package:portoli/screens/settings/filter.dart';
import 'package:portoli/screens/settings/settings.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.InitialRoute:
      return MaterialPageRoute(builder: (context) => DrawerView('portoli'));
    case routes.SettingsFilter:
      List<dynamic> args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => SettingsFilterView(
              strategy: args[0], title: args[1], filterItems: args[2]));
    case routes.Settings:
      StrategyEntity arg = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => SettingsView(strategy: arg));
    case routes.DeleteUser:
      String username = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => DeleteUserStepper(username: username));
    case routes.EditEmail:
      return MaterialPageRoute(builder: (context) => ChangeEmailStepper());
    case routes.EditUserName:
      return MaterialPageRoute(
          builder: (context) => ChangeUsernameStepper());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
