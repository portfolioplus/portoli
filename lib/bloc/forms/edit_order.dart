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

const int MAX_SUGGESTIONS = 10;


class EditOrderFormBloc extends FormBloc<String, String> {
  final PortfolioEntity portfolio;
  final Orders order;
  final BuildContext context;

  final priceField = TextFieldBloc(
      validators: [FieldBlocValidators.requiredTextFieldBloc, isNumeric]);

  final amountField = TextFieldBloc(
      validators: [FieldBlocValidators.requiredTextFieldBloc, isNumeric]);

  final dateField = TextFieldBloc(
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

  EditOrderFormBloc(this.portfolio, this.order, this.context) {
    List<String> symbols = getSymbolsOfStock(this.order.name);
    symbols.forEach((f) => this.symbolList.addItem(f));
    symbolList.updateInitialValue(this.order.symbol);
    currencyList.updateInitialValue(this.order.price.currency);
    priceField.updateInitialValue(this.order.price.price.toString());
    amountField.updateInitialValue(this.order.amount.toString());
    dateField.updateInitialValue(DateFormat().format(this.order.date));
  }

  @override
  List<FieldBloc> get fieldBlocs =>
      [symbolList, priceField, currencyList, amountField, dateField];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    try {
      // delete order
      BlocProvider.of<PortfolioBloc>(this.context)
          .add(PortfolioEventDeleteOrder(this.portfolio, this.order));
      Price price = Price(priceField.valueToDouble, currencyList.value);

      var newOrder = Orders(
          price,
          amountField.valueToDouble,
          DateFormat().parse(dateField.value),
          symbolList.value,
          this.order.name,
          -1);

      BlocProvider.of<PortfolioBloc>(this.context)
          .add(PortfolioEventAddOrder(this.portfolio, newOrder));
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
