import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final String displayName;

  const Authenticated(this.displayName);

  @override
  List<Object> get props => [displayName];

  @override
  String toString() => 'Authenticated { displayName: $displayName }';
}

class NotVerified extends AuthenticationState {
  final String email;

  const NotVerified(this.email);

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'NotVerified { email: $email }';
}

class Unauthenticated extends AuthenticationState {}
