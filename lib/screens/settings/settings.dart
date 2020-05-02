import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portoli/bloc/authentication/authentication_bloc.dart';
import 'package:portoli/bloc/authentication/authentication_event.dart';
import 'package:portoli/bloc/authentication/authentication_state.dart';
import 'package:portoli/bloc/bloc.dart';
import 'package:portoli/constants/settings.dart';
import 'package:portoli/constants/stocks.dart';
import 'package:portoli/entities/strategy.dart';
import 'package:portoli/widgets/edit_btn.dart';
import 'package:portoli/widgets/hr_text.dart';
import 'package:portoli/widgets/round_button.dart';
import 'package:preferences/dropdown_preference.dart';
import 'package:preferences/preference_title.dart';
import 'package:preferences/preferences.dart';
import 'package:portoli/utils/globals.dart' as globals;

class SettingsView extends StatelessWidget {
  final StrategyEntity strategy;

  const SettingsView({Key key, this.strategy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = [
      PreferenceTitle('Currency'),
      DropdownPreference(
        SET_CUR,
        SET_CUR,
        defaultVal: EUR,
        values: [EUR, USD],
        onChange: (v) {
          BlocProvider.of<StockViewBloc>(context).add(StockEventCurrency(v));
        },
      ),
      Divider(),
      PreferenceTitle('Filter'),
      ListTile(
        title: Text('Index'),
        onTap: () {
          BlocProvider.of<NavBloc>(context)
              .add(NavEventSettingsFilter(strategy, 'Index', INDICES));
        },
      ),
      ListTile(
        title: Text('Countries'),
        onTap: () {
          BlocProvider.of<NavBloc>(context)
              .add(NavEventSettingsFilter(strategy, 'Countries', COUNTRIES));
        },
      ),
      ListTile(
        title: Text('Industries'),
        onTap: () {
          BlocProvider.of<NavBloc>(context)
              .add(NavEventSettingsFilter(strategy, 'Industries', INDUSTRIES));
        },
      ),
      Divider(),
      PreferenceTitle('Account'),
      BlocBuilder(
        bloc: BlocProvider.of<AuthenticationBloc>(context),
        builder: (BuildContext context, AuthenticationState state) {
          if (state is Authenticated) {
            return Column(children: [
              SwitchPreference(
                'Auto synchronize',
                SET_SYNC,
                defaultVal: false,
                desc:
                    'All non-private portfolios are uploaded to our cloud service and are visible to the community.',
              ),
              DividerText(
                text: ' User Data ',
                color: Colors.grey,
                thickness: 0.5,
              ),
              EditButton(
                text: globals.email,
                onPressed: () => BlocProvider.of<NavBloc>(context).add(
                  NavEventEditEmail(context),
                ),
              ),
              EditButton(
                text: globals.username,
                onPressed: () => BlocProvider.of<NavBloc>(context).add(
                  NavEventEditUserName(context),
                ),
              ),
              RoundButton(
                  text: 'Logout ${state.displayName}',
                  onPressed: () => BlocProvider.of<AuthenticationBloc>(context)
                      .add(LoggedOut())),
              RoundButton(
                text: 'Delete ${state.displayName}',
                color: Colors.redAccent,
                textColor: Colors.white,
                onPressed: () => BlocProvider.of<NavBloc>(context).add(
                  NavEventDeleteUser(context, state.displayName),
                ),
              ),
            ]);
          } else {
            return RoundButton(
                text: 'Login',
                onPressed: () => BlocProvider.of<NavDrawerBloc>(context)
                    .add(NavEventLogin(closeDrawer: true)));
          }
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(children: items),
    );
  }
}

