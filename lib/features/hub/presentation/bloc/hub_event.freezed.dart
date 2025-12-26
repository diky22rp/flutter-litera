// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hub_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HubState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HubState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HubState()';
}


}

/// @nodoc
class $HubStateCopyWith<$Res>  {
$HubStateCopyWith(HubState _, $Res Function(HubState) __);
}


/// Adds pattern-matching-related methods to [HubState].
extension HubStatePatterns on HubState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _HubNameLoaded value)?  hubNameLoaded,TResult Function( _Error value)?  error,TResult Function( _SelectedSuccess value)?  selectedSuccess,TResult Function( _HubSelected value)?  hubSelected,TResult Function( _HubNotSelected value)?  hubNotSelected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _HubNameLoaded() when hubNameLoaded != null:
return hubNameLoaded(_that);case _Error() when error != null:
return error(_that);case _SelectedSuccess() when selectedSuccess != null:
return selectedSuccess(_that);case _HubSelected() when hubSelected != null:
return hubSelected(_that);case _HubNotSelected() when hubNotSelected != null:
return hubNotSelected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _HubNameLoaded value)  hubNameLoaded,required TResult Function( _Error value)  error,required TResult Function( _SelectedSuccess value)  selectedSuccess,required TResult Function( _HubSelected value)  hubSelected,required TResult Function( _HubNotSelected value)  hubNotSelected,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _HubNameLoaded():
return hubNameLoaded(_that);case _Error():
return error(_that);case _SelectedSuccess():
return selectedSuccess(_that);case _HubSelected():
return hubSelected(_that);case _HubNotSelected():
return hubNotSelected(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _HubNameLoaded value)?  hubNameLoaded,TResult? Function( _Error value)?  error,TResult? Function( _SelectedSuccess value)?  selectedSuccess,TResult? Function( _HubSelected value)?  hubSelected,TResult? Function( _HubNotSelected value)?  hubNotSelected,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _HubNameLoaded() when hubNameLoaded != null:
return hubNameLoaded(_that);case _Error() when error != null:
return error(_that);case _SelectedSuccess() when selectedSuccess != null:
return selectedSuccess(_that);case _HubSelected() when hubSelected != null:
return hubSelected(_that);case _HubNotSelected() when hubNotSelected != null:
return hubNotSelected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<HubEntity> hubs)?  loaded,TResult Function( String hubName)?  hubNameLoaded,TResult Function( String message)?  error,TResult Function()?  selectedSuccess,TResult Function( String hubId)?  hubSelected,TResult Function()?  hubNotSelected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.hubs);case _HubNameLoaded() when hubNameLoaded != null:
return hubNameLoaded(_that.hubName);case _Error() when error != null:
return error(_that.message);case _SelectedSuccess() when selectedSuccess != null:
return selectedSuccess();case _HubSelected() when hubSelected != null:
return hubSelected(_that.hubId);case _HubNotSelected() when hubNotSelected != null:
return hubNotSelected();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<HubEntity> hubs)  loaded,required TResult Function( String hubName)  hubNameLoaded,required TResult Function( String message)  error,required TResult Function()  selectedSuccess,required TResult Function( String hubId)  hubSelected,required TResult Function()  hubNotSelected,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.hubs);case _HubNameLoaded():
return hubNameLoaded(_that.hubName);case _Error():
return error(_that.message);case _SelectedSuccess():
return selectedSuccess();case _HubSelected():
return hubSelected(_that.hubId);case _HubNotSelected():
return hubNotSelected();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<HubEntity> hubs)?  loaded,TResult? Function( String hubName)?  hubNameLoaded,TResult? Function( String message)?  error,TResult? Function()?  selectedSuccess,TResult? Function( String hubId)?  hubSelected,TResult? Function()?  hubNotSelected,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.hubs);case _HubNameLoaded() when hubNameLoaded != null:
return hubNameLoaded(_that.hubName);case _Error() when error != null:
return error(_that.message);case _SelectedSuccess() when selectedSuccess != null:
return selectedSuccess();case _HubSelected() when hubSelected != null:
return hubSelected(_that.hubId);case _HubNotSelected() when hubNotSelected != null:
return hubNotSelected();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements HubState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HubState.initial()';
}


}




