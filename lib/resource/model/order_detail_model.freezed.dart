// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderDetailModel {

 int get id;@JsonKey(name: 'customer_id') int get customerId;@JsonKey(name: 'province_name') String get provinceName;@JsonKey(name: 'city_name') String get cityName;@JsonKey(name: 'district_name') String get districtName;@JsonKey(name: 'subdistrict_name') String get subdistrictName;@JsonKey(name: 'zip_code') int get zipCode;@JsonKey(name: 'full_address') String get fullAddress; String get invoice; int get weight; String get total; String get status;@JsonKey(name: 'snap_token') String? get snapToken;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt; CustomerModel get customer; OrderShippingModel? get shipping;@JsonKey(name: 'transaction_details') List<OrderItemModel> get transactionDetails;
/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailModelCopyWith<OrderDetailModel> get copyWith => _$OrderDetailModelCopyWithImpl<OrderDetailModel>(this as OrderDetailModel, _$identity);

  /// Serializes this OrderDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderDetailModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.customerId, _this.customerId) || other.customerId == _this.customerId)&&(identical(other.provinceName, _this.provinceName) || other.provinceName == _this.provinceName)&&(identical(other.cityName, _this.cityName) || other.cityName == _this.cityName)&&(identical(other.districtName, _this.districtName) || other.districtName == _this.districtName)&&(identical(other.subdistrictName, _this.subdistrictName) || other.subdistrictName == _this.subdistrictName)&&(identical(other.zipCode, _this.zipCode) || other.zipCode == _this.zipCode)&&(identical(other.fullAddress, _this.fullAddress) || other.fullAddress == _this.fullAddress)&&(identical(other.invoice, _this.invoice) || other.invoice == _this.invoice)&&(identical(other.weight, _this.weight) || other.weight == _this.weight)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.snapToken, _this.snapToken) || other.snapToken == _this.snapToken)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.customer, _this.customer) || other.customer == _this.customer)&&(identical(other.shipping, _this.shipping) || other.shipping == _this.shipping)&&const DeepCollectionEquality().equals(other.transactionDetails, _this.transactionDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderDetailModel;
  return Object.hash(runtimeType,_this.id,_this.customerId,_this.provinceName,_this.cityName,_this.districtName,_this.subdistrictName,_this.zipCode,_this.fullAddress,_this.invoice,_this.weight,_this.total,_this.status,_this.snapToken,_this.createdAt,_this.updatedAt,_this.customer,_this.shipping,const DeepCollectionEquality().hash(_this.transactionDetails));
}

@override
String toString() {
  final _this = this as OrderDetailModel;
  return 'OrderDetailModel(id: ${_this.id}, customerId: ${_this.customerId}, provinceName: ${_this.provinceName}, cityName: ${_this.cityName}, districtName: ${_this.districtName}, subdistrictName: ${_this.subdistrictName}, zipCode: ${_this.zipCode}, fullAddress: ${_this.fullAddress}, invoice: ${_this.invoice}, weight: ${_this.weight}, total: ${_this.total}, status: ${_this.status}, snapToken: ${_this.snapToken}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, customer: ${_this.customer}, shipping: ${_this.shipping}, transactionDetails: ${_this.transactionDetails})';
}


}

/// @nodoc
abstract mixin class $OrderDetailModelCopyWith<$Res>  {
  factory $OrderDetailModelCopyWith(OrderDetailModel value, $Res Function(OrderDetailModel) _then) = _$OrderDetailModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'province_name') String provinceName,@JsonKey(name: 'city_name') String cityName,@JsonKey(name: 'district_name') String districtName,@JsonKey(name: 'subdistrict_name') String subdistrictName,@JsonKey(name: 'zip_code') int zipCode,@JsonKey(name: 'full_address') String fullAddress, String invoice, int weight, String total, String status,@JsonKey(name: 'snap_token') String? snapToken,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt, CustomerModel customer, OrderShippingModel? shipping,@JsonKey(name: 'transaction_details') List<OrderItemModel> transactionDetails
});


