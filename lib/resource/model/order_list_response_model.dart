import 'package:freezed_annotation/freezed_annotation.dart';
import 'order_model.dart';

part 'order_list_response_model.freezed.dart';
part 'order_list_response_model.g.dart';

@freezed
abstract class OrderPaginationModel with _$OrderPaginationModel {
  const factory OrderPaginationModel({
    @JsonKey(name: 'current_page') required int currentPage,
    required List<OrderModel> data,
    @JsonKey(name: 'last_page') required int lastPage,
    required int total,
  }) = _OrderPaginationModel;

  factory OrderPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$OrderPaginationModelFromJson(json);
}

@freezed
abstract class OrderListResponseModel with _$OrderListResponseModel {
  const factory OrderListResponseModel({
    required bool success,
    required String message,
    required OrderPaginationModel data,
  }) = _OrderListResponseModel;

  factory OrderListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrderListResponseModelFromJson(json);
}