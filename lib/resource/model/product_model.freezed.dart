// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductModel {

 int get id;@JsonKey(name: 'category_id') int get categoryId; String get image; String get title; String get slug; String get description; int get price; int get weight;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(name: 'ratings_avg_rating', fromJson: _toDouble) double get ratingsAvgRating;@JsonKey(name: 'ratings_count') int get ratingsCount; CategoryModel? get category; List<RatingModel> get ratings;
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductModelCopyWith<ProductModel> get copyWith => _$ProductModelCopyWithImpl<ProductModel>(this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProductModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.weight, _this.weight) || other.weight == _this.weight)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.ratingsAvgRating, _this.ratingsAvgRating) || other.ratingsAvgRating == _this.ratingsAvgRating)&&(identical(other.ratingsCount, _this.ratingsCount) || other.ratingsCount == _this.ratingsCount)&&(identical(other.category, _this.category) || other.category == _this.category)&&const DeepCollectionEquality().equals(other.ratings, _this.ratings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProductModel;
  return Object.hash(runtimeType,_this.id,_this.categoryId,_this.image,_this.title,_this.slug,_this.description,_this.price,_this.weight,_this.createdAt,_this.updatedAt,_this.ratingsAvgRating,_this.ratingsCount,_this.category,const DeepCollectionEquality().hash(_this.ratings));
}

@override
String toString() {
  final _this = this as ProductModel;
  return 'ProductModel(id: ${_this.id}, categoryId: ${_this.categoryId}, image: ${_this.image}, title: ${_this.title}, slug: ${_this.slug}, description: ${_this.description}, price: ${_this.price}, weight: ${_this.weight}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, ratingsAvgRating: ${_this.ratingsAvgRating}, ratingsCount: ${_this.ratingsCount}, category: ${_this.category}, ratings: ${_this.ratings})';
}


}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res>  {
  factory $ProductModelCopyWith(ProductModel value, $Res Function(ProductModel) _then) = _$ProductModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'category_id') int categoryId, String image, String title, String slug, String description, int price, int weight,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'ratings_avg_rating', fromJson: _toDouble) double ratingsAvgRating,@JsonKey(name: 'ratings_count') int ratingsCount, CategoryModel? category, List<RatingModel> ratings
});


$CategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class _$ProductModelCopyWithImpl<$Res>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = null,Object? image = null,Object? title = null,Object? slug = null,Object? description = null,Object? price = null,Object? weight = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? ratingsAvgRating = null,Object? ratingsCount = null,Object? category = freezed,Object? ratings = null,}) {
  return _then(ProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,ratingsAvgRating: null == ratingsAvgRating ? _self.ratingsAvgRating : ratingsAvgRating // ignore: cast_nullable_to_non_nullable
as double,ratingsCount: null == ratingsCount ? _self.ratingsCount : ratingsCount // ignore: cast_nullable_to_non_nullable
as int,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,ratings: null == ratings ? _self.ratings : ratings // ignore: cast_nullable_to_non_nullable
as List<RatingModel>,
  ));
}
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'category_id')  int categoryId,  String image,  String title,  String slug,  String description,  int price,  int weight, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'ratings_avg_rating', fromJson: _toDouble)  double ratingsAvgRating, @JsonKey(name: 'ratings_count')  int ratingsCount,  CategoryModel? category,  List<RatingModel> ratings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.categoryId,_that.image,_that.title,_that.slug,_that.description,_that.price,_that.weight,_that.createdAt,_that.updatedAt,_that.ratingsAvgRating,_that.ratingsCount,_that.category,_that.ratings);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'category_id')  int categoryId,  String image,  String title,  String slug,  String description,  int price,  int weight, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'ratings_avg_rating', fromJson: _toDouble)  double ratingsAvgRating, @JsonKey(name: 'ratings_count')  int ratingsCount,  CategoryModel? category,  List<RatingModel> ratings)  $default,) {final _that = this;
switch (_that) {
case _ProductModel():
return $default(_that.id,_that.categoryId,_that.image,_that.title,_that.slug,_that.description,_that.price,_that.weight,_that.createdAt,_that.updatedAt,_that.ratingsAvgRating,_that.ratingsCount,_that.category,_that.ratings);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'category_id')  int categoryId,  String image,  String title,  String slug,  String description,  int price,  int weight, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'ratings_avg_rating', fromJson: _toDouble)  double ratingsAvgRating, @JsonKey(name: 'ratings_count')  int ratingsCount,  CategoryModel? category,  List<RatingModel> ratings)?  $default,) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.categoryId,_that.image,_that.title,_that.slug,_that.description,_that.price,_that.weight,_that.createdAt,_that.updatedAt,_that.ratingsAvgRating,_that.ratingsCount,_that.category,_that.ratings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductModel implements ProductModel {
  const _ProductModel({required this.id, @JsonKey(name: 'category_id') required this.categoryId, required this.image, required this.title, required this.slug, required this.description, required this.price, required this.weight, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'ratings_avg_rating', fromJson: _toDouble) this.ratingsAvgRating = 0, @JsonKey(name: 'ratings_count') this.ratingsCount = 0, this.category,  List<RatingModel> ratings = const <RatingModel>[]}): _ratings = ratings;
  factory _ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'category_id') final  int categoryId;
