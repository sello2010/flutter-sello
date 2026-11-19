// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SliderModel _$SliderModelFromJson(Map<String, dynamic> json) => _SliderModel(
  id: (json['id'] as num).toInt(),
  image: json['image'] as String,
  link: json['link'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$SliderModelToJson(_SliderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'link': instance.link,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
