import 'package:form_bloc/form_bloc.dart';

class ChangeDatelEvent extends FormBlocEvent {
  final DateTime date;

  ChangeDatelEvent(this.date);

  @override
  String toString() => '$runtimeType: { Date: $date }';

  @override
  List<Object> get props => [date];
}

class ResetSymbolEvent extends FormBlocEvent {
  ResetSymbolEvent();

  @override
  String toString() => '$runtimeType';

  @override
  List<Object> get props => [];
}

class ChangeSymbolEvent extends FormBlocEvent {
  final String stockName;

  ChangeSymbolEvent(this.stockName);

  @override
  String toString() => '$runtimeType: { stockName: $stockName }';

  @override
  List<Object> get props => [stockName];
}