$CustomerModelCopyWith<$Res> get customer;$OrderShippingModelCopyWith<$Res>? get shipping;

}
/// @nodoc
class _$OrderDetailModelCopyWithImpl<$Res>
    implements $OrderDetailModelCopyWith<$Res> {
  _$OrderDetailModelCopyWithImpl(this._self, this._then);

  final OrderDetailModel _self;
  final $Res Function(OrderDetailModel) _then;

/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? provinceName = null,Object? cityName = null,Object? districtName = null,Object? subdistrictName = null,Object? zipCode = null,Object? fullAddress = null,Object? invoice = null,Object? weight = null,Object? total = null,Object? status = null,Object? snapToken = freezed,Object? createdAt = null,Object? updatedAt = null,Object? customer = null,Object? shipping = freezed,Object? transactionDetails = null,}) {
  return _then(OrderDetailModel(
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
as CustomerModel,shipping: freezed == shipping ? _self.shipping : shipping // ignore: cast_nullable_to_non_nullable
as OrderShippingModel?,transactionDetails: null == transactionDetails ? _self.transactionDetails : transactionDetails // ignore: cast_nullable_to_non_nullable
as List<OrderItemModel>,
  ));
}
/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerModelCopyWith<$Res> get customer {
  
  return $CustomerModelCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderShippingModelCopyWith<$Res>? get shipping {
    if (_self.shipping == null) {
    return null;
  }

  return $OrderShippingModelCopyWith<$Res>(_self.shipping!, (value) {
    return _then(_self.copyWith(shipping: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderDetailModel].
extension OrderDetailModelPatterns on OrderDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'province_name')  String provinceName, @JsonKey(name: 'city_name')  String cityName, @JsonKey(name: 'district_name')  String districtName, @JsonKey(name: 'subdistrict_name')  String subdistrictName, @JsonKey(name: 'zip_code')  int zipCode, @JsonKey(name: 'full_address')  String fullAddress,  String invoice,  int weight,  String total,  String status, @JsonKey(name: 'snap_token')  String? snapToken, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt,  CustomerModel customer,  OrderShippingModel? shipping, @JsonKey(name: 'transaction_details')  List<OrderItemModel> transactionDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDetailModel() when $default != null:
return $default(_that.id,_that.customerId,_that.provinceName,_that.cityName,_that.districtName,_that.subdistrictName,_that.zipCode,_that.fullAddress,_that.invoice,_that.weight,_that.total,_that.status,_that.snapToken,_that.createdAt,_that.updatedAt,_that.customer,_that.shipping,_that.transactionDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'province_name')  String provinceName, @JsonKey(name: 'city_name')  String cityName, @JsonKey(name: 'district_name')  String districtName, @JsonKey(name: 'subdistrict_name')  String subdistrictName, @JsonKey(name: 'zip_code')  int zipCode, @JsonKey(name: 'full_address')  String fullAddress,  String invoice,  int weight,  String total,  String status, @JsonKey(name: 'snap_token')  String? snapToken, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt,  CustomerModel customer,  OrderShippingModel? shipping, @JsonKey(name: 'transaction_details')  List<OrderItemModel> transactionDetails)  $default,) {final _that = this;
switch (_that) {
case _OrderDetailModel():
return $default(_that.id,_that.customerId,_that.provinceName,_that.cityName,_that.districtName,_that.subdistrictName,_that.zipCode,_that.fullAddress,_that.invoice,_that.weight,_that.total,_that.status,_that.snapToken,_that.createdAt,_that.updatedAt,_that.customer,_that.shipping,_that.transactionDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'province_name')  String provinceName, @JsonKey(name: 'city_name')  String cityName, @JsonKey(name: 'district_name')  String districtName, @JsonKey(name: 'subdistrict_name')  String subdistrictName, @JsonKey(name: 'zip_code')  int zipCode, @JsonKey(name: 'full_address')  String fullAddress,  String invoice,  int weight,  String total,  String status, @JsonKey(name: 'snap_token')  String? snapToken, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt,  CustomerModel customer,  OrderShippingModel? shipping, @JsonKey(name: 'transaction_details')  List<OrderItemModel> transactionDetails)?  $default,) {final _that = this;
switch (_that) {
case _OrderDetailModel() when $default != null:
return $default(_that.id,_that.customerId,_that.provinceName,_that.cityName,_that.districtName,_that.subdistrictName,_that.zipCode,_that.fullAddress,_that.invoice,_that.weight,_that.total,_that.status,_that.snapToken,_that.createdAt,_that.updatedAt,_that.customer,_that.shipping,_that.transactionDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDetailModel implements OrderDetailModel {
  const _OrderDetailModel({required this.id, @JsonKey(name: 'customer_id') required this.customerId, @JsonKey(name: 'province_name') required this.provinceName, @JsonKey(name: 'city_name') required this.cityName, @JsonKey(name: 'district_name') required this.districtName, @JsonKey(name: 'subdistrict_name') required this.subdistrictName, @JsonKey(name: 'zip_code') required this.zipCode, @JsonKey(name: 'full_address') required this.fullAddress, required this.invoice, required this.weight, required this.total, required this.status, @JsonKey(name: 'snap_token') this.snapToken, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, required this.customer, this.shipping, @JsonKey(name: 'transaction_details')  List<OrderItemModel> transactionDetails = const <OrderItemModel>[]}): _transactionDetails = transactionDetails;
  factory _OrderDetailModel.fromJson(Map<String, dynamic> json) => _$OrderDetailModelFromJson(json);

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
@override final  OrderShippingModel? shipping;
 final  List<OrderItemModel> _transactionDetails;
@override@JsonKey(name: 'transaction_details') List<OrderItemModel> get transactionDetails {
  if (_transactionDetails is EqualUnmodifiableListView) return _transactionDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactionDetails);
}


/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDetailModelCopyWith<_OrderDetailModel> get copyWith => __$OrderDetailModelCopyWithImpl<_OrderDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.provinceName, provinceName) || other.provinceName == provinceName)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.districtName, districtName) || other.districtName == districtName)&&(identical(other.subdistrictName, subdistrictName) || other.subdistrictName == subdistrictName)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.invoice, invoice) || other.invoice == invoice)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.total, total) || other.total == total)&&(identical(other.status, status) || other.status == status)&&(identical(other.snapToken, snapToken) || other.snapToken == snapToken)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.shipping, shipping) || other.shipping == shipping)&&const DeepCollectionEquality().equals(other.transactionDetails, _transactionDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,customerId,provinceName,cityName,districtName,subdistrictName,zipCode,fullAddress,invoice,weight,total,status,snapToken,createdAt,updatedAt,customer,shipping,const DeepCollectionEquality().hash(_transactionDetails));
}

