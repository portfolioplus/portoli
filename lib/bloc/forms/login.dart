import 'package:flutter/widgets.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:portoli/login/user_repository.dart';

class StepLogin extends FormBlocEvent {
  final String email;

  StepLogin({@required this.email});

  @override
  String toString() => 'StepLogin { email: $email }';

  @override
  List<Object> get props => [email];
}

class LoginFormBloc extends FormBloc<String, String> {

  final UserRepository _userRepository;
  
  final emailField = TextFieldBloc(
      validators: [FieldBlocValidators.requiredTextFieldBloc, FieldBlocValidators.email]);

  final passwordField = TextFieldBloc(
      validators: [FieldBlocValidators.requiredTextFieldBloc]);

  LoginFormBloc(this._userRepository);


  @override
  List<FieldBloc> get fieldBlocs =>
      [emailField, passwordField];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    try {
      await _userRepository.signInWithCredentials(emailField.value, passwordField.value);
      var user = await _userRepository.getCurrentUser();
      if (!user.isEmailVerified)
      {
        _userRepository.signOut();
        throw Exception('Login rejected email address is not verified.');
      }
      yield state.toSuccess();
    } catch (e) {
      yield state.toFailure(e.message);
    }
  }

  @override
  void onEvent(FormBlocEvent event) {
    if(event is StepLogin)
    {
      this.emailField.updateValue(event.email);
    }
    super.onEvent(event);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    return;
  }
}
