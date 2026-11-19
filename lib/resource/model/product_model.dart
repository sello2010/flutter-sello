import 'package:freezed_annotation/freezed_annotation.dart';
import 'category_model.dart';
import 'customer_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

/// Server mengirim rata-rata rating sebagai teks ("5.0"), bukan angka.
double _toDouble(dynamic value) =>
    double.tryParse(value?.toString() ?? '') ?? 0;

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,
    @JsonKey(name: 'category_id') required int categoryId,
    required String image,
    required String title,
    required String slug,
    required String description,
    required int price,
    required int weight,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'ratings_avg_rating', fromJson: _toDouble)
    @Default(0)
    double ratingsAvgRating,
    // Hanya ada di endpoint products-popular
    @JsonKey(name: 'ratings_count') @Default(0) int ratingsCount,
    CategoryModel? category,
    @Default(<RatingModel>[]) List<RatingModel> ratings,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
abstract class RatingModel with _$RatingModel {
  const factory RatingModel({
    required int id,
    @JsonKey(name: 'transaction_detail_id') required int transactionDetailId,
    @JsonKey(name: 'customer_id') required int customerId,
    @JsonKey(name: 'product_id') required int productId,
    required int rating,
    required String review,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    CustomerModel? customer,
  }) = _RatingModel;

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);
}