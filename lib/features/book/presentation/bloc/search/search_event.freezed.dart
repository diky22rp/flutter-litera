// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent()';
}


}

/// @nodoc
class $SearchEventCopyWith<$Res>  {
$SearchEventCopyWith(SearchEvent _, $Res Function(SearchEvent) __);
}


/// Adds pattern-matching-related methods to [SearchEvent].
extension SearchEventPatterns on SearchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ApplyFilter value)?  applyFilter,TResult Function( FetchNextPage value)?  fetchNextPage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ApplyFilter() when applyFilter != null:
return applyFilter(_that);case FetchNextPage() when fetchNextPage != null:
return fetchNextPage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ApplyFilter value)  applyFilter,required TResult Function( FetchNextPage value)  fetchNextPage,}){
final _that = this;
switch (_that) {
case ApplyFilter():
return applyFilter(_that);case FetchNextPage():
return fetchNextPage(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ApplyFilter value)?  applyFilter,TResult? Function( FetchNextPage value)?  fetchNextPage,}){
final _that = this;
switch (_that) {
case ApplyFilter() when applyFilter != null:
return applyFilter(_that);case FetchNextPage() when fetchNextPage != null:
return fetchNextPage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? keyword,  String? sort,  int? year,  String? genre)?  applyFilter,TResult Function()?  fetchNextPage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ApplyFilter() when applyFilter != null:
return applyFilter(_that.keyword,_that.sort,_that.year,_that.genre);case FetchNextPage() when fetchNextPage != null:
return fetchNextPage();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? keyword,  String? sort,  int? year,  String? genre)  applyFilter,required TResult Function()  fetchNextPage,}) {final _that = this;
switch (_that) {
case ApplyFilter():
return applyFilter(_that.keyword,_that.sort,_that.year,_that.genre);case FetchNextPage():
return fetchNextPage();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? keyword,  String? sort,  int? year,  String? genre)?  applyFilter,TResult? Function()?  fetchNextPage,}) {final _that = this;
switch (_that) {
case ApplyFilter() when applyFilter != null:
return applyFilter(_that.keyword,_that.sort,_that.year,_that.genre);case FetchNextPage() when fetchNextPage != null:
return fetchNextPage();case _:
  return null;

}
}

}

/// @nodoc


class ApplyFilter implements SearchEvent {
  const ApplyFilter({this.keyword, this.sort, this.year, this.genre});
  

 final  String? keyword;
 final  String? sort;
 final  int? year;
 final  String? genre;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplyFilterCopyWith<ApplyFilter> get copyWith => _$ApplyFilterCopyWithImpl<ApplyFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplyFilter&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.year, year) || other.year == year)&&(identical(other.genre, genre) || other.genre == genre));
}


@override
int get hashCode => Object.hash(runtimeType,keyword,sort,year,genre);

@override
String toString() {
  return 'SearchEvent.applyFilter(keyword: $keyword, sort: $sort, year: $year, genre: $genre)';
}


}

/// @nodoc
abstract mixin class $ApplyFilterCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory $ApplyFilterCopyWith(ApplyFilter value, $Res Function(ApplyFilter) _then) = _$ApplyFilterCopyWithImpl;
@useResult
$Res call({
 String? keyword, String? sort, int? year, String? genre
});




}
/// @nodoc
class _$ApplyFilterCopyWithImpl<$Res>
    implements $ApplyFilterCopyWith<$Res> {
  _$ApplyFilterCopyWithImpl(this._self, this._then);

  final ApplyFilter _self;
  final $Res Function(ApplyFilter) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? keyword = freezed,Object? sort = freezed,Object? year = freezed,Object? genre = freezed,}) {
  return _then(ApplyFilter(
keyword: freezed == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String?,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class FetchNextPage implements SearchEvent {
  const FetchNextPage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchNextPage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.fetchNextPage()';
}


}




// dart format on
