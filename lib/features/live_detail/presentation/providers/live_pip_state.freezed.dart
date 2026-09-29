// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_pip_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LivePipSource {

 String get liveId;/// 방송 화면. 데모 단계에서는 사진 에셋이고, 영상이 붙으면 스트림 URL로 바뀐다.
 String? get broadcastImage;
/// Create a copy of LivePipSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LivePipSourceCopyWith<LivePipSource> get copyWith => _$LivePipSourceCopyWithImpl<LivePipSource>(this as LivePipSource, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LivePipSource&&(identical(other.liveId, liveId) || other.liveId == liveId)&&(identical(other.broadcastImage, broadcastImage) || other.broadcastImage == broadcastImage));
}


@override
int get hashCode => Object.hash(runtimeType,liveId,broadcastImage);

@override
String toString() {
  return 'LivePipSource(liveId: $liveId, broadcastImage: $broadcastImage)';
}


}

/// @nodoc
abstract mixin class $LivePipSourceCopyWith<$Res>  {
  factory $LivePipSourceCopyWith(LivePipSource value, $Res Function(LivePipSource) _then) = _$LivePipSourceCopyWithImpl;
@useResult
$Res call({
 String liveId, String? broadcastImage
});




}
/// @nodoc
class _$LivePipSourceCopyWithImpl<$Res>
    implements $LivePipSourceCopyWith<$Res> {
  _$LivePipSourceCopyWithImpl(this._self, this._then);

  final LivePipSource _self;
  final $Res Function(LivePipSource) _then;

/// Create a copy of LivePipSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? liveId = null,Object? broadcastImage = freezed,}) {
  return _then(_self.copyWith(
liveId: null == liveId ? _self.liveId : liveId // ignore: cast_nullable_to_non_nullable
as String,broadcastImage: freezed == broadcastImage ? _self.broadcastImage : broadcastImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LivePipSource].
extension LivePipSourcePatterns on LivePipSource {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LivePipSource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LivePipSource() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LivePipSource value)  $default,){
final _that = this;
switch (_that) {
case _LivePipSource():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LivePipSource value)?  $default,){
final _that = this;
switch (_that) {
case _LivePipSource() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String liveId,  String? broadcastImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LivePipSource() when $default != null:
return $default(_that.liveId,_that.broadcastImage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String liveId,  String? broadcastImage)  $default,) {final _that = this;
switch (_that) {
case _LivePipSource():
return $default(_that.liveId,_that.broadcastImage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String liveId,  String? broadcastImage)?  $default,) {final _that = this;
switch (_that) {
case _LivePipSource() when $default != null:
return $default(_that.liveId,_that.broadcastImage);case _:
  return null;

}
}

}

/// @nodoc


class _LivePipSource implements LivePipSource {
  const _LivePipSource({required this.liveId, this.broadcastImage});
  

@override final  String liveId;
/// 방송 화면. 데모 단계에서는 사진 에셋이고, 영상이 붙으면 스트림 URL로 바뀐다.
@override final  String? broadcastImage;

/// Create a copy of LivePipSource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LivePipSourceCopyWith<_LivePipSource> get copyWith => __$LivePipSourceCopyWithImpl<_LivePipSource>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LivePipSource&&(identical(other.liveId, liveId) || other.liveId == liveId)&&(identical(other.broadcastImage, broadcastImage) || other.broadcastImage == broadcastImage));
}


@override
int get hashCode => Object.hash(runtimeType,liveId,broadcastImage);

@override
String toString() {
  return 'LivePipSource(liveId: $liveId, broadcastImage: $broadcastImage)';
}


}

/// @nodoc
abstract mixin class _$LivePipSourceCopyWith<$Res> implements $LivePipSourceCopyWith<$Res> {
  factory _$LivePipSourceCopyWith(_LivePipSource value, $Res Function(_LivePipSource) _then) = __$LivePipSourceCopyWithImpl;
@override @useResult
$Res call({
 String liveId, String? broadcastImage
});




}
/// @nodoc
class __$LivePipSourceCopyWithImpl<$Res>
    implements _$LivePipSourceCopyWith<$Res> {
  __$LivePipSourceCopyWithImpl(this._self, this._then);

  final _LivePipSource _self;
  final $Res Function(_LivePipSource) _then;

/// Create a copy of LivePipSource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? liveId = null,Object? broadcastImage = freezed,}) {
  return _then(_LivePipSource(
liveId: null == liveId ? _self.liveId : liveId // ignore: cast_nullable_to_non_nullable
as String,broadcastImage: freezed == broadcastImage ? _self.broadcastImage : broadcastImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$LivePipState {

 LivePipSource? get source; LivePipPresentation get presentation;
/// Create a copy of LivePipState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LivePipStateCopyWith<LivePipState> get copyWith => _$LivePipStateCopyWithImpl<LivePipState>(this as LivePipState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LivePipState&&(identical(other.source, source) || other.source == source)&&(identical(other.presentation, presentation) || other.presentation == presentation));
}


@override
int get hashCode => Object.hash(runtimeType,source,presentation);

@override
String toString() {
  return 'LivePipState(source: $source, presentation: $presentation)';
}


}

/// @nodoc
abstract mixin class $LivePipStateCopyWith<$Res>  {
  factory $LivePipStateCopyWith(LivePipState value, $Res Function(LivePipState) _then) = _$LivePipStateCopyWithImpl;
@useResult
$Res call({
 LivePipSource? source, LivePipPresentation presentation
});


$LivePipSourceCopyWith<$Res>? get source;

}
/// @nodoc
class _$LivePipStateCopyWithImpl<$Res>
    implements $LivePipStateCopyWith<$Res> {
  _$LivePipStateCopyWithImpl(this._self, this._then);

  final LivePipState _self;
  final $Res Function(LivePipState) _then;

/// Create a copy of LivePipState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = freezed,Object? presentation = null,}) {
  return _then(_self.copyWith(
source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as LivePipSource?,presentation: null == presentation ? _self.presentation : presentation // ignore: cast_nullable_to_non_nullable
as LivePipPresentation,
  ));
}
/// Create a copy of LivePipState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LivePipSourceCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $LivePipSourceCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// Adds pattern-matching-related methods to [LivePipState].
extension LivePipStatePatterns on LivePipState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LivePipState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LivePipState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LivePipState value)  $default,){
final _that = this;
switch (_that) {
case _LivePipState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LivePipState value)?  $default,){
final _that = this;
switch (_that) {
case _LivePipState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LivePipSource? source,  LivePipPresentation presentation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LivePipState() when $default != null:
return $default(_that.source,_that.presentation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LivePipSource? source,  LivePipPresentation presentation)  $default,) {final _that = this;
switch (_that) {
case _LivePipState():
return $default(_that.source,_that.presentation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LivePipSource? source,  LivePipPresentation presentation)?  $default,) {final _that = this;
switch (_that) {
case _LivePipState() when $default != null:
return $default(_that.source,_that.presentation);case _:
  return null;

}
}

}

/// @nodoc


class _LivePipState implements LivePipState {
  const _LivePipState({this.source, this.presentation = LivePipPresentation.hidden});
  

@override final  LivePipSource? source;
@override@JsonKey() final  LivePipPresentation presentation;

/// Create a copy of LivePipState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LivePipStateCopyWith<_LivePipState> get copyWith => __$LivePipStateCopyWithImpl<_LivePipState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LivePipState&&(identical(other.source, source) || other.source == source)&&(identical(other.presentation, presentation) || other.presentation == presentation));
}


@override
int get hashCode => Object.hash(runtimeType,source,presentation);

@override
String toString() {
  return 'LivePipState(source: $source, presentation: $presentation)';
}


}

/// @nodoc
abstract mixin class _$LivePipStateCopyWith<$Res> implements $LivePipStateCopyWith<$Res> {
  factory _$LivePipStateCopyWith(_LivePipState value, $Res Function(_LivePipState) _then) = __$LivePipStateCopyWithImpl;
@override @useResult
$Res call({
 LivePipSource? source, LivePipPresentation presentation
});


@override $LivePipSourceCopyWith<$Res>? get source;

}
/// @nodoc
class __$LivePipStateCopyWithImpl<$Res>
    implements _$LivePipStateCopyWith<$Res> {
  __$LivePipStateCopyWithImpl(this._self, this._then);

  final _LivePipState _self;
  final $Res Function(_LivePipState) _then;

/// Create a copy of LivePipState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = freezed,Object? presentation = null,}) {
  return _then(_LivePipState(
source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as LivePipSource?,presentation: null == presentation ? _self.presentation : presentation // ignore: cast_nullable_to_non_nullable
as LivePipPresentation,
  ));
}

/// Create a copy of LivePipState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LivePipSourceCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $LivePipSourceCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}

// dart format on
