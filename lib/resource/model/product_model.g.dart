// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: (json['id'] as num).toInt(),
      categoryId: (json['category_id'] as num).toInt(),
      image: json['image'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      ratingsAvgRating: json['ratings_avg_rating'] == null
          ? 0
          : _toDouble(json['ratings_avg_rating']),
      ratingsCount: (json['ratings_count'] as num?)?.toInt() ?? 0,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      ratings:
          (json['ratings'] as List<dynamic>?)
              ?.map((e) => RatingModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <RatingModel>[],
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'image': instance.image,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'price': instance.price,
      'weight': instance.weight,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'ratings_avg_rating': instance.ratingsAvgRating,
      'ratings_count': instance.ratingsCount,
      'category': instance.category,
      'ratings': instance.ratings,
    };

_RatingModel _$RatingModelFromJson(Map<String, dynamic> json) => _RatingModel(
  id: (json['id'] as num).toInt(),
  transactionDetailId: (json['transaction_detail_id'] as num).toInt(),
  customerId: (json['customer_id'] as num).toInt(),
  productId: (json['product_id'] as num).toInt(),
  rating: (json['rating'] as num).toInt(),
  review: json['review'] as String,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  customer: json['customer'] == null
      ? null
      : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RatingModelToJson(_RatingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transaction_detail_id': instance.transactionDetailId,
      'customer_id': instance.customerId,
      'product_id': instance.productId,
      'rating': instance.rating,
      'review': instance.review,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'customer': instance.customer,
    };
