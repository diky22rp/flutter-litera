// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hub_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HubEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HubEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HubEvent()';
}


}

/// @nodoc
class $HubEventCopyWith<$Res>  {
$HubEventCopyWith(HubEvent _, $Res Function(HubEvent) __);
}


/// Adds pattern-matching-related methods to [HubEvent].
extension HubEventPatterns on HubEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchAllHubs value)?  fetchAllHubs,TResult Function( _SelectHub value)?  selectHub,TResult Function( _GetSavedHubName value)?  getSavedHubName,TResult Function( _CheckHubSelection value)?  checkHubSelection,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchAllHubs() when fetchAllHubs != null:
return fetchAllHubs(_that);case _SelectHub() when selectHub != null:
return selectHub(_that);case _GetSavedHubName() when getSavedHubName != null:
return getSavedHubName(_that);case _CheckHubSelection() when checkHubSelection != null:
return checkHubSelection(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchAllHubs value)  fetchAllHubs,required TResult Function( _SelectHub value)  selectHub,required TResult Function( _GetSavedHubName value)  getSavedHubName,required TResult Function( _CheckHubSelection value)  checkHubSelection,}){
final _that = this;
switch (_that) {
case _FetchAllHubs():
return fetchAllHubs(_that);case _SelectHub():
return selectHub(_that);case _GetSavedHubName():
return getSavedHubName(_that);case _CheckHubSelection():
return checkHubSelection(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchAllHubs value)?  fetchAllHubs,TResult? Function( _SelectHub value)?  selectHub,TResult? Function( _GetSavedHubName value)?  getSavedHubName,TResult? Function( _CheckHubSelection value)?  checkHubSelection,}){
final _that = this;
switch (_that) {
case _FetchAllHubs() when fetchAllHubs != null:
return fetchAllHubs(_that);case _SelectHub() when selectHub != null:
return selectHub(_that);case _GetSavedHubName() when getSavedHubName != null:
return getSavedHubName(_that);case _CheckHubSelection() when checkHubSelection != null:
return checkHubSelection(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchAllHubs,TResult Function( HubEntity hub)?  selectHub,TResult Function()?  getSavedHubName,TResult Function()?  checkHubSelection,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchAllHubs() when fetchAllHubs != null:
return fetchAllHubs();case _SelectHub() when selectHub != null:
return selectHub(_that.hub);case _GetSavedHubName() when getSavedHubName != null:
return getSavedHubName();case _CheckHubSelection() when checkHubSelection != null:
return checkHubSelection();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchAllHubs,required TResult Function( HubEntity hub)  selectHub,required TResult Function()  getSavedHubName,required TResult Function()  checkHubSelection,}) {final _that = this;
switch (_that) {
case _FetchAllHubs():
return fetchAllHubs();case _SelectHub():
return selectHub(_that.hub);case _GetSavedHubName():
return getSavedHubName();case _CheckHubSelection():
return checkHubSelection();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchAllHubs,TResult? Function( HubEntity hub)?  selectHub,TResult? Function()?  getSavedHubName,TResult? Function()?  checkHubSelection,}) {final _that = this;
switch (_that) {
case _FetchAllHubs() when fetchAllHubs != null:
return fetchAllHubs();case _SelectHub() when selectHub != null:
return selectHub(_that.hub);case _GetSavedHubName() when getSavedHubName != null:
return getSavedHubName();case _CheckHubSelection() when checkHubSelection != null:
return checkHubSelection();case _:
  return null;

}
}

}

/// @nodoc


class _FetchAllHubs implements HubEvent {
  const _FetchAllHubs();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchAllHubs);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HubEvent.fetchAllHubs()';
}


}




/// @nodoc


class _SelectHub implements HubEvent {
  const _SelectHub(this.hub);
  

 final  HubEntity hub;

/// Create a copy of HubEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectHubCopyWith<_SelectHub> get copyWith => __$SelectHubCopyWithImpl<_SelectHub>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectHub&&(identical(other.hub, hub) || other.hub == hub));
}


@override
int get hashCode => Object.hash(runtimeType,hub);

@override
String toString() {
  return 'HubEvent.selectHub(hub: $hub)';
}


}

/// @nodoc
abstract mixin class _$SelectHubCopyWith<$Res> implements $HubEventCopyWith<$Res> {
  factory _$SelectHubCopyWith(_SelectHub value, $Res Function(_SelectHub) _then) = __$SelectHubCopyWithImpl;
@useResult
$Res call({
 HubEntity hub
});




}
/// @nodoc
class __$SelectHubCopyWithImpl<$Res>
    implements _$SelectHubCopyWith<$Res> {
  __$SelectHubCopyWithImpl(this._self, this._then);

  final _SelectHub _self;
  final $Res Function(_SelectHub) _then;

/// Create a copy of HubEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hub = null,}) {
  return _then(_SelectHub(
null == hub ? _self.hub : hub // ignore: cast_nullable_to_non_nullable
as HubEntity,
  ));
}


}

/// @nodoc


class _GetSavedHubName implements HubEvent {
  const _GetSavedHubName();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetSavedHubName);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HubEvent.getSavedHubName()';
}


}




/// @nodoc


class _CheckHubSelection implements HubEvent {
  const _CheckHubSelection();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckHubSelection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HubEvent.checkHubSelection()';
}


}




// dart format on
