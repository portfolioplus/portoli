import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:portoli/bloc/authentication/authentication_bloc.dart';
import 'package:portoli/bloc/authentication/authentication_event.dart';
import 'package:portoli/bloc/forms/login.dart';
import 'package:portoli/bloc/forms/profile.dart';
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

class ChangeEmailStepper extends StatefulWidget {
  @override
  _ChangeEmailStepperState createState() => _ChangeEmailStepperState();
}

class _ChangeEmailStepperState extends State<ChangeEmailStepper> {
  List<Step> _steps;

  int _currentStep = 0;
  LoginFormBloc _loginFormBloc;
  ProfileFormBloc _profileFormBloc;
  String _textChange = "";

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<StepperChangeProfileBloc>(context)
        .add(StepTapped(step: _currentStep));

    _steps = [
      Step(
        title: Text("Start"),
        content: Text("Change email ${globals.email}."),
        isActive: true,
      ),
      Step(
        title: Text("New E-Mail"),
        content: BlocProvider<ProfileFormBloc>(
          create: (context) {
            _profileFormBloc = ProfileFormBloc(
                BlocProvider.of<AuthenticationBloc>(context).userRepository);
            return _profileFormBloc;
          },
          child: Builder(
            builder: (context) {
              return Container(
                height: 100,
                child: FormBlocListener<ProfileFormBloc, String, String>(
                  onSubmitting: (context, state) => LoadingDialog.show(context),
                  onSuccess: (context, state) {
                    LoadingDialog.hide(context);
                    BlocProvider.of<StepperChangeProfileBloc>(context)
                        .add(StepTapped(step: 2));
                    _currentStep = 2;
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
                        textFieldBloc: BlocProvider.of<ProfileFormBloc>(context)
                            .emailField,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                      )
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
        title: Text("Login"),
        content: BlocProvider<LoginFormBloc>(
          create: (context) {
            _loginFormBloc = LoginFormBloc(
                BlocProvider.of<AuthenticationBloc>(context).userRepository);
            return _loginFormBloc;
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
                    BlocProvider.of<StepperChangeProfileBloc>(context)
                        .add(StepTapped(step: 3));
                    _currentStep = 3;
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
        title: Text("Confirm"),
        content: BlocProvider<ProfileFormBloc>(
          create: (context) {
            return _profileFormBloc;
          },
          child: Builder(
            builder: (context) {
              return Container(
                height: 70,
                child: FormBlocListener<ProfileFormBloc, String, String>(
                  onSubmitting: (context, state) => LoadingDialog.show(context),
                  onSuccess: (context, state) {
                    LoadingDialog.hide(context);
                    if (!_profileFormBloc.dryRun) {
                      _profileFormBloc.submit();
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(AppStarted());
                      _currentStep = 4;
                      Notifications.showSnackBarWithSuccess(context,
                          "We will send you a confirmation via email at the email address provided by you.");
                    }
                  },
                  onFailure: (context, state) {
                    LoadingDialog.hide(context);
                    Notifications.showSnackBarWithError(
                        context, state.failureResponse);
                  },
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[
                      Text(_textChange),
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
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Change email address'),
      ),
      body: Container(
        child: BlocBuilder(
          bloc: BlocProvider.of<StepperChangeProfileBloc>(context),
          builder: (BuildContext context, StepperState state) {
            return Stepper(
              currentStep: state.step,
              steps: _steps,
              type: StepperType.vertical,
              onStepTapped: (step) {},
              onStepCancel: () {
                BlocProvider.of<StepperChangeProfileBloc>(context)
                    .add(StepCancelled());
                _currentStep -= 1;
                if (0 > _currentStep) {
                  locator<NavigationService>().goBack();
                }
              },
              onStepContinue: () {
                // set email to form
                if (_currentStep == 1) {
                  // check new email address
                  _profileFormBloc.add(StepToggleDryRun(true));
                  _profileFormBloc.submit();
                  setState(() {
                    _textChange =
                        "Change email from ${globals.email} to ${globals.new_email}.";
                  });
                } else if (_currentStep == 2) {
                  // login
                  _loginFormBloc.add(StepLogin(email: globals.email));
                  _loginFormBloc.submit();
                } else if (_currentStep == 3) {
                  _profileFormBloc.updateState(_profileFormBloc.initialState);
                  // change email
                  _profileFormBloc.add(StepToggleDryRun(false));
                  _profileFormBloc.submit();
                } else if (_currentStep == 0) {
                  BlocProvider.of<StepperChangeProfileBloc>(context)
                      .add(StepContinue());
                  _currentStep = 1;
                } else if (_currentStep == 4) {
                  BlocProvider.of<NavBloc>(context).add(NavEventStrategies());
                }
              },
            );
          },
        ),
      ),
    );
  }
}
