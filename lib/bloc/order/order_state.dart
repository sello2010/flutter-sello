import 'package:freezed_annotation/freezed_annotation.dart';
import '../../resource/model/order_list_response_model.dart';

part 'order_state.freezed.dart';

@freezed
abstract class OrderState with _$OrderState {
  const factory OrderState.initial() = OrderInitial;
  const factory OrderState.loading() = OrderLoading;
  const factory OrderState.loaded(OrderListResponseModel data) = OrderLoaded;
  const factory OrderState.error(String message) = OrderError;
}