@override
String toString() {
    return 'OrderDetailModel(id: $id, customerId: $customerId, provinceName: $provinceName, cityName: $cityName, districtName: $districtName, subdistrictName: $subdistrictName, zipCode: $zipCode, fullAddress: $fullAddress, invoice: $invoice, weight: $weight, total: $total, status: $status, snapToken: $snapToken, createdAt: $createdAt, updatedAt: $updatedAt, customer: $customer, shipping: $shipping, transactionDetails: $transactionDetails)';
}


}

/// @nodoc
abstract mixin class _$OrderDetailModelCopyWith<$Res> implements $OrderDetailModelCopyWith<$Res> {
  factory _$OrderDetailModelCopyWith(_OrderDetailModel value, $Res Function(_OrderDetailModel) _then) = __$OrderDetailModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'province_name') String provinceName,@JsonKey(name: 'city_name') String cityName,@JsonKey(name: 'district_name') String districtName,@JsonKey(name: 'subdistrict_name') String subdistrictName,@JsonKey(name: 'zip_code') int zipCode,@JsonKey(name: 'full_address') String fullAddress, String invoice, int weight, String total, String status,@JsonKey(name: 'snap_token') String? snapToken,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt, CustomerModel customer, OrderShippingModel? shipping,@JsonKey(name: 'transaction_details') List<OrderItemModel> transactionDetails
});


