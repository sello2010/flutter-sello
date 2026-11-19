import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import '../../core/constants/app_config.dart';
import '../../core/utils/auth_interceptor.dart';
import '../model/checkout_model.dart';
import '../model/location_model.dart';
import '../model/shipping_cost_model.dart';

/// Pencarian alamat, cek ongkir, dan checkout.
/// Memakai AuthInterceptor karena POST /public/checkout butuh login.
class CheckoutRemoteResource {
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

  /// Server meneruskan "data" dari RajaOngkir apa adanya. Kalau tidak ada
  /// hasil, isinya bisa berupa objek kosong {} (bukan daftar []), jadi
  /// selain List dianggap daftar kosong.
  List<dynamic> _asList(dynamic data) => data is List ? data : const [];

  /// Cari alamat tujuan. Response server berupa list langsung (tanpa
  /// pembungkus "data").
  Future<Either<String, List<LocationModel>>> getLocation(
      String search) async {
    try {
      final response = await _dio.get(
        '/public/search-destination',
        queryParameters: {'search': search},
      );
      if (response.statusCode == 200) {
        return Right(
          _asList(response.data)
              .map((e) => LocationModel.fromMap(e as Map<String, dynamic>))
              .toList(),
        );
      }
      return const Left('Gagal mencari alamat');
    } on DioException catch (e) {
      return Left(_errorMessage(e));
    } catch (e) {
      return Left(e.toString());
    }
  }

  /// Cek ongkir. [destinationId] = id dari hasil getLocation,
  /// [weight] dalam gram, [courier] mis. "jne", "sicepat".
  /// Hasil kosong berarti kurir tidak melayani tujuan itu.
  Future<Either<String, List<ShippingCostModel>>> getShippingCost(
    int destinationId,
    int weight,
    String courier,
  ) async {
    try {
      final response = await _dio.post(
        '/public/cek-ongkir',
        data: {
          'destination': destinationId,
          'weight': weight,
          'courier': courier,
        },
      );
      if (response.statusCode == 200) {
        return Right(
          _asList(response.data)
              .map((e) =>
                  ShippingCostModel.fromMap(e as Map<String, dynamic>))
              .toList(),
        );
      }
      return const Left('Gagal mengecek ongkir');
    } on DioException catch (e) {
      return Left(_errorMessage(e));
    } catch (e) {
      return Left(e.toString());
    }
  }

  /// Buat order di server. Mengembalikan snap_token untuk pembayaran
  /// Midtrans. Isi keranjang diambil server, jadi tidak dikirim dari sini.
  Future<Either<String, String>> checkOut(CheckoutModel checkout) async {
    try {
      final response = await _dio.post(
        '/public/checkout',
        data: checkout.toRequestBody(),
      );
      if (response.statusCode == 200) {
        return Right(response.data['data']['snap_token'] as String);
      }
      return const Left('Checkout gagal');
    } on DioException catch (e) {
      return Left(_errorMessage(e));
    } catch (e) {
      return Left(e.toString());
    }
  }

  /// Cek status pembayaran ke server, yang meneruskannya ke Midtrans.
  /// Mengembalikan status order, mis. "SUCCESS" atau "PENDING".
  Future<Either<String, String>> checkStatus(String invoice) async {
    try {
      final response = await _dio.get('/public/checkout/status/$invoice');
      if (response.statusCode == 200) {
        return Right(response.data['data']['status'].toString());
      }
      return const Left('Gagal mengecek status');
    } on DioException catch (e) {
      return Left(_errorMessage(e));
    } catch (e) {
      return Left(e.toString());
    }
  }
}