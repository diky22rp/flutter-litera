// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {

 SearchStatus get status; List<BookEntity> get books; bool get hasReachedMax; int get page; String? get errorMessage;// Filter
 String get keyword; String get sort; int? get year; String? get genre;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.books, books)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.page, page) || other.page == page)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.year, year) || other.year == year)&&(identical(other.genre, genre) || other.genre == genre));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(books),hasReachedMax,page,errorMessage,keyword,sort,year,genre);

@override
String toString() {
  return 'SearchState(status: $status, books: $books, hasReachedMax: $hasReachedMax, page: $page, errorMessage: $errorMessage, keyword: $keyword, sort: $sort, year: $year, genre: $genre)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 SearchStatus status, List<BookEntity> books, bool hasReachedMax, int page, String? errorMessage, String keyword, String sort, int? year, String? genre
});




}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? books = null,Object? hasReachedMax = null,Object? page = null,Object? errorMessage = freezed,Object? keyword = null,Object? sort = null,Object? year = freezed,Object? genre = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SearchStatus,books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<BookEntity>,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SearchStatus status,  List<BookEntity> books,  bool hasReachedMax,  int page,  String? errorMessage,  String keyword,  String sort,  int? year,  String? genre)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.status,_that.books,_that.hasReachedMax,_that.page,_that.errorMessage,_that.keyword,_that.sort,_that.year,_that.genre);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SearchStatus status,  List<BookEntity> books,  bool hasReachedMax,  int page,  String? errorMessage,  String keyword,  String sort,  int? year,  String? genre)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.status,_that.books,_that.hasReachedMax,_that.page,_that.errorMessage,_that.keyword,_that.sort,_that.year,_that.genre);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SearchStatus status,  List<BookEntity> books,  bool hasReachedMax,  int page,  String? errorMessage,  String keyword,  String sort,  int? year,  String? genre)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.status,_that.books,_that.hasReachedMax,_that.page,_that.errorMessage,_that.keyword,_that.sort,_that.year,_that.genre);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState implements SearchState {
  const _SearchState({this.status = SearchStatus.initial, final  List<BookEntity> books = const [], this.hasReachedMax = false, this.page = 1, this.errorMessage, this.keyword = '', this.sort = 'newest', this.year, this.genre}): _books = books;
  

@override@JsonKey() final  SearchStatus status;
 final  List<BookEntity> _books;
@override@JsonKey() List<BookEntity> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}

@override@JsonKey() final  bool hasReachedMax;
@override@JsonKey() final  int page;
@override final  String? errorMessage;
// Filter
@override@JsonKey() final  String keyword;
@override@JsonKey() final  String sort;
@override final  int? year;
@override final  String? genre;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._books, _books)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.page, page) || other.page == page)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.year, year) || other.year == year)&&(identical(other.genre, genre) || other.genre == genre));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_books),hasReachedMax,page,errorMessage,keyword,sort,year,genre);

@override
String toString() {
  return 'SearchState(status: $status, books: $books, hasReachedMax: $hasReachedMax, page: $page, errorMessage: $errorMessage, keyword: $keyword, sort: $sort, year: $year, genre: $genre)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 SearchStatus status, List<BookEntity> books, bool hasReachedMax, int page, String? errorMessage, String keyword, String sort, int? year, String? genre
});




}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? books = null,Object? hasReachedMax = null,Object? page = null,Object? errorMessage = freezed,Object? keyword = null,Object? sort = null,Object? year = freezed,Object? genre = freezed,}) {
  return _then(_SearchState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SearchStatus,books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<BookEntity>,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
