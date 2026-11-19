import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resource/model/product_model.dart';
import '../../resource/remote/home_remote_resource.dart';

sealed class ProductPopularState {
  const ProductPopularState();
}

class ProductPopularInitial extends ProductPopularState {
  const ProductPopularInitial();
}

class ProductPopularLoading extends ProductPopularState {
  const ProductPopularLoading();
}

class ProductPopularLoaded extends ProductPopularState {
  final List<ProductModel> products;
  const ProductPopularLoaded(this.products);
}

class ProductPopularError extends ProductPopularState {
  final String message;
  const ProductPopularError(this.message);
}

class ProductPopularCubit extends Cubit<ProductPopularState> {
  final HomeRemoteResource _remote;

  ProductPopularCubit(this._remote) : super(const ProductPopularInitial());

  Future<void> fetchProductPopular() async {
    emit(const ProductPopularLoading());

    final result = await _remote.fetchProductsPopuler();
    if (isClosed) return;

    result.fold(
      (error) => emit(ProductPopularError(error)),
      (products) => emit(ProductPopularLoaded(products)),
    );
  }
}