@override $CustomerModelCopyWith<$Res> get customer;@override $OrderShippingModelCopyWith<$Res>? get shipping;

}
/// @nodoc
class __$OrderDetailModelCopyWithImpl<$Res>
    implements _$OrderDetailModelCopyWith<$Res> {
  __$OrderDetailModelCopyWithImpl(this._self, this._then);

  final _OrderDetailModel _self;
  final $Res Function(_OrderDetailModel) _then;

/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? provinceName = null,Object? cityName = null,Object? districtName = null,Object? subdistrictName = null,Object? zipCode = null,Object? fullAddress = null,Object? invoice = null,Object? weight = null,Object? total = null,Object? status = null,Object? snapToken = freezed,Object? createdAt = null,Object? updatedAt = null,Object? customer = null,Object? shipping = freezed,Object? transactionDetails = null,}) {
  return _then(_OrderDetailModel(
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
as CustomerModel,shipping: freezed == shipping ? _self.shipping : shipping // ignore: cast_nullable_to_non_nullable
as OrderShippingModel?,transactionDetails: null == transactionDetails ? _self._transactionDetails : transactionDetails // ignore: cast_nullable_to_non_nullable
as List<OrderItemModel>,
  ));
}

/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerModelCopyWith<$Res> get customer {
  
  return $CustomerModelCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderShippingModelCopyWith<$Res>? get shipping {
    if (_self.shipping == null) {
    return null;
  }

  return $OrderShippingModelCopyWith<$Res>(_self.shipping!, (value) {
    return _then(_self.copyWith(shipping: value));
  });
}
}


/// @nodoc
mixin _$OrderShippingModel {

 int get id;@JsonKey(name: 'transaction_id') int get transactionId;@JsonKey(name: 'shipping_courier') String get shippingCourier;@JsonKey(name: 'shipping_service') String get shippingService;@JsonKey(name: 'shipping_cost') String get shippingCost;
/// Create a copy of OrderShippingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderShippingModelCopyWith<OrderShippingModel> get copyWith => _$OrderShippingModelCopyWithImpl<OrderShippingModel>(this as OrderShippingModel, _$identity);

  /// Serializes this OrderShippingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderShippingModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderShippingModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.transactionId, _this.transactionId) || other.transactionId == _this.transactionId)&&(identical(other.shippingCourier, _this.shippingCourier) || other.shippingCourier == _this.shippingCourier)&&(identical(other.shippingService, _this.shippingService) || other.shippingService == _this.shippingService)&&(identical(other.shippingCost, _this.shippingCost) || other.shippingCost == _this.shippingCost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderShippingModel;
  return Object.hash(runtimeType,_this.id,_this.transactionId,_this.shippingCourier,_this.shippingService,_this.shippingCost);
}

@override
String toString() {
  final _this = this as OrderShippingModel;
  return 'OrderShippingModel(id: ${_this.id}, transactionId: ${_this.transactionId}, shippingCourier: ${_this.shippingCourier}, shippingService: ${_this.shippingService}, shippingCost: ${_this.shippingCost})';
}


}

