// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionEntity {

 String get id; String get userId; String get bookId; String get bookTitle; String get bookCover; String get hubId; String get hubName; int get duration; double get totalPrice; String get paymentMethod; String get status;// 'waiting_pickup', 'completed'
 String get pickupCode;// Kode unik #A1B2
 DateTime get orderDate; DateTime? get pickupDate; DateTime? get actualReturnDate; double get lateFee;
/// Create a copy of TransactionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionEntityCopyWith<TransactionEntity> get copyWith => _$TransactionEntityCopyWithImpl<TransactionEntity>(this as TransactionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.bookTitle, bookTitle) || other.bookTitle == bookTitle)&&(identical(other.bookCover, bookCover) || other.bookCover == bookCover)&&(identical(other.hubId, hubId) || other.hubId == hubId)&&(identical(other.hubName, hubName) || other.hubName == hubName)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.status, status) || other.status == status)&&(identical(other.pickupCode, pickupCode) || other.pickupCode == pickupCode)&&(identical(other.orderDate, orderDate) || other.orderDate == orderDate)&&(identical(other.pickupDate, pickupDate) || other.pickupDate == pickupDate)&&(identical(other.actualReturnDate, actualReturnDate) || other.actualReturnDate == actualReturnDate)&&(identical(other.lateFee, lateFee) || other.lateFee == lateFee));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,bookId,bookTitle,bookCover,hubId,hubName,duration,totalPrice,paymentMethod,status,pickupCode,orderDate,pickupDate,actualReturnDate,lateFee);

@override
String toString() {
  return 'TransactionEntity(id: $id, userId: $userId, bookId: $bookId, bookTitle: $bookTitle, bookCover: $bookCover, hubId: $hubId, hubName: $hubName, duration: $duration, totalPrice: $totalPrice, paymentMethod: $paymentMethod, status: $status, pickupCode: $pickupCode, orderDate: $orderDate, pickupDate: $pickupDate, actualReturnDate: $actualReturnDate, lateFee: $lateFee)';
}


}

