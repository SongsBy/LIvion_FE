// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scheduled_live.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScheduledLive {

 String get id; String? get thumbnail; DateTime? get startsAt; bool get isOnAir;
/// Create a copy of ScheduledLive
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduledLiveCopyWith<ScheduledLive> get copyWith => _$ScheduledLiveCopyWithImpl<ScheduledLive>(this as ScheduledLive, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduledLive&&(identical(other.id, id) || other.id == id)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.isOnAir, isOnAir) || other.isOnAir == isOnAir));
}


@override
int get hashCode => Object.hash(runtimeType,id,thumbnail,startsAt,isOnAir);

@override
String toString() {
  return 'ScheduledLive(id: $id, thumbnail: $thumbnail, startsAt: $startsAt, isOnAir: $isOnAir)';
}


}

/// @nodoc
abstract mixin class $ScheduledLiveCopyWith<$Res>  {
  factory $ScheduledLiveCopyWith(ScheduledLive value, $Res Function(ScheduledLive) _then) = _$ScheduledLiveCopyWithImpl;
@useResult
$Res call({
 String id, String? thumbnail, DateTime? startsAt, bool isOnAir
});




}
/// @nodoc
class _$ScheduledLiveCopyWithImpl<$Res>
    implements $ScheduledLiveCopyWith<$Res> {
  _$ScheduledLiveCopyWithImpl(this._self, this._then);

  final ScheduledLive _self;
  final $Res Function(ScheduledLive) _then;

/// Create a copy of ScheduledLive
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? thumbnail = freezed,Object? startsAt = freezed,Object? isOnAir = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,startsAt: freezed == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isOnAir: null == isOnAir ? _self.isOnAir : isOnAir // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduledLive].
extension ScheduledLivePatterns on ScheduledLive {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduledLive value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduledLive() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduledLive value)  $default,){
final _that = this;
switch (_that) {
case _ScheduledLive():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduledLive value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduledLive() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? thumbnail,  DateTime? startsAt,  bool isOnAir)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduledLive() when $default != null:
return $default(_that.id,_that.thumbnail,_that.startsAt,_that.isOnAir);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? thumbnail,  DateTime? startsAt,  bool isOnAir)  $default,) {final _that = this;
switch (_that) {
case _ScheduledLive():
return $default(_that.id,_that.thumbnail,_that.startsAt,_that.isOnAir);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? thumbnail,  DateTime? startsAt,  bool isOnAir)?  $default,) {final _that = this;
switch (_that) {
case _ScheduledLive() when $default != null:
return $default(_that.id,_that.thumbnail,_that.startsAt,_that.isOnAir);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduledLive implements ScheduledLive {
  const _ScheduledLive({required this.id, this.thumbnail, this.startsAt, this.isOnAir = false});
  

@override final  String id;
@override final  String? thumbnail;
@override final  DateTime? startsAt;
@override@JsonKey() final  bool isOnAir;

/// Create a copy of ScheduledLive
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduledLiveCopyWith<_ScheduledLive> get copyWith => __$ScheduledLiveCopyWithImpl<_ScheduledLive>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduledLive&&(identical(other.id, id) || other.id == id)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.isOnAir, isOnAir) || other.isOnAir == isOnAir));
}


@override
int get hashCode => Object.hash(runtimeType,id,thumbnail,startsAt,isOnAir);

@override
String toString() {
  return 'ScheduledLive(id: $id, thumbnail: $thumbnail, startsAt: $startsAt, isOnAir: $isOnAir)';
}


}

/// @nodoc
abstract mixin class _$ScheduledLiveCopyWith<$Res> implements $ScheduledLiveCopyWith<$Res> {
  factory _$ScheduledLiveCopyWith(_ScheduledLive value, $Res Function(_ScheduledLive) _then) = __$ScheduledLiveCopyWithImpl;
@override @useResult
$Res call({
 String id, String? thumbnail, DateTime? startsAt, bool isOnAir
});




}
/// @nodoc
class __$ScheduledLiveCopyWithImpl<$Res>
    implements _$ScheduledLiveCopyWith<$Res> {
  __$ScheduledLiveCopyWithImpl(this._self, this._then);

  final _ScheduledLive _self;
  final $Res Function(_ScheduledLive) _then;

/// Create a copy of ScheduledLive
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? thumbnail = freezed,Object? startsAt = freezed,Object? isOnAir = null,}) {
  return _then(_ScheduledLive(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,startsAt: freezed == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isOnAir: null == isOnAir ? _self.isOnAir : isOnAir // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
