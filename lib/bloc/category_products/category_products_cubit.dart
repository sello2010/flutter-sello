import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resource/model/category_products_model.dart';
import '../../resource/remote/home_remote_resource.dart';

sealed class CategoryProductsState {
  const CategoryProductsState();
}

class CategoryProductsInitial extends CategoryProductsState {
  const CategoryProductsInitial();
}

class CategoryProductsLoading extends CategoryProductsState {
  const CategoryProductsLoading();
}

class CategoryProductsLoaded extends CategoryProductsState {
  final CategoryProductsModel data;
  const CategoryProductsLoaded(this.data);
}

class CategoryProductsError extends CategoryProductsState {
  final String message;
  const CategoryProductsError(this.message);
}

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  final HomeRemoteResource _remote;

  CategoryProductsCubit(this._remote)
      : super(const CategoryProductsInitial());

  Future<void> fetchByCategory(String slug) async {
    emit(const CategoryProductsLoading());

    final result = await _remote.fetchCategoryBySlug(slug);
    if (isClosed) return;

    result.fold(
      (error) => emit(CategoryProductsError(error)),
      (data) => emit(CategoryProductsLoaded(data)),
    );
  }
}