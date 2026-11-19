import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import '../../core/constants/app_config.dart';
import '../../core/utils/auth_interceptor.dart';
import '../model/customer_model.dart';

class ProfileRemoteResource {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: AppConfig.apiPath),
  )..interceptors.add(AuthInterceptor());

  /// Ambil data profil
  Future<Either<String, CustomerModel>> fetchProfile() async {
    try {
      final response = await _dio.get('/customer/profile');
      if (response.statusCode == 200) {
        return Right(CustomerModel.fromJson(response.data['customer']));
      } else {
        return const Left('Gagal fetch profile');
      }
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  /// Update profil
  Future<Either<dynamic, String>> updateProfile({
    required String name,
    required String email,
  }) async {
    try {
      final response = await _dio.post(
        '/customer/profile',
        data: {
          'name': name,
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        return Right(response.data['message']);
      } else {
        return Left(response.data['message']);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        return Left(e.response?.data);
      }
      return Left(e.toString());
    }
  }
}