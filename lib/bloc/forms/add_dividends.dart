import 'package:form_bloc/form_bloc.dart';
import 'package:portoli/bloc/forms/events.dart';
import 'package:portoli/bloc/forms/validator.dart';
import 'package:portoli/constants/stocks.dart';
import 'package:portoli/entities/portfolio.dart';
import 'package:portoli/entities/strategy_item.dart';
import 'package:intl/intl.dart';


class AddDividendsFormBloc extends FormBloc<String, String> {
  final PortfolioEntity portfolio;

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

  AddDividendsFormBloc(this.portfolio) {
    var mySymbols =
        this.portfolio.getDepot().values.map((f) => f.symbol).toList();
    mySymbols.forEach((f) => symbolList.addItem(f));
  }

  @override
  List<FieldBloc> get fieldBlocs =>
      [symbolList, divField, currencyList, dateField];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    try {
      Price price = Price(divField.valueToDouble, currencyList.value);
      portfolio.dividends.add(
        Dividend(price, symbolList.value, DateFormat().parse(dateField.value)),
      );
      PortfolioEntity.save(portfolio);
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
