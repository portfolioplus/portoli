import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:portoli/bloc/authentication/authentication_bloc.dart';
import 'package:portoli/bloc/authentication/authentication_event.dart';
import 'package:portoli/bloc/forms/login.dart';
import 'package:portoli/bloc/nav/nav_bloc.dart';
import 'package:portoli/bloc/nav/nav_event.dart';
import 'package:portoli/bloc/stepper/stepper_bloc.dart';
import 'package:portoli/bloc/stepper/stepper_event.dart';
import 'package:portoli/bloc/stepper/stepper_state.dart';
import 'package:portoli/services/navigation.dart';
import 'package:portoli/utils/globals.dart' as globals;
import 'package:portoli/widgets/google_login_button.dart';
import 'package:portoli/widgets/hr_text.dart';
import 'package:portoli/widgets/loading_dialog.dart';
import 'package:portoli/widgets/notifications.dart';

class DeleteUserStepper extends StatelessWidget {
  List<Step> _steps;
  final String username;
  int _currentStep = 0;

  DeleteUserStepper({Key key, @required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _currentStep = 0;
    BlocProvider.of<StepperDeleteUserBloc>(context).add(StepTapped(step: 0));
    LoginFormBloc loginFormBloc;
    _steps = [
      Step(
        title: Text("Start"),
        content: Text(
            "Delete user $username and all portfolios. This operation can't undo."),
        isActive: true,
      ),
      Step(
        title: Text("Login"),
        content: BlocProvider<LoginFormBloc>(
          create: (context) {
            loginFormBloc = LoginFormBloc(
                BlocProvider.of<AuthenticationBloc>(context).userRepository);
            return loginFormBloc;
          },
          child: Builder(
            builder: (context) {
              return Container(
                height: 200,
                child: FormBlocListener<LoginFormBloc, String, String>(
                  onSubmitting: (context, state) => LoadingDialog.show(context),
                  onSuccess: (context, state) {
                    LoadingDialog.hide(context);
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(LoggedIn());
                    BlocProvider.of<StepperDeleteUserBloc>(context)
                        .add(StepTapped(step: 2));
                    _currentStep += 1;
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
                        textFieldBloc: BlocProvider.of<LoginFormBloc>(context)
                            .passwordField,
                        keyboardType: TextInputType.text,
                        suffixButton: SuffixButton.obscureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                      DividerText(
                        text: ' OR ',
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      GoogleLoginButton(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        state: StepState.editing,
        isActive: true,
      ),
      Step(
        title: Text("Delete"),
        content: Text("Delete user $username"),
        isActive: true,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete user $username'),
      ),
      body: Container(
        child: BlocBuilder(
          bloc: BlocProvider.of<StepperDeleteUserBloc>(context),
          builder: (BuildContext context, StepperState state) {
            return Stepper(
              currentStep: state.step,
              steps: _steps,
              type: StepperType.vertical,
              onStepTapped: (step) {},
              onStepCancel: () {
                BlocProvider.of<StepperDeleteUserBloc>(context)
                    .add(StepCancelled());
                _currentStep -= 1;
                if (0 > _currentStep) {
                  BlocProvider.of<NavDrawerBloc>(context).add(NavEventStrategies());
                  locator<NavigationService>().goBack();
                }
              },
              onStepContinue: () {
                // set email to form
                if (_currentStep == 1) {
                  loginFormBloc.add(StepLogin(email: globals.email));
                  loginFormBloc.submit();
                } else if (_currentStep == 2) {
                  BlocProvider.of<AuthenticationBloc>(context).add(Delete());
                  BlocProvider.of<NavDrawerBloc>(context).add(NavEventSuccess(
                      NavEventStrategies(),closeDrawer: true));
                  locator<NavigationService>().goBack();
                } else {
                  _currentStep += 1;
                  BlocProvider.of<StepperDeleteUserBloc>(context)
                      .add(StepContinue());
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class NavEventPortfolios {}
