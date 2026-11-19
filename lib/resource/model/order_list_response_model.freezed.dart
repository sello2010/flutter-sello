// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_list_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderPaginationModel {

@JsonKey(name: 'current_page') int get currentPage; List<OrderModel> get data;@JsonKey(name: 'last_page') int get lastPage; int get total;
/// Create a copy of OrderPaginationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderPaginationModelCopyWith<OrderPaginationModel> get copyWith => _$OrderPaginationModelCopyWithImpl<OrderPaginationModel>(this as OrderPaginationModel, _$identity);

  /// Serializes this OrderPaginationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderPaginationModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderPaginationModel&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&const DeepCollectionEquality().equals(other.data, _this.data)&&(identical(other.lastPage, _this.lastPage) || other.lastPage == _this.lastPage)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderPaginationModel;
  return Object.hash(runtimeType,_this.currentPage,const DeepCollectionEquality().hash(_this.data),_this.lastPage,_this.total);
}

@override
String toString() {
  final _this = this as OrderPaginationModel;
  return 'OrderPaginationModel(currentPage: ${_this.currentPage}, data: ${_this.data}, lastPage: ${_this.lastPage}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $OrderPaginationModelCopyWith<$Res>  {
  factory $OrderPaginationModelCopyWith(OrderPaginationModel value, $Res Function(OrderPaginationModel) _then) = _$OrderPaginationModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage, List<OrderModel> data,@JsonKey(name: 'last_page') int lastPage, int total
});




}
/// @nodoc
class _$OrderPaginationModelCopyWithImpl<$Res>
    implements $OrderPaginationModelCopyWith<$Res> {
  _$OrderPaginationModelCopyWithImpl(this._self, this._then);

  final OrderPaginationModel _self;
  final $Res Function(OrderPaginationModel) _then;

/// Create a copy of OrderPaginationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? data = null,Object? lastPage = null,Object? total = null,}) {
  return _then(OrderPaginationModel(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<OrderModel>,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderPaginationModel].
extension OrderPaginationModelPatterns on OrderPaginationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderPaginationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderPaginationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderPaginationModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderPaginationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderPaginationModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderPaginationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage,  List<OrderModel> data, @JsonKey(name: 'last_page')  int lastPage,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderPaginationModel() when $default != null:
return $default(_that.currentPage,_that.data,_that.lastPage,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage,  List<OrderModel> data, @JsonKey(name: 'last_page')  int lastPage,  int total)  $default,) {final _that = this;
switch (_that) {
case _OrderPaginationModel():
return $default(_that.currentPage,_that.data,_that.lastPage,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page')  int currentPage,  List<OrderModel> data, @JsonKey(name: 'last_page')  int lastPage,  int total)?  $default,) {final _that = this;
switch (_that) {
case _OrderPaginationModel() when $default != null:
return $default(_that.currentPage,_that.data,_that.lastPage,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderPaginationModel implements OrderPaginationModel {
  const _OrderPaginationModel({@JsonKey(name: 'current_page') required this.currentPage, required  List<OrderModel> data, @JsonKey(name: 'last_page') required this.lastPage, required this.total}): _data = data;
  factory _OrderPaginationModel.fromJson(Map<String, dynamic> json) => _$OrderPaginationModelFromJson(json);

@override@JsonKey(name: 'current_page') final  int currentPage;
 final  List<OrderModel> _data;
@override List<OrderModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey(name: 'last_page') final  int lastPage;
@override final  int total;

/// Create a copy of OrderPaginationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderPaginationModelCopyWith<_OrderPaginationModel> get copyWith => __$OrderPaginationModelCopyWithImpl<_OrderPaginationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderPaginationModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderPaginationModel&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other.data, _data)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,currentPage,const DeepCollectionEquality().hash(_data),lastPage,total);
}

@override
String toString() {
    return 'OrderPaginationModel(currentPage: $currentPage, data: $data, lastPage: $lastPage, total: $total)';
}


}

/// @nodoc
abstract mixin class _$OrderPaginationModelCopyWith<$Res> implements $OrderPaginationModelCopyWith<$Res> {
  factory _$OrderPaginationModelCopyWith(_OrderPaginationModel value, $Res Function(_OrderPaginationModel) _then) = __$OrderPaginationModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage, List<OrderModel> data,@JsonKey(name: 'last_page') int lastPage, int total
});




}
/// @nodoc
class __$OrderPaginationModelCopyWithImpl<$Res>
    implements _$OrderPaginationModelCopyWith<$Res> {
  __$OrderPaginationModelCopyWithImpl(this._self, this._then);

  final _OrderPaginationModel _self;
  final $Res Function(_OrderPaginationModel) _then;

/// Create a copy of OrderPaginationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? data = null,Object? lastPage = null,Object? total = null,}) {
  return _then(_OrderPaginationModel(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<OrderModel>,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$OrderListResponseModel {

 bool get success; String get message; OrderPaginationModel get data;
/// Create a copy of OrderListResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderListResponseModelCopyWith<OrderListResponseModel> get copyWith => _$OrderListResponseModelCopyWithImpl<OrderListResponseModel>(this as OrderListResponseModel, _$identity);

  /// Serializes this OrderListResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderListResponseModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderListResponseModel&&(identical(other.success, _this.success) || other.success == _this.success)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.data, _this.data) || other.data == _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderListResponseModel;
  return Object.hash(runtimeType,_this.success,_this.message,_this.data);
}

@override
String toString() {
  final _this = this as OrderListResponseModel;
  return 'OrderListResponseModel(success: ${_this.success}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $OrderListResponseModelCopyWith<$Res>  {
  factory $OrderListResponseModelCopyWith(OrderListResponseModel value, $Res Function(OrderListResponseModel) _then) = _$OrderListResponseModelCopyWithImpl;
@useResult
$Res call({
 bool success, String message, OrderPaginationModel data
});


$OrderPaginationModelCopyWith<$Res> get data;

}
/// @nodoc
class _$OrderListResponseModelCopyWithImpl<$Res>
    implements $OrderListResponseModelCopyWith<$Res> {
  _$OrderListResponseModelCopyWithImpl(this._self, this._then);

  final OrderListResponseModel _self;
  final $Res Function(OrderListResponseModel) _then;

/// Create a copy of OrderListResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(OrderListResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OrderPaginationModel,
  ));
}
/// Create a copy of OrderListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderPaginationModelCopyWith<$Res> get data {
  
  return $OrderPaginationModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderListResponseModel].
extension OrderListResponseModelPatterns on OrderListResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderListResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderListResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderListResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderListResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderListResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderListResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  OrderPaginationModel data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderListResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  OrderPaginationModel data)  $default,) {final _that = this;
switch (_that) {
case _OrderListResponseModel():
return $default(_that.success,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  OrderPaginationModel data)?  $default,) {final _that = this;
switch (_that) {
case _OrderListResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderListResponseModel implements OrderListResponseModel {
  const _OrderListResponseModel({required this.success, required this.message, required this.data});
  factory _OrderListResponseModel.fromJson(Map<String, dynamic> json) => _$OrderListResponseModelFromJson(json);

@override final  bool success;
@override final  String message;
@override final  OrderPaginationModel data;

/// Create a copy of OrderListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderListResponseModelCopyWith<_OrderListResponseModel> get copyWith => __$OrderListResponseModelCopyWithImpl<_OrderListResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderListResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderListResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,success,message,data);
}

@override
String toString() {
    return 'OrderListResponseModel(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$OrderListResponseModelCopyWith<$Res> implements $OrderListResponseModelCopyWith<$Res> {
  factory _$OrderListResponseModelCopyWith(_OrderListResponseModel value, $Res Function(_OrderListResponseModel) _then) = __$OrderListResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, OrderPaginationModel data
});


@override $OrderPaginationModelCopyWith<$Res> get data;

}
/// @nodoc
class __$OrderListResponseModelCopyWithImpl<$Res>
    implements _$OrderListResponseModelCopyWith<$Res> {
  __$OrderListResponseModelCopyWithImpl(this._self, this._then);

  final _OrderListResponseModel _self;
  final $Res Function(_OrderListResponseModel) _then;

/// Create a copy of OrderListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_OrderListResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OrderPaginationModel,
  ));
}

/// Create a copy of OrderListResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderPaginationModelCopyWith<$Res> get data {
  
  return $OrderPaginationModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
