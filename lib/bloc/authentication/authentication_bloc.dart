import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:portoli/bloc/authentication/bloc.dart';
import 'package:portoli/login/user_repository.dart';
import 'package:portoli/utils/globals.dart' as globals;
import 'package:portoli/utils/logging.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      clear();
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    } else if (event is Delete) {
      yield* _mapDeleteToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await userRepository.isSignedIn();
      if (isSignedIn) {
        yield* _mapLoggedInToState();
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  void clear() {
    globals.email = null;
    globals.uid = null;
    globals.username = null;
    globals.isLoggedIn = false;
  }

  Stream<AuthenticationState> _mapDeleteToState() async* {
    try {
      final user = await userRepository.getCurrentUser();
      clear();
      await Firestore.instance
          .collection('portfolios')
          .document(user.uid)
          .delete();
      await Firestore.instance
          .collection('usernames')
          .document(user.displayName)
          .delete();
      await user.delete();
      yield Unauthenticated();
    } catch (e) {
      getLogger("deleteUser").w("Couldn't delete user. ${e.toString()}");
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    final user = await userRepository.getCurrentUser();
    await user.reload();
    if (user.isEmailVerified) {
      globals.email = user.email;
      globals.uid = user.uid;
      globals.username = user.displayName;
      globals.isLoggedIn = true;
      yield Authenticated(globals.username);
    } else {
      yield NotVerified(globals.email);
    }
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    clear();
    await userRepository.signOut();
  }
}
