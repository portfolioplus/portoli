import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:portoli/bloc/forms/add_order_chose_port.dart';
import 'package:portoli/bloc/forms/events.dart';
import 'package:portoli/bloc/nav/nav_bloc.dart';
import 'package:portoli/bloc/nav/nav_event.dart';
import 'package:portoli/entities/portfolio.dart';
import 'package:portoli/entities/strategy_item.dart';
import 'package:portoli/screens/portfolios.dart';
import 'package:portoli/widgets/loading_dialog.dart';
import 'package:portoli/widgets/notifications.dart';

class AddOrderChosePortForm extends StatelessWidget {
  final StockEntity stock;
  final List<PortfolioEntity> portfolios;
  const AddOrderChosePortForm({Key key, this.stock, this.portfolios}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddOrderChosePortFormBloc>(
      create: (context) => AddOrderChosePortFormBloc(this.stock, this.portfolios, context),
      child: Builder(builder: (context) {
        final formBloc = BlocProvider.of<AddOrderChosePortFormBloc>(context);
        final _drawerBloc = BlocProvider.of<NavDrawerBloc>(context);
        DateTime currentTime = DateTime.now();
        if (this.portfolios.length == 0) {
          return NoPortfolio();
        } else {
          return Scaffold(
            body: FormBlocListener<AddOrderChosePortFormBloc, String, String>(
              onSubmitting: (context, state) => LoadingDialog.show(context),
              onSuccess: (context, state) {
                LoadingDialog.hide(context);
                _drawerBloc.add(NavEventDrawerBack());
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
                    selectFieldBloc: formBloc.portfolioList,
                    decoration: InputDecoration(
                      labelText: 'Portfolio',
                      prefixIcon: Icon(Icons.border_style),
                    ),
                    itemBuilder: (context, value) => value,
                  ),
                  DropdownFieldBlocBuilder<String>(
                    selectFieldBloc: formBloc.symbolList,
                    decoration: InputDecoration(
                      labelText: 'Symbol',
                      prefixIcon: Icon(Icons.border_style),
                    ),
                    itemBuilder: (context, value) => value,
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: formBloc.priceField,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      prefixIcon: Icon(Icons.toll),
                    ),
                  ),
                  DropdownFieldBlocBuilder<String>(
                    selectFieldBloc: formBloc.currencyList,
                    decoration: InputDecoration(labelText: 'Currency'),
                    itemBuilder: (context, value) => value,
                  ),
                  TextFieldBlocBuilder(
                    textFieldBloc: formBloc.amountField,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      prefixIcon: Icon(Icons.format_list_numbered_rtl),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context, showTitleActions: true,
                          onConfirm: (date) {
                        formBloc.add(ChangeDatelEvent(date));
                      }, currentTime: currentTime);
                    },
                    child: TextFieldBlocBuilder(
                      textFieldBloc: formBloc.dateField,
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
                      onPressed: formBloc.submit,
                      child: Center(child: Text('Save')),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