/// @nodoc
abstract mixin class $OrderShippingModelCopyWith<$Res>  {
  factory $OrderShippingModelCopyWith(OrderShippingModel value, $Res Function(OrderShippingModel) _then) = _$OrderShippingModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'transaction_id') int transactionId,@JsonKey(name: 'shipping_courier') String shippingCourier,@JsonKey(name: 'shipping_service') String shippingService,@JsonKey(name: 'shipping_cost') String shippingCost
});




}
/// @nodoc
class _$OrderShippingModelCopyWithImpl<$Res>
    implements $OrderShippingModelCopyWith<$Res> {
  _$OrderShippingModelCopyWithImpl(this._self, this._then);

  final OrderShippingModel _self;
  final $Res Function(OrderShippingModel) _then;

/// Create a copy of OrderShippingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? transactionId = null,Object? shippingCourier = null,Object? shippingService = null,Object? shippingCost = null,}) {
  return _then(OrderShippingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as int,shippingCourier: null == shippingCourier ? _self.shippingCourier : shippingCourier // ignore: cast_nullable_to_non_nullable
as String,shippingService: null == shippingService ? _self.shippingService : shippingService // ignore: cast_nullable_to_non_nullable
as String,shippingCost: null == shippingCost ? _self.shippingCost : shippingCost // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderShippingModel].
extension OrderShippingModelPatterns on OrderShippingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderShippingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderShippingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderShippingModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderShippingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderShippingModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderShippingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'transaction_id')  int transactionId, @JsonKey(name: 'shipping_courier')  String shippingCourier, @JsonKey(name: 'shipping_service')  String shippingService, @JsonKey(name: 'shipping_cost')  String shippingCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderShippingModel() when $default != null:
return $default(_that.id,_that.transactionId,_that.shippingCourier,_that.shippingService,_that.shippingCost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'transaction_id')  int transactionId, @JsonKey(name: 'shipping_courier')  String shippingCourier, @JsonKey(name: 'shipping_service')  String shippingService, @JsonKey(name: 'shipping_cost')  String shippingCost)  $default,) {final _that = this;
switch (_that) {
case _OrderShippingModel():
return $default(_that.id,_that.transactionId,_that.shippingCourier,_that.shippingService,_that.shippingCost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'transaction_id')  int transactionId, @JsonKey(name: 'shipping_courier')  String shippingCourier, @JsonKey(name: 'shipping_service')  String shippingService, @JsonKey(name: 'shipping_cost')  String shippingCost)?  $default,) {final _that = this;
switch (_that) {
case _OrderShippingModel() when $default != null:
return $default(_that.id,_that.transactionId,_that.shippingCourier,_that.shippingService,_that.shippingCost);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderShippingModel implements OrderShippingModel {
  const _OrderShippingModel({required this.id, @JsonKey(name: 'transaction_id') required this.transactionId, @JsonKey(name: 'shipping_courier') required this.shippingCourier, @JsonKey(name: 'shipping_service') required this.shippingService, @JsonKey(name: 'shipping_cost') required this.shippingCost});
  factory _OrderShippingModel.fromJson(Map<String, dynamic> json) => _$OrderShippingModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'transaction_id') final  int transactionId;
@override@JsonKey(name: 'shipping_courier') final  String shippingCourier;
@override@JsonKey(name: 'shipping_service') final  String shippingService;
@override@JsonKey(name: 'shipping_cost') final  String shippingCost;

/// Create a copy of OrderShippingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderShippingModelCopyWith<_OrderShippingModel> get copyWith => __$OrderShippingModelCopyWithImpl<_OrderShippingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderShippingModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderShippingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.shippingCourier, shippingCourier) || other.shippingCourier == shippingCourier)&&(identical(other.shippingService, shippingService) || other.shippingService == shippingService)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,transactionId,shippingCourier,shippingService,shippingCost);
}

@override
String toString() {
    return 'OrderShippingModel(id: $id, transactionId: $transactionId, shippingCourier: $shippingCourier, shippingService: $shippingService, shippingCost: $shippingCost)';
}


}

/// @nodoc
abstract mixin class _$OrderShippingModelCopyWith<$Res> implements $OrderShippingModelCopyWith<$Res> {
  factory _$OrderShippingModelCopyWith(_OrderShippingModel value, $Res Function(_OrderShippingModel) _then) = __$OrderShippingModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'transaction_id') int transactionId,@JsonKey(name: 'shipping_courier') String shippingCourier,@JsonKey(name: 'shipping_service') String shippingService,@JsonKey(name: 'shipping_cost') String shippingCost
});




}
/// @nodoc
class __$OrderShippingModelCopyWithImpl<$Res>
    implements _$OrderShippingModelCopyWith<$Res> {
  __$OrderShippingModelCopyWithImpl(this._self, this._then);

  final _OrderShippingModel _self;
  final $Res Function(_OrderShippingModel) _then;

/// Create a copy of OrderShippingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? transactionId = null,Object? shippingCourier = null,Object? shippingService = null,Object? shippingCost = null,}) {
  return _then(_OrderShippingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as int,shippingCourier: null == shippingCourier ? _self.shippingCourier : shippingCourier // ignore: cast_nullable_to_non_nullable
as String,shippingService: null == shippingService ? _self.shippingService : shippingService // ignore: cast_nullable_to_non_nullable
as String,shippingCost: null == shippingCost ? _self.shippingCost : shippingCost // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OrderItemModel {

 int get id;@JsonKey(name: 'transaction_id') int get transactionId;@JsonKey(name: 'product_id') int get productId; int get qty; int get price; OrderProductModel? get product;
/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemModelCopyWith<OrderItemModel> get copyWith => _$OrderItemModelCopyWithImpl<OrderItemModel>(this as OrderItemModel, _$identity);

  /// Serializes this OrderItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderItemModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.transactionId, _this.transactionId) || other.transactionId == _this.transactionId)&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.qty, _this.qty) || other.qty == _this.qty)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.product, _this.product) || other.product == _this.product));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderItemModel;
  return Object.hash(runtimeType,_this.id,_this.transactionId,_this.productId,_this.qty,_this.price,_this.product);
}

@override
String toString() {
  final _this = this as OrderItemModel;
  return 'OrderItemModel(id: ${_this.id}, transactionId: ${_this.transactionId}, productId: ${_this.productId}, qty: ${_this.qty}, price: ${_this.price}, product: ${_this.product})';
}


}

