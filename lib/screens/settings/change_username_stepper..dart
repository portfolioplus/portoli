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
import 'package:portoli/utils/globals.dart' as globals;
import 'package:portoli/widgets/google_login_button.dart';
import 'package:portoli/widgets/hr_text.dart';
import 'package:portoli/widgets/loading_dialog.dart';
import 'package:portoli/widgets/notifications.dart';

class ChangeUsernameStepper extends StatelessWidget {
  List<Step> _steps;
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    _currentStep = 0;
    BlocProvider.of<StepperChangeProfileBloc>(context).add(StepTapped(step: 0));
    LoginFormBloc loginFormBloc;
    ProfileFormBloc profileFormBloc;
    _steps = [
      Step(
        title: Text("Start"),
        content: Text(
            "Change email ${globals.email} or user name ${globals.username}."),
        isActive: true,
      ),
      Step(
        title: Text("Profile"),
        content: BlocProvider<ProfileFormBloc>(
          create: (context) {
            profileFormBloc = ProfileFormBloc(
                BlocProvider.of<AuthenticationBloc>(context).userRepository);
            return profileFormBloc;
          },
          child: Builder(
            builder: (context) {
              return Container(
                height: 200,
                child: FormBlocListener<ProfileFormBloc, String, String>(
                  onSubmitting: (context, state) => LoadingDialog.show(context),
                  onSuccess: (context, state) {
                    LoadingDialog.hide(context);
                    BlocProvider.of<StepperChangeProfileBloc>(context)
                        .add(StepTapped(step: 3));
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
                        textFieldBloc: BlocProvider.of<ProfileFormBloc>(context)
                            .emailField,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      TextFieldBlocBuilder(
                        textFieldBloc: BlocProvider.of<ProfileFormBloc>(context)
                            .usernameField,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
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
                    BlocProvider.of<StepperChangeProfileBloc>(context)
                        .add(StepTapped(step: 3));
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
        title: Text("Confirm"),
        content: BlocProvider<ProfileFormBloc>(
          create: (context) {
            return profileFormBloc;
          },
          child: Builder(
            builder: (context) {
              return Container(
                height: 200,
                child: FormBlocListener<ProfileFormBloc, String, String>(
                  onSubmitting: (context, state) => LoadingDialog.show(context),
                  onSuccess: (context, state) {
                    LoadingDialog.hide(context);
                    profileFormBloc.add(StepToggleDryRun(true));
                    profileFormBloc.submit();
                    _currentStep += 1;
                    Notifications.showSnackBarWithSuccess(context,
                        "We will send you a confirmation via email at the email address provided by you.");
                  },
                  onFailure: (context, state) {
                    LoadingDialog.hide(context);
                    Notifications.showSnackBarWithError(
                        context, state.failureResponse);
                  },
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[
                      Text(
                          "Change email from ${globals.email} to ${globals.email} and "
                          "user name from ${globals.username} to ${globals.username}."),
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
                  BlocProvider.of<NavDrawerBloc>(context)
                      .add(NavEventStrategies());
                  // locator<NavigationService>().goBack();
                }
              },
              onStepContinue: () {
                // set email to form
                if (_currentStep == 1) {
                  profileFormBloc.add(StepToggleDryRun(true));
                  profileFormBloc.submit();
                } else if (_currentStep == 3) {
                  profileFormBloc.add(StepToggleDryRun(false));
                  profileFormBloc.submit();
                  _currentStep += 1;
                } else {
                  _currentStep += 1;
                  BlocProvider.of<StepperChangeProfileBloc>(context)
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
