import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:portoli/login/user_repository.dart';
import 'package:portoli/utils/globals.dart' as global;

class RegisterFormBloc extends FormBloc<String, String> {
  final _usernamesCollections = Firestore.instance.collection('usernames');
  final UserRepository _userRepository;

  Future<String> uniqueUsernameFieldBloc(String username) async {
    var userRef = await _usernamesCollections.document(username).get();
    if (userRef.exists) {
      return "Username $username already exists.";
    }

    return null;
  }

  final emailField = TextFieldBloc(validators: [
    FieldBlocValidators.requiredTextFieldBloc,
    FieldBlocValidators.email
  ]);

  final usernameField =
      TextFieldBloc(validators: [FieldBlocValidators.requiredTextFieldBloc]);

  final passwordField = TextFieldBloc(validators: [
    FieldBlocValidators.requiredTextFieldBloc,
    FieldBlocValidators.passwordMin6Chars
  ]);

  final passwordConfirm = TextFieldBloc();

  final termAndConditionsField = BooleanFieldBloc(
    validators: [FieldBlocValidators.requiredBooleanFieldBloc],
  );
  RegisterFormBloc(this._userRepository) {
    usernameField.addAsyncValidators([uniqueUsernameFieldBloc]);
    passwordConfirm
        .addValidators([FieldBlocValidators.confirmPassword(passwordField)]);
  }

  @override
  List<FieldBloc> get fieldBlocs => [
        emailField,
        usernameField,
        passwordField,
        passwordConfirm,
        termAndConditionsField
      ];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    try {
      await _userRepository.signUp(
          email: emailField.value, password: passwordField.value);
      var user = await _userRepository.getCurrentUser();
      if(!user.isEmailVerified)
      {
        global.email = emailField.value;
        user.sendEmailVerification();
      }
      UserUpdateInfo userInfo = UserUpdateInfo();
      userInfo.displayName = usernameField.value;
      await user.updateProfile(userInfo);
      // map the uid to the username
      var userRef = _usernamesCollections.document(usernameField.value);
      var uid = await _userRepository.getUserUid();
      await userRef.setData({'uid': uid});
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
