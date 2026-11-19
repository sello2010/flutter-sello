import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resource/model/product_model.dart';
import '../../resource/remote/home_remote_resource.dart';

sealed class ProductDetailState {
  const ProductDetailState();
}

class ProductDetailInitial extends ProductDetailState {
  const ProductDetailInitial();
}

class ProductDetailLoading extends ProductDetailState {
  const ProductDetailLoading();
}

class ProductDetailLoaded extends ProductDetailState {
  final ProductModel product;
  const ProductDetailLoaded(this.product);
}

class ProductDetailError extends ProductDetailState {
  final String message;
  const ProductDetailError(this.message);
}

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final HomeRemoteResource _remote;

  ProductDetailCubit(this._remote) : super(const ProductDetailInitial());

  Future<void> fetchDetail(String slug) async {
    emit(const ProductDetailLoading());

    final result = await _remote.fetchProductDetail(slug);
    if (isClosed) return;

    result.fold(
      (error) => emit(ProductDetailError(error)),
      (product) => emit(ProductDetailLoaded(product)),
    );
  }
}