@override final  String image;
@override final  String title;
@override final  String slug;
@override final  String description;
@override final  int price;
@override final  int weight;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(name: 'ratings_avg_rating', fromJson: _toDouble) final  double ratingsAvgRating;
@override@JsonKey(name: 'ratings_count') final  int ratingsCount;
@override final  CategoryModel? category;
 final  List<RatingModel> _ratings;
@override@JsonKey() List<RatingModel> get ratings {
  if (_ratings is EqualUnmodifiableListView) return _ratings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ratings);
}


/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductModelCopyWith<_ProductModel> get copyWith => __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.image, image) || other.image == image)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.ratingsAvgRating, ratingsAvgRating) || other.ratingsAvgRating == ratingsAvgRating)&&(identical(other.ratingsCount, ratingsCount) || other.ratingsCount == ratingsCount)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.ratings, _ratings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,categoryId,image,title,slug,description,price,weight,createdAt,updatedAt,ratingsAvgRating,ratingsCount,category,const DeepCollectionEquality().hash(_ratings));
}

@override
String toString() {
    return 'ProductModel(id: $id, categoryId: $categoryId, image: $image, title: $title, slug: $slug, description: $description, price: $price, weight: $weight, createdAt: $createdAt, updatedAt: $updatedAt, ratingsAvgRating: $ratingsAvgRating, ratingsCount: $ratingsCount, category: $category, ratings: $ratings)';
}


}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res> implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(_ProductModel value, $Res Function(_ProductModel) _then) = __$ProductModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'category_id') int categoryId, String image, String title, String slug, String description, int price, int weight,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'ratings_avg_rating', fromJson: _toDouble) double ratingsAvgRating,@JsonKey(name: 'ratings_count') int ratingsCount, CategoryModel? category, List<RatingModel> ratings
});


@override $CategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? image = null,Object? title = null,Object? slug = null,Object? description = null,Object? price = null,Object? weight = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? ratingsAvgRating = null,Object? ratingsCount = null,Object? category = freezed,Object? ratings = null,}) {
  return _then(_ProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,ratingsAvgRating: null == ratingsAvgRating ? _self.ratingsAvgRating : ratingsAvgRating // ignore: cast_nullable_to_non_nullable
as double,ratingsCount: null == ratingsCount ? _self.ratingsCount : ratingsCount // ignore: cast_nullable_to_non_nullable
as int,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,ratings: null == ratings ? _self._ratings : ratings // ignore: cast_nullable_to_non_nullable
as List<RatingModel>,
  ));
}

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
mixin _$RatingModel {

 int get id;@JsonKey(name: 'transaction_detail_id') int get transactionDetailId;@JsonKey(name: 'customer_id') int get customerId;@JsonKey(name: 'product_id') int get productId; int get rating; String get review;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt; CustomerModel? get customer;
/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingModelCopyWith<RatingModel> get copyWith => _$RatingModelCopyWithImpl<RatingModel>(this as RatingModel, _$identity);

  /// Serializes this RatingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RatingModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatingModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.transactionDetailId, _this.transactionDetailId) || other.transactionDetailId == _this.transactionDetailId)&&(identical(other.customerId, _this.customerId) || other.customerId == _this.customerId)&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&(identical(other.review, _this.review) || other.review == _this.review)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.customer, _this.customer) || other.customer == _this.customer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RatingModel;
  return Object.hash(runtimeType,_this.id,_this.transactionDetailId,_this.customerId,_this.productId,_this.rating,_this.review,_this.createdAt,_this.updatedAt,_this.customer);
}

@override
String toString() {
  final _this = this as RatingModel;
  return 'RatingModel(id: ${_this.id}, transactionDetailId: ${_this.transactionDetailId}, customerId: ${_this.customerId}, productId: ${_this.productId}, rating: ${_this.rating}, review: ${_this.review}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, customer: ${_this.customer})';
}


}

