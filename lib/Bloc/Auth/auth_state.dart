part of 'auth_cubit.dart';

enum Authentication {
  initial,
  processing,
  emptyCredential,
  noConnection,
  invalidApi,
  invalidCredential,
  success,
  unknown,
}

@immutable
abstract class AuthState {
  const AuthState();

  Authentication get authentication;
}

class InitialState extends AuthState {
  @override
  final authentication = Authentication.initial;
}

class ProcessingState extends AuthState {
  @override
  final authentication = Authentication.processing;
}

class EmptyCredentialState extends AuthState {
  @override
  final authentication = Authentication.emptyCredential;
}

class NoConnectionState extends AuthState {
  @override
  final authentication = Authentication.noConnection;
}

class InvalidApiState extends AuthState {
  @override
  final authentication = Authentication.invalidApi;
}

class InvalidCredentialState extends AuthState {
  @override
  final authentication = Authentication.invalidCredential;
}

class SuccessState extends AuthState {
  @override
  final authentication = Authentication.success;
  final List<Credential> credential;

  const SuccessState(this.credential);
}

class UnknownState extends AuthState {
  @override
  final authentication = Authentication.unknown;
}
