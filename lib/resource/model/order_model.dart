import 'package:freezed_annotation/freezed_annotation.dart';
import 'customer_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderModel with _$OrderModel {
  const factory OrderModel({
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
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}