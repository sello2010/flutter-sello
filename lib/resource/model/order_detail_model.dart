import 'package:freezed_annotation/freezed_annotation.dart';
import 'customer_model.dart';

part 'order_detail_model.freezed.dart';
part 'order_detail_model.g.dart';

/// Response dari GET /api/customer/my-orders/{snap_token}
/// (bagian "data").
@freezed
abstract class OrderDetailModel with _$OrderDetailModel {
  const factory OrderDetailModel({
    required int id,
    @JsonKey(name: 'customer_id') required int customerId,
    @JsonKey(name: 'province_name') required String provinceName,
    @JsonKey(name: 'city_name') required String cityName,
    @JsonKey(name: 'district_name') required String districtName,
    @JsonKey(name: 'subdistrict_name') required String subdistrictName,
    @JsonKey(name: 'zip_code') required int zipCode,
    @JsonKey(name: 'full_address') required String fullAddress,
    required String invoice,
    required int weight,
    required String total,
    required String status,
    @JsonKey(name: 'snap_token') String? snapToken,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    required CustomerModel customer,
    OrderShippingModel? shipping,
    @JsonKey(name: 'transaction_details')
    @Default(<OrderItemModel>[])
    List<OrderItemModel> transactionDetails,
  }) = _OrderDetailModel;

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailModelFromJson(json);
}

@freezed
abstract class OrderShippingModel with _$OrderShippingModel {
  const factory OrderShippingModel({
    required int id,
    @JsonKey(name: 'transaction_id') required int transactionId,
    @JsonKey(name: 'shipping_courier') required String shippingCourier,
    @JsonKey(name: 'shipping_service') required String shippingService,
    // Server mengirim string, mis. "7500.00"
    @JsonKey(name: 'shipping_cost') required String shippingCost,
  }) = _OrderShippingModel;

  factory OrderShippingModel.fromJson(Map<String, dynamic> json) =>
      _$OrderShippingModelFromJson(json);
}

/// Satu baris item pesanan (transaction_details).
@freezed
abstract class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    required int id,
    @JsonKey(name: 'transaction_id') required int transactionId,
    @JsonKey(name: 'product_id') required int productId,
    required int qty,
    required int price,
    OrderProductModel? product,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);
}

@freezed
abstract class OrderProductModel with _$OrderProductModel {
  const factory OrderProductModel({
    required int id,
    required String image,
    required String title,
    required String slug,
    required int price,
  }) = _OrderProductModel;

  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      _$OrderProductModelFromJson(json);
}