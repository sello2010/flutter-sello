// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderModel {

 int get id;@JsonKey(name: 'customer_id') int get customerId;@JsonKey(name: 'province_name') String get provinceName;@JsonKey(name: 'city_name') String get cityName;@JsonKey(name: 'district_name') String get districtName;@JsonKey(name: 'subdistrict_name') String get subdistrictName;@JsonKey(name: 'zip_code') int get zipCode;@JsonKey(name: 'full_address') String get fullAddress; String get invoice; int get weight; String get total; String get status;@JsonKey(name: 'snap_token') String? get snapToken;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt; CustomerModel get customer;
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderModelCopyWith<OrderModel> get copyWith => _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.customerId, _this.customerId) || other.customerId == _this.customerId)&&(identical(other.provinceName, _this.provinceName) || other.provinceName == _this.provinceName)&&(identical(other.cityName, _this.cityName) || other.cityName == _this.cityName)&&(identical(other.districtName, _this.districtName) || other.districtName == _this.districtName)&&(identical(other.subdistrictName, _this.subdistrictName) || other.subdistrictName == _this.subdistrictName)&&(identical(other.zipCode, _this.zipCode) || other.zipCode == _this.zipCode)&&(identical(other.fullAddress, _this.fullAddress) || other.fullAddress == _this.fullAddress)&&(identical(other.invoice, _this.invoice) || other.invoice == _this.invoice)&&(identical(other.weight, _this.weight) || other.weight == _this.weight)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.snapToken, _this.snapToken) || other.snapToken == _this.snapToken)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.customer, _this.customer) || other.customer == _this.customer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderModel;
  return Object.hash(runtimeType,_this.id,_this.customerId,_this.provinceName,_this.cityName,_this.districtName,_this.subdistrictName,_this.zipCode,_this.fullAddress,_this.invoice,_this.weight,_this.total,_this.status,_this.snapToken,_this.createdAt,_this.updatedAt,_this.customer);
}

@override
String toString() {
  final _this = this as OrderModel;
  return 'OrderModel(id: ${_this.id}, customerId: ${_this.customerId}, provinceName: ${_this.provinceName}, cityName: ${_this.cityName}, districtName: ${_this.districtName}, subdistrictName: ${_this.subdistrictName}, zipCode: ${_this.zipCode}, fullAddress: ${_this.fullAddress}, invoice: ${_this.invoice}, weight: ${_this.weight}, total: ${_this.total}, status: ${_this.status}, snapToken: ${_this.snapToken}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, customer: ${_this.customer})';
}


}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res>  {
  factory $OrderModelCopyWith(OrderModel value, $Res Function(OrderModel) _then) = _$OrderModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'province_name') String provinceName,@JsonKey(name: 'city_name') String cityName,@JsonKey(name: 'district_name') String districtName,@JsonKey(name: 'subdistrict_name') String subdistrictName,@JsonKey(name: 'zip_code') int zipCode,@JsonKey(name: 'full_address') String fullAddress, String invoice, int weight, String total, String status,@JsonKey(name: 'snap_token') String? snapToken,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt, CustomerModel customer
});


$CustomerModelCopyWith<$Res> get customer;

}
/// @nodoc
class _$OrderModelCopyWithImpl<$Res>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? provinceName = null,Object? cityName = null,Object? districtName = null,Object? subdistrictName = null,Object? zipCode = null,Object? fullAddress = null,Object? invoice = null,Object? weight = null,Object? total = null,Object? status = null,Object? snapToken = freezed,Object? createdAt = null,Object? updatedAt = null,Object? customer = null,}) {
  return _then(OrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,provinceName: null == provinceName ? _self.provinceName : provinceName // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,districtName: null == districtName ? _self.districtName : districtName // ignore: cast_nullable_to_non_nullable
as String,subdistrictName: null == subdistrictName ? _self.subdistrictName : subdistrictName // ignore: cast_nullable_to_non_nullable
as String,zipCode: null == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as int,fullAddress: null == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String,invoice: null == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,snapToken: freezed == snapToken ? _self.snapToken : snapToken // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerModel,
  ));
}
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerModelCopyWith<$Res> get customer {
  
  return $CustomerModelCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderModel].
