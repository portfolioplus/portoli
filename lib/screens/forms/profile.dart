import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:portoli/bloc/authentication/bloc.dart';
import 'package:portoli/bloc/forms/profile.dart';
import 'package:portoli/bloc/nav/nav_bloc.dart';
import 'package:portoli/bloc/nav/nav_event.dart';
import 'package:portoli/widgets/loading_dialog.dart';
import 'package:portoli/widgets/notifications.dart';

class ProfileForm extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final userRepository = BlocProvider.of<AuthenticationBloc>(context).userRepository;
    return BlocProvider<ProfileFormBloc>(
      create: (context) => ProfileFormBloc(userRepository),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: FormBlocListener<ProfileFormBloc, String, String>(
              onSubmitting: (context, state) => LoadingDialog.show(context),
              onSuccess: (context, state) {
                LoadingDialog.hide(context);
                BlocProvider.of<AuthenticationBloc>(context).add(AppStarted());
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
                  TextFieldBlocBuilder(
                    textFieldBloc:
                        BlocProvider.of<ProfileFormBloc>(context).emailField,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed:
                          BlocProvider.of<ProfileFormBloc>(context).submit,
                      child: Center(child: Text('Edit')),
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
