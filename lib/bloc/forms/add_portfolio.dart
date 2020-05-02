import 'package:form_bloc/form_bloc.dart';
import 'package:portoli/entities/portfolio.dart';

class AddPortfolioFormBloc extends FormBloc<String, String> {
  final name =
      TextFieldBloc(validators: [FieldBlocValidators.requiredTextFieldBloc]);

  final description = TextFieldBloc(validators: []);

  final isPrivate = BooleanFieldBloc(initialValue: false);

  AddPortfolioFormBloc();

  @override
  List<FieldBloc> get fieldBlocs => [name, description, isPrivate];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    try {
      var ports = PortfolioEntity.load().where((port) => port.name == name.value).toList();
      if( ports.length > 0) {
        throw Exception('You have already a portfolio with this name.');
      }
      var portfolio = PortfolioEntity(
          "", name.value, description.value, isPrivate.value, [], []);
      PortfolioEntity.save(portfolio);
      yield state.toSuccess();
    } catch (e) {
      yield state.toFailure(e.toString());
    }
  }

  @override
  void onEvent(FormBlocEvent event) {
    super.onEvent(event);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    return;
  }
}
