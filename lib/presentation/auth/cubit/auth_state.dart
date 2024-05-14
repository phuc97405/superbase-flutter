part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final AuthStatus status;
  // final CreateUserResponse? user;
  final String? messError;
  final String? method;
  final String? accessToken;
  const AuthState(
      {
      // required this.user,
      required this.status,
      this.messError,
      this.accessToken,
      this.method});

  const AuthState._(
      {this.status = AuthStatus.unknown,
      // this.user,
      this.messError,
      this.accessToken,
      this.method});

  const AuthState.init() : this._();

  const AuthState.authenticated(
      {this.status = AuthStatus.authenticated,
      // this.user,
      this.messError,
      this.accessToken,
      this.method});

  @override
  List<Object?> get props => [messError, status, accessToken, method];
}
