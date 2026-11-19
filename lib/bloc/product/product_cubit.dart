import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resource/model/product_model.dart';
import '../../resource/remote/home_remote_resource.dart';

sealed class ProductState {
  const ProductState();
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  final bool hasMore;
  const ProductLoaded(this.products, {required this.hasMore});
}

class ProductError extends ProductState {
  final String message;
  const ProductError(this.message);
}

/// Produk terbaru dengan paging (5 produk per halaman).
/// Detail produk akan ditambahkan di materi Halaman Product.
class ProductCubit extends Cubit<ProductState> {
  final HomeRemoteResource _remote;

  ProductCubit(this._remote) : super(const ProductInitial());

  int _currentPage = 1;
  bool _hasMore = true;
  final List<ProductModel> _products = [];

  /// [isRefresh] true: mulai lagi dari halaman 1.
  /// Tanpa isRefresh: ambil halaman berikutnya (load more).
  Future<void> fetchProduct({bool isRefresh = false, String query = ''}) async {
    if (isRefresh) {
      _currentPage = 1;
      _hasMore = true;
      _products.clear();
    }
    if (_products.isEmpty) {
      emit(const ProductLoading());
    }
    if (!_hasMore) return;

    final result = await _remote.fetchProducts(
      page: _currentPage,
      query: query,
    );
    if (isClosed) return;

    result.fold(
      (error) => emit(ProductError(error)),
      (paging) {
        _products.addAll(paging.data);
        _hasMore = paging.hasNextPage;
        _currentPage++;
        emit(ProductLoaded(List.of(_products), hasMore: _hasMore));
      },
    );
  }
}