import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:portoli/bloc/forms/events.dart';
import 'package:portoli/bloc/forms/validator.dart';
import 'package:portoli/bloc/portfolio/port_bloc.dart';
import 'package:portoli/bloc/portfolio/port_event.dart';
import 'package:portoli/constants/stocks.dart';
import 'package:portoli/entities/portfolio.dart';
import 'package:portoli/entities/strategy_item.dart';
import 'package:intl/intl.dart';

class EditDividendsFormBloc<T> extends FormBloc<String, String> {
  final PortfolioEntity portfolio;
  final Dividend dividend;
  final BuildContext context;

  final divField = TextFieldBloc(
      validators: [FieldBlocValidators.requiredTextFieldBloc, isNumeric]);

  final dateField = TextFieldBloc(
      initialValue: DateFormat().format(DateTime.now()),
      validators: [FieldBlocValidators.requiredTextFieldBloc]);

  final currencyList = SelectFieldBloc<String>(
      initialValue: EUR,
      items: CURRENCIES,
      validators: [
        FieldBlocValidators.requiredSelectFieldBloc,
      ]);

  final symbolList = SelectFieldBloc<String>(validators: [
    FieldBlocValidators.requiredSelectFieldBloc,
  ]);

  EditDividendsFormBloc(this.portfolio, this.dividend, this.context) {
    var mySymbols =
        this.portfolio.getDepot().values.map((f) => f.symbol).toList();
    mySymbols.forEach((f) => symbolList.addItem(f));
    symbolList.updateInitialValue(this.dividend.symbol);
    currencyList.updateInitialValue(this.dividend.dividend.currency);
    divField.updateInitialValue(this.dividend.dividend.price.toString());
    dateField.updateInitialValue(DateFormat().format(this.dividend.date));
  }

  @override
  List<FieldBloc> get fieldBlocs =>
      [symbolList, divField, currencyList, dateField];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    try {
      Price price = Price(divField.valueToDouble, currencyList.value);
      PortfolioEntity.save(portfolio);
      BlocProvider.of<PortfolioBloc>(this.context)
          .add(PortfolioEventDeleteDividend(this.portfolio, this.dividend));
      BlocProvider.of<PortfolioBloc>(this.context)
          .add(PortfolioEventAddDividend(this.portfolio,  Dividend(price, symbolList.value, DateFormat().parse(dateField.value))));
      yield state.toSuccess();
    } catch (e) {
      yield state.toFailure();
    }
  }

  @override
  void onEvent(FormBlocEvent event) {
    super.onEvent(event);
    if (event is ChangeDatelEvent) {
      dateField.updateValue(DateFormat().format(event.date));
    }
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    return;
  }
}