/// @nodoc
abstract mixin class $TransactionEntityCopyWith<$Res>  {
  factory $TransactionEntityCopyWith(TransactionEntity value, $Res Function(TransactionEntity) _then) = _$TransactionEntityCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String bookId, String bookTitle, String bookCover, String hubId, String hubName, int duration, double totalPrice, String paymentMethod, String status, String pickupCode, DateTime orderDate, DateTime? pickupDate, DateTime? actualReturnDate, double lateFee
});




}
/// @nodoc
class _$TransactionEntityCopyWithImpl<$Res>
    implements $TransactionEntityCopyWith<$Res> {
  _$TransactionEntityCopyWithImpl(this._self, this._then);

  final TransactionEntity _self;
  final $Res Function(TransactionEntity) _then;

/// Create a copy of TransactionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? bookId = null,Object? bookTitle = null,Object? bookCover = null,Object? hubId = null,Object? hubName = null,Object? duration = null,Object? totalPrice = null,Object? paymentMethod = null,Object? status = null,Object? pickupCode = null,Object? orderDate = null,Object? pickupDate = freezed,Object? actualReturnDate = freezed,Object? lateFee = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,bookTitle: null == bookTitle ? _self.bookTitle : bookTitle // ignore: cast_nullable_to_non_nullable
as String,bookCover: null == bookCover ? _self.bookCover : bookCover // ignore: cast_nullable_to_non_nullable
as String,hubId: null == hubId ? _self.hubId : hubId // ignore: cast_nullable_to_non_nullable
as String,hubName: null == hubName ? _self.hubName : hubName // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,pickupCode: null == pickupCode ? _self.pickupCode : pickupCode // ignore: cast_nullable_to_non_nullable
as String,orderDate: null == orderDate ? _self.orderDate : orderDate // ignore: cast_nullable_to_non_nullable
as DateTime,pickupDate: freezed == pickupDate ? _self.pickupDate : pickupDate // ignore: cast_nullable_to_non_nullable
as DateTime?,actualReturnDate: freezed == actualReturnDate ? _self.actualReturnDate : actualReturnDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lateFee: null == lateFee ? _self.lateFee : lateFee // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionEntity].
extension TransactionEntityPatterns on TransactionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionEntity value)  $default,){
final _that = this;
switch (_that) {
case _TransactionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String bookId,  String bookTitle,  String bookCover,  String hubId,  String hubName,  int duration,  double totalPrice,  String paymentMethod,  String status,  String pickupCode,  DateTime orderDate,  DateTime? pickupDate,  DateTime? actualReturnDate,  double lateFee)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionEntity() when $default != null:
return $default(_that.id,_that.userId,_that.bookId,_that.bookTitle,_that.bookCover,_that.hubId,_that.hubName,_that.duration,_that.totalPrice,_that.paymentMethod,_that.status,_that.pickupCode,_that.orderDate,_that.pickupDate,_that.actualReturnDate,_that.lateFee);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String bookId,  String bookTitle,  String bookCover,  String hubId,  String hubName,  int duration,  double totalPrice,  String paymentMethod,  String status,  String pickupCode,  DateTime orderDate,  DateTime? pickupDate,  DateTime? actualReturnDate,  double lateFee)  $default,) {final _that = this;
switch (_that) {
case _TransactionEntity():
return $default(_that.id,_that.userId,_that.bookId,_that.bookTitle,_that.bookCover,_that.hubId,_that.hubName,_that.duration,_that.totalPrice,_that.paymentMethod,_that.status,_that.pickupCode,_that.orderDate,_that.pickupDate,_that.actualReturnDate,_that.lateFee);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String bookId,  String bookTitle,  String bookCover,  String hubId,  String hubName,  int duration,  double totalPrice,  String paymentMethod,  String status,  String pickupCode,  DateTime orderDate,  DateTime? pickupDate,  DateTime? actualReturnDate,  double lateFee)?  $default,) {final _that = this;
switch (_that) {
case _TransactionEntity() when $default != null:
return $default(_that.id,_that.userId,_that.bookId,_that.bookTitle,_that.bookCover,_that.hubId,_that.hubName,_that.duration,_that.totalPrice,_that.paymentMethod,_that.status,_that.pickupCode,_that.orderDate,_that.pickupDate,_that.actualReturnDate,_that.lateFee);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionEntity implements TransactionEntity {
  const _TransactionEntity({required this.id, required this.userId, required this.bookId, required this.bookTitle, required this.bookCover, required this.hubId, required this.hubName, required this.duration, required this.totalPrice, required this.paymentMethod, required this.status, required this.pickupCode, required this.orderDate, this.pickupDate, this.actualReturnDate, this.lateFee = 0});
  

@override final  String id;
@override final  String userId;
@override final  String bookId;
@override final  String bookTitle;
@override final  String bookCover;
@override final  String hubId;
@override final  String hubName;
@override final  int duration;
@override final  double totalPrice;
@override final  String paymentMethod;
@override final  String status;
// 'waiting_pickup', 'completed'
@override final  String pickupCode;
// Kode unik #A1B2
@override final  DateTime orderDate;
@override final  DateTime? pickupDate;
@override final  DateTime? actualReturnDate;
@override@JsonKey() final  double lateFee;

/// Create a copy of TransactionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionEntityCopyWith<_TransactionEntity> get copyWith => __$TransactionEntityCopyWithImpl<_TransactionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.bookTitle, bookTitle) || other.bookTitle == bookTitle)&&(identical(other.bookCover, bookCover) || other.bookCover == bookCover)&&(identical(other.hubId, hubId) || other.hubId == hubId)&&(identical(other.hubName, hubName) || other.hubName == hubName)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.status, status) || other.status == status)&&(identical(other.pickupCode, pickupCode) || other.pickupCode == pickupCode)&&(identical(other.orderDate, orderDate) || other.orderDate == orderDate)&&(identical(other.pickupDate, pickupDate) || other.pickupDate == pickupDate)&&(identical(other.actualReturnDate, actualReturnDate) || other.actualReturnDate == actualReturnDate)&&(identical(other.lateFee, lateFee) || other.lateFee == lateFee));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,bookId,bookTitle,bookCover,hubId,hubName,duration,totalPrice,paymentMethod,status,pickupCode,orderDate,pickupDate,actualReturnDate,lateFee);

@override
String toString() {
  return 'TransactionEntity(id: $id, userId: $userId, bookId: $bookId, bookTitle: $bookTitle, bookCover: $bookCover, hubId: $hubId, hubName: $hubName, duration: $duration, totalPrice: $totalPrice, paymentMethod: $paymentMethod, status: $status, pickupCode: $pickupCode, orderDate: $orderDate, pickupDate: $pickupDate, actualReturnDate: $actualReturnDate, lateFee: $lateFee)';
}


}

/// @nodoc
abstract mixin class _$TransactionEntityCopyWith<$Res> implements $TransactionEntityCopyWith<$Res> {
  factory _$TransactionEntityCopyWith(_TransactionEntity value, $Res Function(_TransactionEntity) _then) = __$TransactionEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String bookId, String bookTitle, String bookCover, String hubId, String hubName, int duration, double totalPrice, String paymentMethod, String status, String pickupCode, DateTime orderDate, DateTime? pickupDate, DateTime? actualReturnDate, double lateFee
});




}
/// @nodoc
class __$TransactionEntityCopyWithImpl<$Res>
    implements _$TransactionEntityCopyWith<$Res> {
  __$TransactionEntityCopyWithImpl(this._self, this._then);

  final _TransactionEntity _self;
  final $Res Function(_TransactionEntity) _then;

/// Create a copy of TransactionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? bookId = null,Object? bookTitle = null,Object? bookCover = null,Object? hubId = null,Object? hubName = null,Object? duration = null,Object? totalPrice = null,Object? paymentMethod = null,Object? status = null,Object? pickupCode = null,Object? orderDate = null,Object? pickupDate = freezed,Object? actualReturnDate = freezed,Object? lateFee = null,}) {
  return _then(_TransactionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,bookTitle: null == bookTitle ? _self.bookTitle : bookTitle // ignore: cast_nullable_to_non_nullable
as String,bookCover: null == bookCover ? _self.bookCover : bookCover // ignore: cast_nullable_to_non_nullable
as String,hubId: null == hubId ? _self.hubId : hubId // ignore: cast_nullable_to_non_nullable
as String,hubName: null == hubName ? _self.hubName : hubName // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,pickupCode: null == pickupCode ? _self.pickupCode : pickupCode // ignore: cast_nullable_to_non_nullable
as String,orderDate: null == orderDate ? _self.orderDate : orderDate // ignore: cast_nullable_to_non_nullable
as DateTime,pickupDate: freezed == pickupDate ? _self.pickupDate : pickupDate // ignore: cast_nullable_to_non_nullable
as DateTime?,actualReturnDate: freezed == actualReturnDate ? _self.actualReturnDate : actualReturnDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lateFee: null == lateFee ? _self.lateFee : lateFee // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
