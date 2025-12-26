// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingEvent {

 BookEntity get book; int get durationInDays; double get totalPrice; String get paymentMethod;
/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingEventCopyWith<BookingEvent> get copyWith => _$BookingEventCopyWithImpl<BookingEvent>(this as BookingEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingEvent&&(identical(other.book, book) || other.book == book)&&(identical(other.durationInDays, durationInDays) || other.durationInDays == durationInDays)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}


@override
int get hashCode => Object.hash(runtimeType,book,durationInDays,totalPrice,paymentMethod);

@override
String toString() {
  return 'BookingEvent(book: $book, durationInDays: $durationInDays, totalPrice: $totalPrice, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class $BookingEventCopyWith<$Res>  {
  factory $BookingEventCopyWith(BookingEvent value, $Res Function(BookingEvent) _then) = _$BookingEventCopyWithImpl;
@useResult
$Res call({
 BookEntity book, int durationInDays, double totalPrice, String paymentMethod
});




}
/// @nodoc
class _$BookingEventCopyWithImpl<$Res>
    implements $BookingEventCopyWith<$Res> {
  _$BookingEventCopyWithImpl(this._self, this._then);

  final BookingEvent _self;
  final $Res Function(BookingEvent) _then;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? book = null,Object? durationInDays = null,Object? totalPrice = null,Object? paymentMethod = null,}) {
  return _then(_self.copyWith(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as BookEntity,durationInDays: null == durationInDays ? _self.durationInDays : durationInDays // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingEvent].
extension BookingEventPatterns on BookingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RentBook value)?  rentBook,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentBook() when rentBook != null:
return rentBook(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RentBook value)  rentBook,}){
final _that = this;
switch (_that) {
case _RentBook():
return rentBook(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RentBook value)?  rentBook,}){
final _that = this;
switch (_that) {
case _RentBook() when rentBook != null:
return rentBook(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( BookEntity book,  int durationInDays,  double totalPrice,  String paymentMethod)?  rentBook,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentBook() when rentBook != null:
return rentBook(_that.book,_that.durationInDays,_that.totalPrice,_that.paymentMethod);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( BookEntity book,  int durationInDays,  double totalPrice,  String paymentMethod)  rentBook,}) {final _that = this;
switch (_that) {
case _RentBook():
return rentBook(_that.book,_that.durationInDays,_that.totalPrice,_that.paymentMethod);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( BookEntity book,  int durationInDays,  double totalPrice,  String paymentMethod)?  rentBook,}) {final _that = this;
switch (_that) {
case _RentBook() when rentBook != null:
return rentBook(_that.book,_that.durationInDays,_that.totalPrice,_that.paymentMethod);case _:
  return null;

}
}

}

/// @nodoc


class _RentBook implements BookingEvent {
  const _RentBook({required this.book, required this.durationInDays, required this.totalPrice, required this.paymentMethod});
  

@override final  BookEntity book;
@override final  int durationInDays;
@override final  double totalPrice;
@override final  String paymentMethod;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentBookCopyWith<_RentBook> get copyWith => __$RentBookCopyWithImpl<_RentBook>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentBook&&(identical(other.book, book) || other.book == book)&&(identical(other.durationInDays, durationInDays) || other.durationInDays == durationInDays)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}


@override
int get hashCode => Object.hash(runtimeType,book,durationInDays,totalPrice,paymentMethod);

@override
String toString() {
  return 'BookingEvent.rentBook(book: $book, durationInDays: $durationInDays, totalPrice: $totalPrice, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class _$RentBookCopyWith<$Res> implements $BookingEventCopyWith<$Res> {
  factory _$RentBookCopyWith(_RentBook value, $Res Function(_RentBook) _then) = __$RentBookCopyWithImpl;
@override @useResult
$Res call({
 BookEntity book, int durationInDays, double totalPrice, String paymentMethod
});




}
/// @nodoc
class __$RentBookCopyWithImpl<$Res>
    implements _$RentBookCopyWith<$Res> {
  __$RentBookCopyWithImpl(this._self, this._then);

  final _RentBook _self;
  final $Res Function(_RentBook) _then;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? book = null,Object? durationInDays = null,Object? totalPrice = null,Object? paymentMethod = null,}) {
  return _then(_RentBook(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as BookEntity,durationInDays: null == durationInDays ? _self.durationInDays : durationInDays // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
