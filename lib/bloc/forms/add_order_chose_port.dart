import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:portoli/bloc/forms/events.dart';
import 'package:portoli/bloc/forms/validator.dart';
import 'package:portoli/bloc/portfolio/port_bloc.dart';
import 'package:portoli/bloc/portfolio/port_event.dart';
import 'package:portoli/bloc/portfolio/port_state.dart';
import 'package:portoli/constants/stocks.dart';
import 'package:portoli/entities/portfolio.dart';
import 'package:portoli/entities/strategy_item.dart';
import 'package:string_similarity/string_similarity.dart';
import 'package:intl/intl.dart';

const int MAX_SUGGESTIONS = 10;

class AddOrderChosePortFormBloc extends FormBloc<String, String> {
  final StockEntity stock;
  final BuildContext context;
  final List<PortfolioEntity> portfolios;
  final portfolioList = SelectFieldBloc<String>(validators: [
    FieldBlocValidators.requiredSelectFieldBloc,
  ]);

  final priceField = TextFieldBloc(
      validators: [FieldBlocValidators.requiredTextFieldBloc, isNumeric]);

  final amountField = TextFieldBloc(
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

  AddOrderChosePortFormBloc(this.stock, this.portfolios, this.context) {
    List<String> symbols = getSymbolsOfStock(stock.name);
    symbolList.updateItems(symbols);
    symbolList.updateInitialValue(symbols[0]);

    var items = this.portfolios.map((f) => f.name).toList();
    if (items.length > 0) {
      portfolioList.updateItems(items);
      portfolioList.updateInitialValue(items[0]);
    }
  }

  @override
  List<FieldBloc> get fieldBlocs => [
        portfolioList,
        symbolList,
        priceField,
        currencyList,
        amountField,
        dateField
      ];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    try {
      Price price = Price(priceField.valueToDouble, currencyList.value);
      var newOrder = Orders(
          price,
          amountField.valueToDouble,
          DateFormat().parse(dateField.value),
          symbolList.value,
          stock.name,
          -1);
      var portfolio =
          portfolios.firstWhere((test) => test.name == portfolioList.value);
      BlocProvider.of<PortfolioBloc>(this.context)
          .add(PortfolioEventAddOrder(portfolio, newOrder));
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
