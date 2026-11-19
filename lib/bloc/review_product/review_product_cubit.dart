import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resource/remote/order_remote_resource.dart';

sealed class ReviewProductState {
  const ReviewProductState();
}

class ReviewProductInitial extends ReviewProductState {
  const ReviewProductInitial();
}

class ReviewProductLoading extends ReviewProductState {
  const ReviewProductLoading();
}

class ReviewProductSuccess extends ReviewProductState {
  final int productId;
  const ReviewProductSuccess(this.productId);
}

class ReviewProductError extends ReviewProductState {
  final String message;
  const ReviewProductError(this.message);
}

class ReviewProductCubit extends Cubit<ReviewProductState> {
  final OrderRemoteResource _remote;

  ReviewProductCubit(this._remote) : super(const ReviewProductInitial());

  Future<void> reviewProduct({
    required int transactionDetailId,
    required int productId,
    required int rating,
    required String review,
  }) async {
    emit(const ReviewProductLoading());

    final result = await _remote.reviewProduct(
      transactionDetailId: transactionDetailId,
      productId: productId,
      rating: rating,
      review: review,
    );
    if (isClosed) return;

    result.fold(
      (error) => emit(ReviewProductError(error)),
      (_) => emit(ReviewProductSuccess(productId)),
    );
  }
}