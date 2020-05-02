import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:portoli/login/user_repository.dart';
import 'package:portoli/utils/globals.dart' as globals;

class StepToggleDryRun extends FormBlocEvent {
  final bool dryRun;

  StepToggleDryRun(this.dryRun);


  @override
  String toString() => 'StepToggleDryRun';

  @override
  List<Object> get props => [dryRun];
}

class ProfileFormBloc extends FormBloc<String, String> {
  final _usernamesCollections = Firestore.instance.collection('usernames');
  final UserRepository _userRepository;
  bool dryRun = false;

  Future<String> uniqueUsernameFieldBloc(String username) async {
    if (globals.username != username) {
      var userRef = await _usernamesCollections.document(username).get();
      if (userRef.exists) {
        return "Username $username already exists.";
      }
    }
    return null;
  }

  static String emailChanged(String email) {
    if (globals.email == email) {
      return "Email is the same as previous.";
    }
    return null;
  }

  final emailField = TextFieldBloc(validators: [
    FieldBlocValidators.requiredTextFieldBloc,
    FieldBlocValidators.email,
    emailChanged
  ]);

  final usernameField =
      TextFieldBloc(validators: [FieldBlocValidators.requiredTextFieldBloc]);

  ProfileFormBloc(this._userRepository) {
    usernameField.updateInitialValue(globals.username);
    emailField.updateInitialValue(globals.email);
    usernameField.addAsyncValidators([uniqueUsernameFieldBloc]);
  }

  @override
  List<FieldBloc> get fieldBlocs => [
        emailField,
        usernameField,
      ];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    globals.new_email = emailField.value;
    if (dryRun) {
      yield state.toSuccess();
    } else {
      try {
        if (emailField.value != globals.email) {
          var user = (await _userRepository.getCurrentUser());
          await user.updateEmail(emailField.value);
          user.sendEmailVerification();
        }

        if (usernameField.value != globals.username) {
          var user = await _userRepository.getCurrentUser();
          UserUpdateInfo userInfo = UserUpdateInfo();
          userInfo.displayName = usernameField.value;
          await user.updateProfile(userInfo);
          // map the uid to the username
          // potential raise condition if two users chose same name
          var userRef = _usernamesCollections.document(usernameField.value);
          var uid = await _userRepository.getUserUid();
          await userRef.setData({'uid': uid});
          // delete old username
          await _usernamesCollections.document(globals.username).delete();
        }

        yield state.toSuccess();
      } catch (e) {
        yield state.toFailure(e.toString());
      }
    }
  }

  @override
  void onEvent(FormBlocEvent event) {
    if (event is StepToggleDryRun) {
      this.dryRun = event.dryRun;
    }
    super.onEvent(event);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    return;
  }
}
