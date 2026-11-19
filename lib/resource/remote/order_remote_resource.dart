import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import '../../core/constants/app_config.dart';
import '../../core/utils/auth_interceptor.dart';
import '../model/order_detail_model.dart';
import '../model/order_list_response_model.dart';

class OrderRemoteResource {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: AppConfig.apiPath),
  )..interceptors.add(AuthInterceptor());

  /// Ambil pesan error dari response server (kalau ada)
  String _errorMessage(DioException e) {
    final data = e.response?.data;
    if (data is Map && data['message'] is String) {
      return data['message'] as String;
    }
    return e.toString();
  }

  /// Ambil daftar pesanan milik user yang sedang login
  Future<Either<String, OrderListResponseModel>> fetchMyOrders() async {
    try {
      final response = await _dio.get('/customer/my-orders');
      if (response.statusCode == 200) {
        return Right(OrderListResponseModel.fromJson(response.data));
      } else {
        return const Left('Gagal mengambil data pesanan');
      }
    } on DioException catch (e) {
      return Left(e.toString());
    }
  }

  /// Ambil detail pesanan (termasuk item pesanan dan pengiriman)
  /// berdasarkan snap_token.
  Future<Either<String, OrderDetailModel>> fetchOrderDetail(
      String snapToken) async {
    try {
      final response = await _dio.get('/customer/my-orders/$snapToken');
      if (response.statusCode == 200) {
        return Right(
          OrderDetailModel.fromJson(
            response.data['data'] as Map<String, dynamic>,
          ),
        );
      } else {
        return const Left('Gagal mengambil detail pesanan');
      }
    } on DioException catch (e) {
      return Left(_errorMessage(e));
    } catch (e) {
      return Left(e.toString());
    }
  }

  /// Kirim ulasan produk. Mengembalikan pesan dari server kalau berhasil.
  Future<Either<String, String>> reviewProduct({
    required int transactionDetailId,
    required int productId,
    required int rating,
    required String review,
  }) async {
    try {
      final response = await _dio.post(
        '/customer/ratings',
        data: {
          'transaction_detail_id': transactionDetailId,
          'product_id': productId,
          'rating': rating,
          'review': review,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        final message = (data is Map && data['message'] is String)
            ? data['message'] as String
            : 'Rating berhasil ditambahkan';
        return Right(message);
      } else {
        return const Left('Gagal mengirim ulasan');
      }
    } on DioException catch (e) {
      // Mis. 409: "Anda sudah pernah memberikan rating untuk produk ini"
      return Left(_errorMessage(e));
    } catch (e) {
      return Left(e.toString());
    }
  }
}