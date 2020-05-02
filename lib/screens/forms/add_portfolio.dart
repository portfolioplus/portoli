import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:portoli/bloc/forms/add_portfolio.dart';
import 'package:portoli/bloc/nav/nav_bloc.dart';
import 'package:portoli/bloc/nav/nav_event.dart';
import 'package:portoli/widgets/loading_dialog.dart';
import 'package:portoli/widgets/notifications.dart';

class AddPortfolioForm extends StatelessWidget {

  const AddPortfolioForm();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddPortfolioFormBloc>(
      create: (context) => AddPortfolioFormBloc(),
      child: Builder(
        builder: (context) {
          DateTime currentTime = DateTime.now();
          return Scaffold(
            body: FormBlocListener<AddPortfolioFormBloc, String, String>(
              onSubmitting: (context, state) => LoadingDialog.show(context),
              onSuccess: (context, state) {
                LoadingDialog.hide(context);
                BlocProvider.of<NavDrawerBloc>(context).add(NavEventSuccess(NavEventPortfolios(closeDrawer: false)));
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
                    textFieldBloc: BlocProvider.of<AddPortfolioFormBloc>(context).name,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.book),
                    ),
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: BlocProvider.of<AddPortfolioFormBloc>(context).description,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      prefixIcon: Icon(Icons.description),
                    ),
                  ),
                  CheckboxFieldBlocBuilder(
                    booleanFieldBloc: BlocProvider.of<AddPortfolioFormBloc>(context).isPrivate,
                    body: Text('Private'),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: BlocProvider.of<AddPortfolioFormBloc>(context).submit,
                      child: Center(child: Text('Save')),
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
