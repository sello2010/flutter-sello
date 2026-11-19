// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  id: (json['id'] as num).toInt(),
  customerId: (json['customer_id'] as num).toInt(),
  provinceName: json['province_name'] as String,
  cityName: json['city_name'] as String,
  districtName: json['district_name'] as String,
  subdistrictName: json['subdistrict_name'] as String,
  zipCode: (json['zip_code'] as num).toInt(),
  fullAddress: json['full_address'] as String,
  invoice: json['invoice'] as String,
  weight: (json['weight'] as num).toInt(),
  total: json['total'] as String,
  status: json['status'] as String,
  snapToken: json['snap_token'] as String?,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
  customer: CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'province_name': instance.provinceName,
      'city_name': instance.cityName,
      'district_name': instance.districtName,
      'subdistrict_name': instance.subdistrictName,
      'zip_code': instance.zipCode,
      'full_address': instance.fullAddress,
      'invoice': instance.invoice,
      'weight': instance.weight,
      'total': instance.total,
      'status': instance.status,
      'snap_token': instance.snapToken,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'customer': instance.customer,
    };
