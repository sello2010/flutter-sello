import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resource/remote/order_remote_resource.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRemoteResource orderRemoteResource;

  OrderBloc(this.orderRemoteResource) : super(const OrderState.initial()) {
    on<FetchMyOrders>(_onFetchMyOrders);
  }

  Future<void> _onFetchMyOrders(
    FetchMyOrders event,
    Emitter<OrderState> emit,
  ) async {
    emit(const OrderState.loading());

    final result = await orderRemoteResource.fetchMyOrders();

    result.fold(
      (error) => emit(OrderState.error(error)),
      (data) => emit(OrderState.loaded(data)),
    );
  }
}