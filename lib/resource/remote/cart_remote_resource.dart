import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import '../../core/constants/app_config.dart';
import '../../core/utils/auth_interceptor.dart';
import '../model/cart_response_model.dart';

/// Semua alamat keranjang butuh login, jadi Dio memakai AuthInterceptor
/// (yang menyertakan token) seperti di OrderRemoteResource.
class CartRemoteResource {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: AppConfig.apiPath),
  )..interceptors.add(AuthInterceptor());

  String _errorMessage(DioException e) {
    if (e.response?.statusCode == 401) {
      return 'Silakan login terlebih dahulu';
    }
    final data = e.response?.data;
    if (data is Map && data['message'] is String) {
      return data['message'] as String;
    }
    return e.toString();
  }

  String _messageOf(dynamic data, String fallback) {
    if (data is Map && data['message'] is String) {
      return data['message'] as String;
    }
    return fallback;
  }

  /// Ambil isi keranjang milik user yang sedang login.
  Future<Either<String, CartResponseModel>> fetchCart() async {
    try {
      final response = await _dio.get('/public/carts');
      if (response.statusCode == 200) {
        return Right(
          CartResponseModel.fromJson(
            response.data['data'] as Map<String, dynamic>,
          ),
        );
      }
      return const Left('Gagal mengambil keranjang');
    } on DioException catch (e) {
      return Left(_errorMessage(e));
    } catch (e) {
      return Left(e.toString());
    }
  }

  /// Simpan produk ke keranjang. Kalau produk sudah ada di keranjang,
  /// server menambah jumlahnya 1.
  Future<Either<String, String>> cartStore(int productId, int qty) async {
    try {
      final response = await _dio.post(
        '/public/carts',
        data: {'product_id': productId, 'qty': qty},
      );
      if (response.statusCode == 200) {
        return Right(_messageOf(response.data, 'Produk ditambahkan'));
      }
      return Left(_messageOf(response.data, 'Gagal menambah ke keranjang'));
    } on DioException catch (e) {
      return Left(_errorMessage(e));
    } catch (e) {
      return Left(e.toString());
    }
  }

  /// Tambah jumlah (+1) item keranjang.
  Future<Either<String, String>> incrementCart(
    int productId,
    int cartId,
  ) async {
    try {
      final response = await _dio.post(
        '/public/carts/increment',
        data: {'product_id': productId, 'cart_id': cartId},
      );
      if (response.statusCode == 200) {
        return Right(_messageOf(response.data, 'Jumlah ditambahkan'));
      }
      return Left(_messageOf(response.data, 'Gagal menambah jumlah'));
    } on DioException catch (e) {
      return Left(_errorMessage(e));
    } catch (e) {
      return Left(e.toString());
    }
  }

  /// Kurangi jumlah (-1) item keranjang.
  /// Catatan: server tidak membatasi jumlah minimal, jadi tampilan keranjang
  /// sebaiknya tidak memanggil ini kalau jumlahnya sudah 1.
  Future<Either<String, String>> decrementCart(
    int productId,
    int cartId,
  ) async {
    try {
      final response = await _dio.post(
        '/public/carts/decrement',
        data: {'product_id': productId, 'cart_id': cartId},
      );
      if (response.statusCode == 200) {
        return Right(_messageOf(response.data, 'Jumlah dikurangi'));
      }
      return Left(_messageOf(response.data, 'Gagal mengurangi jumlah'));
    } on DioException catch (e) {
      return Left(_errorMessage(e));
    } catch (e) {
      return Left(e.toString());
    }
  }

  /// Hapus satu item dari keranjang.
  Future<Either<String, String>> deleteCart(int cartId) async {
    try {
      final response = await _dio.delete('/public/carts/$cartId');
      if (response.statusCode == 200) {
        return Right(_messageOf(response.data, 'Keranjang dihapus'));
      }
      return Left(_messageOf(response.data, 'Gagal menghapus keranjang'));
    } on DioException catch (e) {
      return Left(_errorMessage(e));
    } catch (e) {
      return Left(e.toString());
    }
  }
}