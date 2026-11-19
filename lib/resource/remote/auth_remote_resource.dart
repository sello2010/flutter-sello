import 'package:dio/dio.dart';
import '../../core/constants/app_config.dart';
import '../../core/utils/auth_interceptor.dart';
import '../local/auth_local_resource.dart';
import '../model/auth_response_model.dart';
import '../model/register_response_model.dart';

class AuthRemoteResource {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: AppConfig.apiPath),
  )..interceptors.add(AuthInterceptor());

  /// Login
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      '/customer/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    final authResponse = AuthResponseModel.fromJson(response.data);
    await AuthLocalResource.saveToken(authResponse.token);

    return authResponse;
  }

  /// Register
  Future<RegisterResponseModel> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    final response = await _dio.post(
      '/customer/register',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    );

    return RegisterResponseModel.fromJson(response.data);
  }

  /// Logout
  Future<void> logout() async {
    await _dio.post('/customer/logout');
    await AuthLocalResource.deleteToken();
  }
}