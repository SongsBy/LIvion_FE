// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_switch_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountSwitchState {

 AccountSession get session;/// 계정 전환·판매자 등록 요청 중.
 bool get isSubmitting;
/// Create a copy of AccountSwitchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountSwitchStateCopyWith<AccountSwitchState> get copyWith => _$AccountSwitchStateCopyWithImpl<AccountSwitchState>(this as AccountSwitchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountSwitchState&&(identical(other.session, session) || other.session == session)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting));
}


@override
int get hashCode => Object.hash(runtimeType,session,isSubmitting);

@override
String toString() {
  return 'AccountSwitchState(session: $session, isSubmitting: $isSubmitting)';
}


}

/// @nodoc
abstract mixin class $AccountSwitchStateCopyWith<$Res>  {
  factory $AccountSwitchStateCopyWith(AccountSwitchState value, $Res Function(AccountSwitchState) _then) = _$AccountSwitchStateCopyWithImpl;
@useResult
$Res call({
 AccountSession session, bool isSubmitting
});


$AccountSessionCopyWith<$Res> get session;

}
/// @nodoc
class _$AccountSwitchStateCopyWithImpl<$Res>
    implements $AccountSwitchStateCopyWith<$Res> {
  _$AccountSwitchStateCopyWithImpl(this._self, this._then);

  final AccountSwitchState _self;
  final $Res Function(AccountSwitchState) _then;

/// Create a copy of AccountSwitchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = null,Object? isSubmitting = null,}) {
  return _then(_self.copyWith(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as AccountSession,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of AccountSwitchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountSessionCopyWith<$Res> get session {
  
  return $AccountSessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [AccountSwitchState].
extension AccountSwitchStatePatterns on AccountSwitchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountSwitchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountSwitchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountSwitchState value)  $default,){
final _that = this;
switch (_that) {
case _AccountSwitchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountSwitchState value)?  $default,){
final _that = this;
switch (_that) {
case _AccountSwitchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AccountSession session,  bool isSubmitting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountSwitchState() when $default != null:
return $default(_that.session,_that.isSubmitting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AccountSession session,  bool isSubmitting)  $default,) {final _that = this;
switch (_that) {
case _AccountSwitchState():
return $default(_that.session,_that.isSubmitting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AccountSession session,  bool isSubmitting)?  $default,) {final _that = this;
switch (_that) {
case _AccountSwitchState() when $default != null:
return $default(_that.session,_that.isSubmitting);case _:
  return null;

}
}

}

/// @nodoc


class _AccountSwitchState implements AccountSwitchState {
  const _AccountSwitchState({required this.session, this.isSubmitting = false});
  

@override final  AccountSession session;
/// 계정 전환·판매자 등록 요청 중.
@override@JsonKey() final  bool isSubmitting;

/// Create a copy of AccountSwitchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountSwitchStateCopyWith<_AccountSwitchState> get copyWith => __$AccountSwitchStateCopyWithImpl<_AccountSwitchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountSwitchState&&(identical(other.session, session) || other.session == session)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting));
}


@override
int get hashCode => Object.hash(runtimeType,session,isSubmitting);

@override
String toString() {
  return 'AccountSwitchState(session: $session, isSubmitting: $isSubmitting)';
}


}

/// @nodoc
abstract mixin class _$AccountSwitchStateCopyWith<$Res> implements $AccountSwitchStateCopyWith<$Res> {
  factory _$AccountSwitchStateCopyWith(_AccountSwitchState value, $Res Function(_AccountSwitchState) _then) = __$AccountSwitchStateCopyWithImpl;
@override @useResult
$Res call({
 AccountSession session, bool isSubmitting
});


@override $AccountSessionCopyWith<$Res> get session;

}
/// @nodoc
class __$AccountSwitchStateCopyWithImpl<$Res>
    implements _$AccountSwitchStateCopyWith<$Res> {
  __$AccountSwitchStateCopyWithImpl(this._self, this._then);

  final _AccountSwitchState _self;
  final $Res Function(_AccountSwitchState) _then;

/// Create a copy of AccountSwitchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = null,Object? isSubmitting = null,}) {
  return _then(_AccountSwitchState(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as AccountSession,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AccountSwitchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountSessionCopyWith<$Res> get session {
  
  return $AccountSessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
