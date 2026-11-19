import '../../resource/model/auth_response_model.dart';
import '../../resource/model/register_response_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final AuthResponseModel data;

  AuthAuthenticated(this.data);
}

class AuthRegisterSuccess extends AuthState {
  final RegisterResponseModel data;

  AuthRegisterSuccess(this.data);
}

class AuthLoggedOut extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}