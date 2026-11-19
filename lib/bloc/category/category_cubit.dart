import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resource/model/category_model.dart';
import '../../resource/remote/home_remote_resource.dart';

sealed class CategoryState {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  const CategoryInitial();
}

class CategoryLoading extends CategoryState {
  const CategoryLoading();
}

class CategoryLoaded extends CategoryState {
  final List<CategoryModel> categories;
  const CategoryLoaded(this.categories);
}

class CategoryError extends CategoryState {
  final String message;
  const CategoryError(this.message);
}

class CategoryCubit extends Cubit<CategoryState> {
  final HomeRemoteResource _remote;

  CategoryCubit(this._remote) : super(const CategoryInitial());

  Future<void> fetchCategory() async {
    emit(const CategoryLoading());

    final result = await _remote.fetchCategories();
    if (isClosed) return;

    result.fold(
      (error) => emit(CategoryError(error)),
      (categories) => emit(CategoryLoaded(categories)),
    );
  }
}