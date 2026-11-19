// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderDetailModel _$OrderDetailModelFromJson(
  Map<String, dynamic> json,
) => _OrderDetailModel(
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
  shipping: json['shipping'] == null
      ? null
      : OrderShippingModel.fromJson(json['shipping'] as Map<String, dynamic>),
  transactionDetails:
      (json['transaction_details'] as List<dynamic>?)
          ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <OrderItemModel>[],
);

Map<String, dynamic> _$OrderDetailModelToJson(_OrderDetailModel instance) =>
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
      'shipping': instance.shipping,
      'transaction_details': instance.transactionDetails,
    };

_OrderShippingModel _$OrderShippingModelFromJson(Map<String, dynamic> json) =>
    _OrderShippingModel(
      id: (json['id'] as num).toInt(),
      transactionId: (json['transaction_id'] as num).toInt(),
      shippingCourier: json['shipping_courier'] as String,
      shippingService: json['shipping_service'] as String,
      shippingCost: json['shipping_cost'] as String,
    );

Map<String, dynamic> _$OrderShippingModelToJson(_OrderShippingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transaction_id': instance.transactionId,
      'shipping_courier': instance.shippingCourier,
      'shipping_service': instance.shippingService,
      'shipping_cost': instance.shippingCost,
    };

_OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    _OrderItemModel(
      id: (json['id'] as num).toInt(),
      transactionId: (json['transaction_id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      qty: (json['qty'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      product: json['product'] == null
          ? null
          : OrderProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderItemModelToJson(_OrderItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transaction_id': instance.transactionId,
      'product_id': instance.productId,
      'qty': instance.qty,
      'price': instance.price,
      'product': instance.product,
    };

_OrderProductModel _$OrderProductModelFromJson(Map<String, dynamic> json) =>
    _OrderProductModel(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$OrderProductModelToJson(_OrderProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'slug': instance.slug,
      'price': instance.price,
    };
