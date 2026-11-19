import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resource/model/order_detail_model.dart';
import '../../resource/remote/order_remote_resource.dart';

sealed class OrderDetailState {
  const OrderDetailState();
}

class OrderDetailInitial extends OrderDetailState {
  const OrderDetailInitial();
}

class OrderDetailLoading extends OrderDetailState {
  const OrderDetailLoading();
}

class OrderDetailLoaded extends OrderDetailState {
  final OrderDetailModel detail;
  const OrderDetailLoaded(this.detail);
}

/// Order tanpa snap_token tidak bisa diambil detailnya.
class OrderDetailUnavailable extends OrderDetailState {
  const OrderDetailUnavailable();
}

class OrderDetailError extends OrderDetailState {
  final String message;
  const OrderDetailError(this.message);
}

class OrderDetailCubit extends Cubit<OrderDetailState> {
  final OrderRemoteResource _remote;

  OrderDetailCubit(this._remote) : super(const OrderDetailInitial());

  Future<void> fetch(String? snapToken) async {
    if (snapToken == null || snapToken.isEmpty) {
      emit(const OrderDetailUnavailable());
      return;
    }

    emit(const OrderDetailLoading());
    final result = await _remote.fetchOrderDetail(snapToken);
    if (isClosed) return;

    result.fold(
      (error) => emit(OrderDetailError(error)),
      (detail) => emit(OrderDetailLoaded(detail)),
    );
  }
}