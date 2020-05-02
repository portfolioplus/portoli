import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:portoli/bloc/forms/add_dividends.dart';
import 'package:portoli/bloc/forms/events.dart';
import 'package:portoli/bloc/nav/nav_bloc.dart';
import 'package:portoli/bloc/nav/nav_event.dart';
import 'package:portoli/entities/portfolio.dart';
import 'package:portoli/widgets/loading_dialog.dart';
import 'package:portoli/widgets/notifications.dart';

class AddDividednsForm extends StatelessWidget {
  final PortfolioEntity portfolio;
  const AddDividednsForm({Key key, this.portfolio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddDividendsFormBloc>(
      create: (context) => AddDividendsFormBloc(this.portfolio),
      child: Builder(
        builder: (context) {
          DateTime currentTime = DateTime.now();
          return Scaffold(
            body: FormBlocListener<AddDividendsFormBloc, String, String>(
              onSubmitting: (context, state) => LoadingDialog.show(context),
              onSuccess: (context, state) {
                LoadingDialog.hide(context);
                BlocProvider.of<NavDrawerBloc>(context).add(NavEventDrawerBack());
              },
              onFailure: (context, state) {
                LoadingDialog.hide(context);
                Notifications.showSnackBarWithError(
                    context, state.failureResponse);
              },
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  DropdownFieldBlocBuilder<String>(
                    selectFieldBloc: BlocProvider.of<AddDividendsFormBloc>(context).symbolList,
                    decoration: InputDecoration(
                      labelText: 'Stock',
                      prefixIcon: Icon(Icons.border_style),
                    ),
                    itemBuilder: (context, value) => value,
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: BlocProvider.of<AddDividendsFormBloc>(context).divField,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Dividends',
                      prefixIcon: Icon(Icons.toll),
                    ),
                  ),
                  DropdownFieldBlocBuilder<String>(
                    selectFieldBloc: BlocProvider.of<AddDividendsFormBloc>(context).currencyList,
                    decoration: InputDecoration(labelText: 'Currency'),
                    itemBuilder: (context, value) => value,
                  ),
                  FlatButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context, showTitleActions: true,
                          onConfirm: (date) {
                        BlocProvider.of<AddDividendsFormBloc>(context).add(ChangeDatelEvent(date));
                      }, currentTime: currentTime);
                    },
                    child: TextFieldBlocBuilder(
                      textFieldBloc: BlocProvider.of<AddDividendsFormBloc>(context).dateField,
                      keyboardType: TextInputType.datetime,
                      isEnabled: false,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: BlocProvider.of<AddDividendsFormBloc>(context).submit,
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