/// @nodoc
abstract mixin class $OrderItemModelCopyWith<$Res>  {
  factory $OrderItemModelCopyWith(OrderItemModel value, $Res Function(OrderItemModel) _then) = _$OrderItemModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'transaction_id') int transactionId,@JsonKey(name: 'product_id') int productId, int qty, int price, OrderProductModel? product
});


$OrderProductModelCopyWith<$Res>? get product;

}
/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._self, this._then);

  final OrderItemModel _self;
  final $Res Function(OrderItemModel) _then;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? transactionId = null,Object? productId = null,Object? qty = null,Object? price = null,Object? product = freezed,}) {
  return _then(OrderItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as OrderProductModel?,
  ));
}
/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderProductModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $OrderProductModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderItemModel].
extension OrderItemModelPatterns on OrderItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'transaction_id')  int transactionId, @JsonKey(name: 'product_id')  int productId,  int qty,  int price,  OrderProductModel? product)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
return $default(_that.id,_that.transactionId,_that.productId,_that.qty,_that.price,_that.product);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'transaction_id')  int transactionId, @JsonKey(name: 'product_id')  int productId,  int qty,  int price,  OrderProductModel? product)  $default,) {final _that = this;
switch (_that) {
case _OrderItemModel():
return $default(_that.id,_that.transactionId,_that.productId,_that.qty,_that.price,_that.product);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'transaction_id')  int transactionId, @JsonKey(name: 'product_id')  int productId,  int qty,  int price,  OrderProductModel? product)?  $default,) {final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
return $default(_that.id,_that.transactionId,_that.productId,_that.qty,_that.price,_that.product);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItemModel implements OrderItemModel {
  const _OrderItemModel({required this.id, @JsonKey(name: 'transaction_id') required this.transactionId, @JsonKey(name: 'product_id') required this.productId, required this.qty, required this.price, this.product});
  factory _OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'transaction_id') final  int transactionId;
@override@JsonKey(name: 'product_id') final  int productId;
@override final  int qty;
@override final  int price;
@override final  OrderProductModel? product;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemModelCopyWith<_OrderItemModel> get copyWith => __$OrderItemModelCopyWithImpl<_OrderItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.price, price) || other.price == price)&&(identical(other.product, product) || other.product == product));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,transactionId,productId,qty,price,product);
}

@override
String toString() {
    return 'OrderItemModel(id: $id, transactionId: $transactionId, productId: $productId, qty: $qty, price: $price, product: $product)';
}


}

/// @nodoc
abstract mixin class _$OrderItemModelCopyWith<$Res> implements $OrderItemModelCopyWith<$Res> {
  factory _$OrderItemModelCopyWith(_OrderItemModel value, $Res Function(_OrderItemModel) _then) = __$OrderItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'transaction_id') int transactionId,@JsonKey(name: 'product_id') int productId, int qty, int price, OrderProductModel? product
});


