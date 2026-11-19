// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderPaginationModel _$OrderPaginationModelFromJson(
  Map<String, dynamic> json,
) => _OrderPaginationModel(
  currentPage: (json['current_page'] as num).toInt(),
  data: (json['data'] as List<dynamic>)
      .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastPage: (json['last_page'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$OrderPaginationModelToJson(
  _OrderPaginationModel instance,
) => <String, dynamic>{
  'current_page': instance.currentPage,
  'data': instance.data,
  'last_page': instance.lastPage,
  'total': instance.total,
};

_OrderListResponseModel _$OrderListResponseModelFromJson(
  Map<String, dynamic> json,
) => _OrderListResponseModel(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: OrderPaginationModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderListResponseModelToJson(
  _OrderListResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
