import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import '../../core/constants/app_config.dart';
import '../model/category_model.dart';
import '../model/category_products_model.dart';
import '../model/paging_model.dart';
import '../model/product_model.dart';
import '../model/slider_model.dart';

/// Mengambil data untuk halaman Home: slider, kategori, dan produk.
/// Semua endpoint ini publik, jadi tidak butuh token.
class HomeRemoteResource {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: AppConfig.apiPath),
  );

  String _errorMessage(DioException e) {
    final data = e.response?.data;
    if (data is Map && data['message'] is String) {
      return data['message'] as String;
    }
    return e.toString();
  }

  /// Ubah response { success, message, data: [ ... ] } menjadi List<T>
  List<T> _parseList<T>(
    dynamic body,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final raw = body['data'] as List;
    return raw.map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<Either<String, List<SliderModel>>> fetchSliders() async {
    try {
      final response = await _dio.get('/public/sliders');
      if (response.statusCode == 200) {
        return Right(_parseList(response.data, SliderModel.fromJson));
      }
      return const Left('Gagal mengambil data slider');
    } on DioException catch (e) {
      return Left(_errorMessage(e));
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<CategoryModel>>> fetchCategories() async {
    try {
      final response = await _dio.get('/public/categories');
      if (response.statusCode == 200) {
        return Right(_parseList(response.data, CategoryModel.fromJson));
      }
      return const Left('Gagal mengambil data kategori');
    } on DioException catch (e) {
      return Left(_errorMessage(e));
    } catch (e) {
      return Left(e.toString());
    }
  }

  /// Produk berhalaman (5 per halaman). [page] dimulai dari 1.
  Future<Either<String, PagingModel<ProductModel>>> fetchProducts({
    int page = 1,
    String query = '',
  }) async {
    try {
      final response = await _dio.get(
        '/public/products',
        queryParameters: {'page': page, 'search': query},
      );
      if (response.statusCode == 200) {
        return Right(
          PagingModel.fromJson(
            response.data['data'] as Map<String, dynamic>,
            ProductModel.fromJson,
          ),
        );
      }
      return const Left('Gagal mengambil data produk');
    } on DioException catch (e) {
      return Left(_errorMessage(e));
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> fetchProductsPopuler() async {
    try {
      final response = await _dio.get('/public/products-popular');
      if (response.statusCode == 200) {
        return Right(_parseList(response.data, ProductModel.fromJson));
      }
      return const Left('Gagal mengambil produk populer');
    } on DioException catch (e) {
      return Left(_errorMessage(e));
    } catch (e) {
      return Left(e.toString());
    }
  }

  /// Detail satu produk (lengkap dengan kategori dan daftar ulasan).
  Future<Either<String, ProductModel>> fetchProductDetail(String slug) async {
    try {
      final response = await _dio.get('/public/products/$slug');
      if (response.statusCode == 200) {
        return Right(
          ProductModel.fromJson(response.data['data'] as Map<String, dynamic>),
        );
      }
      return const Left('Gagal mengambil detail produk');
    } on DioException catch (e) {
      return Left(_errorMessage(e));
    } catch (e) {
      return Left(e.toString());
    }
  }

  /// Satu kategori beserta produk-produknya, berdasarkan slug kategori.
  Future<Either<String, CategoryProductsModel>> fetchCategoryBySlug(
      String slug) async {
    try {
      final response = await _dio.get('/public/categories/$slug');
      if (response.statusCode == 200) {
        return Right(
          CategoryProductsModel.fromJson(
            response.data['data'] as Map<String, dynamic>,
          ),
        );
      }
      return const Left('Gagal mengambil produk kategori');
    } on DioException catch (e) {
      return Left(_errorMessage(e));
    } catch (e) {
      return Left(e.toString());
    }
  }
}