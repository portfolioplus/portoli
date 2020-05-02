import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:portoli/bloc/authentication/bloc.dart';
import 'package:portoli/bloc/forms/register.dart';
import 'package:portoli/bloc/nav/nav_bloc.dart';
import 'package:portoli/bloc/nav/nav_event.dart';
import 'package:portoli/login/user_repository.dart';
import 'package:portoli/widgets/loading_dialog.dart';
import 'package:portoli/widgets/notifications.dart';

class RegisterForm extends StatelessWidget {
  final UserRepository userRepository;

  const RegisterForm({Key key, this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterFormBloc>(
      create: (context) => RegisterFormBloc(this.userRepository),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: FormBlocListener<RegisterFormBloc, String, String>(
              onSubmitting: (context, state) => LoadingDialog.show(context),
              onSuccess: (context, state) {
                LoadingDialog.hide(context);
                Notifications.showSnackBarWithSuccess(context,
                    "We will send you a confirmation via email at the email address provided by you.");
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
                Future.delayed(const Duration(milliseconds: 3500), () {
                  BlocProvider.of<NavDrawerBloc>(context).add(
                      NavEventSuccess(NavEventPortfolios(closeDrawer: false)));
                });
              },
              onFailure: (context, state) {
                LoadingDialog.hide(context);
                Notifications.showSnackBarWithError(
                    context, state.failureResponse);
              },
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  TextFieldBlocBuilder(
                    textFieldBloc:
                        BlocProvider.of<RegisterFormBloc>(context).emailField,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: BlocProvider.of<RegisterFormBloc>(context)
                        .usernameField,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: BlocProvider.of<RegisterFormBloc>(context)
                        .passwordField,
                    keyboardType: TextInputType.text,
                    suffixButton: SuffixButton.obscureText,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: BlocProvider.of<RegisterFormBloc>(context)
                        .passwordConfirm,
                    keyboardType: TextInputType.text,
                    suffixButton: SuffixButton.obscureText,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  CheckboxFieldBlocBuilder(
                    booleanFieldBloc: BlocProvider.of<RegisterFormBloc>(context)
                        .termAndConditionsField,
                    body: Text('Terms and Conditions'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed:
                          BlocProvider.of<RegisterFormBloc>(context).submit,
                      child: Center(child: Text('Register')),
                    ),
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