/// @nodoc


class _Loading implements HubState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HubState.loading()';
}


}




/// @nodoc


class _Loaded implements HubState {
  const _Loaded(final  List<HubEntity> hubs): _hubs = hubs;
  

 final  List<HubEntity> _hubs;
 List<HubEntity> get hubs {
  if (_hubs is EqualUnmodifiableListView) return _hubs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hubs);
}


/// Create a copy of HubState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._hubs, _hubs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hubs));

@override
String toString() {
  return 'HubState.loaded(hubs: $hubs)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $HubStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<HubEntity> hubs
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of HubState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hubs = null,}) {
  return _then(_Loaded(
null == hubs ? _self._hubs : hubs // ignore: cast_nullable_to_non_nullable
as List<HubEntity>,
  ));
}


}

/// @nodoc


class _HubNameLoaded implements HubState {
  const _HubNameLoaded(this.hubName);
  

 final  String hubName;

/// Create a copy of HubState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HubNameLoadedCopyWith<_HubNameLoaded> get copyWith => __$HubNameLoadedCopyWithImpl<_HubNameLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HubNameLoaded&&(identical(other.hubName, hubName) || other.hubName == hubName));
}


@override
int get hashCode => Object.hash(runtimeType,hubName);

@override
String toString() {
  return 'HubState.hubNameLoaded(hubName: $hubName)';
}


}

/// @nodoc
abstract mixin class _$HubNameLoadedCopyWith<$Res> implements $HubStateCopyWith<$Res> {
  factory _$HubNameLoadedCopyWith(_HubNameLoaded value, $Res Function(_HubNameLoaded) _then) = __$HubNameLoadedCopyWithImpl;
@useResult
$Res call({
 String hubName
});




}
/// @nodoc
class __$HubNameLoadedCopyWithImpl<$Res>
    implements _$HubNameLoadedCopyWith<$Res> {
  __$HubNameLoadedCopyWithImpl(this._self, this._then);

  final _HubNameLoaded _self;
  final $Res Function(_HubNameLoaded) _then;

/// Create a copy of HubState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hubName = null,}) {
  return _then(_HubNameLoaded(
null == hubName ? _self.hubName : hubName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Error implements HubState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of HubState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HubState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $HubStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of HubState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SelectedSuccess implements HubState {
  const _SelectedSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectedSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HubState.selectedSuccess()';
}


}




/// @nodoc


class _HubSelected implements HubState {
  const _HubSelected(this.hubId);
  

 final  String hubId;

/// Create a copy of HubState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HubSelectedCopyWith<_HubSelected> get copyWith => __$HubSelectedCopyWithImpl<_HubSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HubSelected&&(identical(other.hubId, hubId) || other.hubId == hubId));
}


@override
int get hashCode => Object.hash(runtimeType,hubId);

@override
String toString() {
  return 'HubState.hubSelected(hubId: $hubId)';
}


}

/// @nodoc
abstract mixin class _$HubSelectedCopyWith<$Res> implements $HubStateCopyWith<$Res> {
  factory _$HubSelectedCopyWith(_HubSelected value, $Res Function(_HubSelected) _then) = __$HubSelectedCopyWithImpl;
@useResult
$Res call({
 String hubId
});




}
/// @nodoc
class __$HubSelectedCopyWithImpl<$Res>
    implements _$HubSelectedCopyWith<$Res> {
  __$HubSelectedCopyWithImpl(this._self, this._then);

  final _HubSelected _self;
  final $Res Function(_HubSelected) _then;

/// Create a copy of HubState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hubId = null,}) {
  return _then(_HubSelected(
null == hubId ? _self.hubId : hubId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _HubNotSelected implements HubState {
  const _HubNotSelected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HubNotSelected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HubState.hubNotSelected()';
}


}




// dart format on