/// @nodoc
abstract mixin class $RatingModelCopyWith<$Res>  {
  factory $RatingModelCopyWith(RatingModel value, $Res Function(RatingModel) _then) = _$RatingModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'transaction_detail_id') int transactionDetailId,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'product_id') int productId, int rating, String review,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt, CustomerModel? customer
});


$CustomerModelCopyWith<$Res>? get customer;

}
/// @nodoc
class _$RatingModelCopyWithImpl<$Res>
    implements $RatingModelCopyWith<$Res> {
  _$RatingModelCopyWithImpl(this._self, this._then);

  final RatingModel _self;
  final $Res Function(RatingModel) _then;

/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? transactionDetailId = null,Object? customerId = null,Object? productId = null,Object? rating = null,Object? review = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? customer = freezed,}) {
  return _then(RatingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transactionDetailId: null == transactionDetailId ? _self.transactionDetailId : transactionDetailId // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,review: null == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,
  ));
}
/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerModelCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $CustomerModelCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}


/// Adds pattern-matching-related methods to [RatingModel].
extension RatingModelPatterns on RatingModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RatingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RatingModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RatingModel value)  $default,){
final _that = this;
switch (_that) {
case _RatingModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RatingModel value)?  $default,){
final _that = this;
switch (_that) {
case _RatingModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'transaction_detail_id')  int transactionDetailId, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'product_id')  int productId,  int rating,  String review, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  CustomerModel? customer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatingModel() when $default != null:
return $default(_that.id,_that.transactionDetailId,_that.customerId,_that.productId,_that.rating,_that.review,_that.createdAt,_that.updatedAt,_that.customer);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'transaction_detail_id')  int transactionDetailId, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'product_id')  int productId,  int rating,  String review, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  CustomerModel? customer)  $default,) {final _that = this;
switch (_that) {
case _RatingModel():
return $default(_that.id,_that.transactionDetailId,_that.customerId,_that.productId,_that.rating,_that.review,_that.createdAt,_that.updatedAt,_that.customer);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'transaction_detail_id')  int transactionDetailId, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'product_id')  int productId,  int rating,  String review, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  CustomerModel? customer)?  $default,) {final _that = this;
switch (_that) {
case _RatingModel() when $default != null:
return $default(_that.id,_that.transactionDetailId,_that.customerId,_that.productId,_that.rating,_that.review,_that.createdAt,_that.updatedAt,_that.customer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RatingModel implements RatingModel {
  const _RatingModel({required this.id, @JsonKey(name: 'transaction_detail_id') required this.transactionDetailId, @JsonKey(name: 'customer_id') required this.customerId, @JsonKey(name: 'product_id') required this.productId, required this.rating, required this.review, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, this.customer});
  factory _RatingModel.fromJson(Map<String, dynamic> json) => _$RatingModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'transaction_detail_id') final  int transactionDetailId;
@override@JsonKey(name: 'customer_id') final  int customerId;
@override@JsonKey(name: 'product_id') final  int productId;
@override final  int rating;
@override final  String review;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override final  CustomerModel? customer;

/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatingModelCopyWith<_RatingModel> get copyWith => __$RatingModelCopyWithImpl<_RatingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RatingModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionDetailId, transactionDetailId) || other.transactionDetailId == transactionDetailId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.review, review) || other.review == review)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.customer, customer) || other.customer == customer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,transactionDetailId,customerId,productId,rating,review,createdAt,updatedAt,customer);
}

@override
String toString() {
    return 'RatingModel(id: $id, transactionDetailId: $transactionDetailId, customerId: $customerId, productId: $productId, rating: $rating, review: $review, createdAt: $createdAt, updatedAt: $updatedAt, customer: $customer)';
}


}

/// @nodoc
abstract mixin class _$RatingModelCopyWith<$Res> implements $RatingModelCopyWith<$Res> {
  factory _$RatingModelCopyWith(_RatingModel value, $Res Function(_RatingModel) _then) = __$RatingModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'transaction_detail_id') int transactionDetailId,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'product_id') int productId, int rating, String review,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt, CustomerModel? customer
});


@override $CustomerModelCopyWith<$Res>? get customer;

}
/// @nodoc
class __$RatingModelCopyWithImpl<$Res>
    implements _$RatingModelCopyWith<$Res> {
  __$RatingModelCopyWithImpl(this._self, this._then);

  final _RatingModel _self;
  final $Res Function(_RatingModel) _then;

/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? transactionDetailId = null,Object? customerId = null,Object? productId = null,Object? rating = null,Object? review = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? customer = freezed,}) {
  return _then(_RatingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transactionDetailId: null == transactionDetailId ? _self.transactionDetailId : transactionDetailId // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,review: null == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,
  ));
}

/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerModelCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $CustomerModelCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}

// dart format on
