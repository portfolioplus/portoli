import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:portoli/bloc/authentication/authentication_bloc.dart';
import 'package:portoli/bloc/authentication/authentication_event.dart';
import 'package:portoli/bloc/forms/login.dart';

import 'package:portoli/bloc/nav/nav_bloc.dart';
import 'package:portoli/bloc/nav/nav_event.dart';
import 'package:portoli/login/user_repository.dart';
import 'package:portoli/widgets/google_login_button.dart';
import 'package:portoli/widgets/loading_dialog.dart';
import 'package:portoli/widgets/notifications.dart';
import 'package:portoli/widgets/round_button.dart';


class LoginForm extends StatelessWidget {
  final UserRepository userRepository;

  const LoginForm({Key key, this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginFormBloc>(
      create: (context) => LoginFormBloc(this.userRepository),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: FormBlocListener<LoginFormBloc, String, String>(
              onSubmitting: (context, state) => LoadingDialog.show(context),
              onSuccess: (context, state) {
                LoadingDialog.hide(context);
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
                BlocProvider.of<NavDrawerBloc>(context).add(
                    NavEventSuccess(NavEventStrategies(closeDrawer: false)));
              },
              onFailure: (context, state) {
                LoadingDialog.hide(context);
                Notifications.showSnackBarWithError(
                    context, state.failureResponse);
              },
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Image.asset('assets/icon/icon.png', height: 200),
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc:
                        BlocProvider.of<LoginFormBloc>(context).emailField,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc:
                        BlocProvider.of<LoginFormBloc>(context).passwordField,
                    keyboardType: TextInputType.text,
                    suffixButton: SuffixButton.obscureText,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  RoundButton(
                    text: 'Login',
                    onPressed: BlocProvider.of<LoginFormBloc>(context).submit,
                  ),
                  GoogleLoginButton(),
                  RoundButton(
                    text: 'Register',
                    onPressed: () => BlocProvider.of<NavDrawerBloc>(context)
                        .add(NavEventRegister()),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
