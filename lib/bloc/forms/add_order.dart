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
import 'package:string_similarity/string_similarity.dart';
import 'package:intl/intl.dart';

const int MAX_SUGGESTIONS = 10;

class AddOrderFormBloc extends FormBloc<String, String> {
  final PortfolioEntity portfolio;
  final BuildContext context;

  final stockField = TextFieldBloc(validators: [
    FieldBlocValidators.requiredTextFieldBloc,
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

  AddOrderFormBloc(this.portfolio, this.context) {
    stockField.updateSuggestions(stockSuggestions);
  }

  Future<List<String>> stockSuggestions(String value) async {
    if (value.length < 2) {
      return [];
    }

    List<String> findStocks = [];
    List<String> stocks = [];
    for (var stock in STOCKS) {
      stocks.add(stock['name']);
    }
    BestMatch diffScoresName = StringSimilarity.findBestMatch(value, stocks);
    diffScoresName.ratings.sort((a, b) => (b.rating).compareTo(a.rating));
    for (var rating in diffScoresName.ratings) {
      if (findStocks.length >= MAX_SUGGESTIONS) {
        break;
      }
      findStocks.add(rating.target);
    }

    return findStocks;
  }

  @override
  List<FieldBloc> get fieldBlocs => [
        stockField,
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
      var newOrder = Orders(price, amountField.valueToDouble,
            DateFormat().parse(dateField.value), symbolList.value, stockField.value, -1);

      BlocProvider.of<PortfolioBloc>(this.context).add(PortfolioEventAddOrder(this.portfolio, newOrder));
      yield state.toSuccess();
    } catch (e) {
      yield state.toFailure();
    }
  }

  @override
  void onEvent(FormBlocEvent event) {
    super.onEvent(event);

    if (event is ChangeSymbolEvent) {
      symbolList.clear();
      List<String> symbols = getSymbolsOfStock(event.stockName);
 
      symbolList.updateItems(symbols);
      symbolList.updateInitialValue(symbols[0]);
      // yield* this.onReload();
    } else if (event is ChangeDatelEvent) {
      dateField.updateValue(DateFormat().format(event.date));
    } else if (event is ResetSymbolEvent) {
      symbolList.clear();
    }
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    return;
  }
}
