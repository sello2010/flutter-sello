import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../resource/remote/auth_remote_resource.dart';
import '../../core/utils/error_handle.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRemoteResource authRemoteResource;

  AuthBloc(this.authRemoteResource) : super(AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthRegisterRequested>(_onRegisterRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final result = await authRemoteResource.login(
        email: event.email,
        password: event.password,
      );
      emit(AuthAuthenticated(result));
    } on DioException catch (e) {
      if (e.response?.data is Map && e.response?.data['errors'] != null) {
        final errors = ErrorHandler.parseErrors(e.response?.data['errors']);
        emit(AuthError(errors.values.first));
      } else {
        emit(AuthError(e.response?.data['message'] ?? 'Login gagal'));
      }
    } catch (e) {
      emit(AuthError('Terjadi kesalahan, coba lagi'));
    }
  }

  Future<void> _onRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final result = await authRemoteResource.register(
        name: event.name,
        email: event.email,
        password: event.password,
        passwordConfirmation: event.passwordConfirmation,
      );
      emit(AuthRegisterSuccess(result));
    } on DioException catch (e) {
      if (e.response?.data is Map && e.response?.data['errors'] != null) {
        final errors = ErrorHandler.parseErrors(e.response?.data['errors']);
        emit(AuthError(errors.values.first));
      } else {
        emit(AuthError(e.response?.data['message'] ?? 'Register gagal'));
      }
    } catch (e) {
      emit(AuthError('Terjadi kesalahan, coba lagi'));
    }
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await authRemoteResource.logout();
      emit(AuthLoggedOut());
    } catch (e) {
      emit(AuthLoggedOut());
    }
  }
}