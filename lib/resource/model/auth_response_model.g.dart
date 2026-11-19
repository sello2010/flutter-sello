// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    _AuthResponseModel(
      success: json['success'] as bool,
      customer: CustomerModel.fromJson(
        json['customer'] as Map<String, dynamic>,
      ),
      token: json['token'] as String,
    );

Map<String, dynamic> _$AuthResponseModelToJson(_AuthResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'customer': instance.customer,
      'token': instance.token,
    };