@override $OrderProductModelCopyWith<$Res>? get product;

}
/// @nodoc
class __$OrderItemModelCopyWithImpl<$Res>
    implements _$OrderItemModelCopyWith<$Res> {
  __$OrderItemModelCopyWithImpl(this._self, this._then);

  final _OrderItemModel _self;
  final $Res Function(_OrderItemModel) _then;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? transactionId = null,Object? productId = null,Object? qty = null,Object? price = null,Object? product = freezed,}) {
  return _then(_OrderItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as OrderProductModel?,
  ));
}

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderProductModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $OrderProductModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// @nodoc
mixin _$OrderProductModel {

 int get id; String get image; String get title; String get slug; int get price;
/// Create a copy of OrderProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderProductModelCopyWith<OrderProductModel> get copyWith => _$OrderProductModelCopyWithImpl<OrderProductModel>(this as OrderProductModel, _$identity);

  /// Serializes this OrderProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderProductModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderProductModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.price, _this.price) || other.price == _this.price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderProductModel;
  return Object.hash(runtimeType,_this.id,_this.image,_this.title,_this.slug,_this.price);
}

@override
String toString() {
  final _this = this as OrderProductModel;
  return 'OrderProductModel(id: ${_this.id}, image: ${_this.image}, title: ${_this.title}, slug: ${_this.slug}, price: ${_this.price})';
}


}

/// @nodoc
abstract mixin class $OrderProductModelCopyWith<$Res>  {
  factory $OrderProductModelCopyWith(OrderProductModel value, $Res Function(OrderProductModel) _then) = _$OrderProductModelCopyWithImpl;
@useResult
$Res call({
 int id, String image, String title, String slug, int price
});




}
/// @nodoc
class _$OrderProductModelCopyWithImpl<$Res>
    implements $OrderProductModelCopyWith<$Res> {
  _$OrderProductModelCopyWithImpl(this._self, this._then);

  final OrderProductModel _self;
  final $Res Function(OrderProductModel) _then;

/// Create a copy of OrderProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? image = null,Object? title = null,Object? slug = null,Object? price = null,}) {
  return _then(OrderProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderProductModel].
extension OrderProductModelPatterns on OrderProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderProductModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String image,  String title,  String slug,  int price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderProductModel() when $default != null:
return $default(_that.id,_that.image,_that.title,_that.slug,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String image,  String title,  String slug,  int price)  $default,) {final _that = this;
switch (_that) {
case _OrderProductModel():
return $default(_that.id,_that.image,_that.title,_that.slug,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String image,  String title,  String slug,  int price)?  $default,) {final _that = this;
switch (_that) {
case _OrderProductModel() when $default != null:
return $default(_that.id,_that.image,_that.title,_that.slug,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderProductModel implements OrderProductModel {
  const _OrderProductModel({required this.id, required this.image, required this.title, required this.slug, required this.price});
  factory _OrderProductModel.fromJson(Map<String, dynamic> json) => _$OrderProductModelFromJson(json);

@override final  int id;
@override final  String image;
@override final  String title;
@override final  String slug;
@override final  int price;

/// Create a copy of OrderProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderProductModelCopyWith<_OrderProductModel> get copyWith => __$OrderProductModelCopyWithImpl<_OrderProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,image,title,slug,price);
}

@override
String toString() {
    return 'OrderProductModel(id: $id, image: $image, title: $title, slug: $slug, price: $price)';
}


}

/// @nodoc
abstract mixin class _$OrderProductModelCopyWith<$Res> implements $OrderProductModelCopyWith<$Res> {
  factory _$OrderProductModelCopyWith(_OrderProductModel value, $Res Function(_OrderProductModel) _then) = __$OrderProductModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String image, String title, String slug, int price
});




}
/// @nodoc
class __$OrderProductModelCopyWithImpl<$Res>
    implements _$OrderProductModelCopyWith<$Res> {
  __$OrderProductModelCopyWithImpl(this._self, this._then);

  final _OrderProductModel _self;
  final $Res Function(_OrderProductModel) _then;

/// Create a copy of OrderProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? image = null,Object? title = null,Object? slug = null,Object? price = null,}) {
  return _then(_OrderProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