extension OrderModelPatterns on OrderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'province_name')  String provinceName, @JsonKey(name: 'city_name')  String cityName, @JsonKey(name: 'district_name')  String districtName, @JsonKey(name: 'subdistrict_name')  String subdistrictName, @JsonKey(name: 'zip_code')  int zipCode, @JsonKey(name: 'full_address')  String fullAddress,  String invoice,  int weight,  String total,  String status, @JsonKey(name: 'snap_token')  String? snapToken, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt,  CustomerModel customer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.customerId,_that.provinceName,_that.cityName,_that.districtName,_that.subdistrictName,_that.zipCode,_that.fullAddress,_that.invoice,_that.weight,_that.total,_that.status,_that.snapToken,_that.createdAt,_that.updatedAt,_that.customer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'province_name')  String provinceName, @JsonKey(name: 'city_name')  String cityName, @JsonKey(name: 'district_name')  String districtName, @JsonKey(name: 'subdistrict_name')  String subdistrictName, @JsonKey(name: 'zip_code')  int zipCode, @JsonKey(name: 'full_address')  String fullAddress,  String invoice,  int weight,  String total,  String status, @JsonKey(name: 'snap_token')  String? snapToken, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt,  CustomerModel customer)  $default,) {final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that.id,_that.customerId,_that.provinceName,_that.cityName,_that.districtName,_that.subdistrictName,_that.zipCode,_that.fullAddress,_that.invoice,_that.weight,_that.total,_that.status,_that.snapToken,_that.createdAt,_that.updatedAt,_that.customer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'province_name')  String provinceName, @JsonKey(name: 'city_name')  String cityName, @JsonKey(name: 'district_name')  String districtName, @JsonKey(name: 'subdistrict_name')  String subdistrictName, @JsonKey(name: 'zip_code')  int zipCode, @JsonKey(name: 'full_address')  String fullAddress,  String invoice,  int weight,  String total,  String status, @JsonKey(name: 'snap_token')  String? snapToken, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt,  CustomerModel customer)?  $default,) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.customerId,_that.provinceName,_that.cityName,_that.districtName,_that.subdistrictName,_that.zipCode,_that.fullAddress,_that.invoice,_that.weight,_that.total,_that.status,_that.snapToken,_that.createdAt,_that.updatedAt,_that.customer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderModel implements OrderModel {
  const _OrderModel({required this.id, @JsonKey(name: 'customer_id') required this.customerId, @JsonKey(name: 'province_name') required this.provinceName, @JsonKey(name: 'city_name') required this.cityName, @JsonKey(name: 'district_name') required this.districtName, @JsonKey(name: 'subdistrict_name') required this.subdistrictName, @JsonKey(name: 'zip_code') required this.zipCode, @JsonKey(name: 'full_address') required this.fullAddress, required this.invoice, required this.weight, required this.total, required this.status, @JsonKey(name: 'snap_token') this.snapToken, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, required this.customer});
  factory _OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'customer_id') final  int customerId;
@override@JsonKey(name: 'province_name') final  String provinceName;
@override@JsonKey(name: 'city_name') final  String cityName;
@override@JsonKey(name: 'district_name') final  String districtName;
@override@JsonKey(name: 'subdistrict_name') final  String subdistrictName;
@override@JsonKey(name: 'zip_code') final  int zipCode;
@override@JsonKey(name: 'full_address') final  String fullAddress;
@override final  String invoice;
@override final  int weight;
@override final  String total;
@override final  String status;
@override@JsonKey(name: 'snap_token') final  String? snapToken;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override final  CustomerModel customer;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderModelCopyWith<_OrderModel> get copyWith => __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.provinceName, provinceName) || other.provinceName == provinceName)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.districtName, districtName) || other.districtName == districtName)&&(identical(other.subdistrictName, subdistrictName) || other.subdistrictName == subdistrictName)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.invoice, invoice) || other.invoice == invoice)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.total, total) || other.total == total)&&(identical(other.status, status) || other.status == status)&&(identical(other.snapToken, snapToken) || other.snapToken == snapToken)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.customer, customer) || other.customer == customer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,customerId,provinceName,cityName,districtName,subdistrictName,zipCode,fullAddress,invoice,weight,total,status,snapToken,createdAt,updatedAt,customer);
}

@override
String toString() {
    return 'OrderModel(id: $id, customerId: $customerId, provinceName: $provinceName, cityName: $cityName, districtName: $districtName, subdistrictName: $subdistrictName, zipCode: $zipCode, fullAddress: $fullAddress, invoice: $invoice, weight: $weight, total: $total, status: $status, snapToken: $snapToken, createdAt: $createdAt, updatedAt: $updatedAt, customer: $customer)';
}


}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(_OrderModel value, $Res Function(_OrderModel) _then) = __$OrderModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'province_name') String provinceName,@JsonKey(name: 'city_name') String cityName,@JsonKey(name: 'district_name') String districtName,@JsonKey(name: 'subdistrict_name') String subdistrictName,@JsonKey(name: 'zip_code') int zipCode,@JsonKey(name: 'full_address') String fullAddress, String invoice, int weight, String total, String status,@JsonKey(name: 'snap_token') String? snapToken,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt, CustomerModel customer
});


@override $CustomerModelCopyWith<$Res> get customer;

}
/// @nodoc
class __$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? provinceName = null,Object? cityName = null,Object? districtName = null,Object? subdistrictName = null,Object? zipCode = null,Object? fullAddress = null,Object? invoice = null,Object? weight = null,Object? total = null,Object? status = null,Object? snapToken = freezed,Object? createdAt = null,Object? updatedAt = null,Object? customer = null,}) {
  return _then(_OrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,provinceName: null == provinceName ? _self.provinceName : provinceName // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,districtName: null == districtName ? _self.districtName : districtName // ignore: cast_nullable_to_non_nullable
as String,subdistrictName: null == subdistrictName ? _self.subdistrictName : subdistrictName // ignore: cast_nullable_to_non_nullable
as String,zipCode: null == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as int,fullAddress: null == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String,invoice: null == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,snapToken: freezed == snapToken ? _self.snapToken : snapToken // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerModel,
  ));
}

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerModelCopyWith<$Res> get customer {
  
  return $CustomerModelCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}

// dart format on
