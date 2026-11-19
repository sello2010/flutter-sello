// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OrderState()';
}


}

/// @nodoc
class $OrderStateCopyWith<$Res>  {
$OrderStateCopyWith(OrderState _, $Res Function(OrderState) __);
}


/// Adds pattern-matching-related methods to [OrderState].
extension OrderStatePatterns on OrderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OrderInitial value)?  initial,TResult Function( OrderLoading value)?  loading,TResult Function( OrderLoaded value)?  loaded,TResult Function( OrderError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OrderInitial() when initial != null:
return initial(_that);case OrderLoading() when loading != null:
return loading(_that);case OrderLoaded() when loaded != null:
return loaded(_that);case OrderError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OrderInitial value)  initial,required TResult Function( OrderLoading value)  loading,required TResult Function( OrderLoaded value)  loaded,required TResult Function( OrderError value)  error,}){
final _that = this;
switch (_that) {
case OrderInitial():
return initial(_that);case OrderLoading():
return loading(_that);case OrderLoaded():
return loaded(_that);case OrderError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OrderInitial value)?  initial,TResult? Function( OrderLoading value)?  loading,TResult? Function( OrderLoaded value)?  loaded,TResult? Function( OrderError value)?  error,}){
final _that = this;
switch (_that) {
case OrderInitial() when initial != null:
return initial(_that);case OrderLoading() when loading != null:
return loading(_that);case OrderLoaded() when loaded != null:
return loaded(_that);case OrderError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( OrderListResponseModel data)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OrderInitial() when initial != null:
return initial();case OrderLoading() when loading != null:
return loading();case OrderLoaded() when loaded != null:
return loaded(_that.data);case OrderError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( OrderListResponseModel data)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case OrderInitial():
return initial();case OrderLoading():
return loading();case OrderLoaded():
return loaded(_that.data);case OrderError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( OrderListResponseModel data)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case OrderInitial() when initial != null:
return initial();case OrderLoading() when loading != null:
return loading();case OrderLoaded() when loaded != null:
return loaded(_that.data);case OrderError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class OrderInitial implements OrderState {
  const OrderInitial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OrderState.initial()';
}


}




/// @nodoc


class OrderLoading implements OrderState {
  const OrderLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OrderState.loading()';
}


}




/// @nodoc


class OrderLoaded implements OrderState {
  const OrderLoaded(this.data);
  

 final  OrderListResponseModel data;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderLoadedCopyWith<OrderLoaded> get copyWith => _$OrderLoadedCopyWithImpl<OrderLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderLoaded&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode {
    return Object.hash(runtimeType,data);
}

@override
String toString() {
    return 'OrderState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $OrderLoadedCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory $OrderLoadedCopyWith(OrderLoaded value, $Res Function(OrderLoaded) _then) = _$OrderLoadedCopyWithImpl;
@useResult
$Res call({
 OrderListResponseModel data
});


$OrderListResponseModelCopyWith<$Res> get data;

}
/// @nodoc
class _$OrderLoadedCopyWithImpl<$Res>
    implements $OrderLoadedCopyWith<$Res> {
  _$OrderLoadedCopyWithImpl(this._self, this._then);

  final OrderLoaded _self;
  final $Res Function(OrderLoaded) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(OrderLoaded(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OrderListResponseModel,
  ));
}

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderListResponseModelCopyWith<$Res> get data {
  
  return $OrderListResponseModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class OrderError implements OrderState {
  const OrderError(this.message);
  

 final  String message;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderErrorCopyWith<OrderError> get copyWith => _$OrderErrorCopyWithImpl<OrderError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'OrderState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $OrderErrorCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory $OrderErrorCopyWith(OrderError value, $Res Function(OrderError) _then) = _$OrderErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$OrderErrorCopyWithImpl<$Res>
    implements $OrderErrorCopyWith<$Res> {
  _$OrderErrorCopyWithImpl(this._self, this._then);

  final OrderError _self;
  final $Res Function(OrderError) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(OrderError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
