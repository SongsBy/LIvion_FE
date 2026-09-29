// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountProfile {

 String get id; String get name;/// 에셋 경로 또는 URL. null이면 빈 아바타 실루엣.
 String? get avatar; AccountRole get role;
/// Create a copy of AccountProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountProfileCopyWith<AccountProfile> get copyWith => _$AccountProfileCopyWithImpl<AccountProfile>(this as AccountProfile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.role, role) || other.role == role));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,avatar,role);

@override
String toString() {
  return 'AccountProfile(id: $id, name: $name, avatar: $avatar, role: $role)';
}


}

/// @nodoc
abstract mixin class $AccountProfileCopyWith<$Res>  {
  factory $AccountProfileCopyWith(AccountProfile value, $Res Function(AccountProfile) _then) = _$AccountProfileCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? avatar, AccountRole role
});




}
/// @nodoc
class _$AccountProfileCopyWithImpl<$Res>
    implements $AccountProfileCopyWith<$Res> {
  _$AccountProfileCopyWithImpl(this._self, this._then);

  final AccountProfile _self;
  final $Res Function(AccountProfile) _then;

/// Create a copy of AccountProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatar = freezed,Object? role = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AccountRole,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountProfile].
extension AccountProfilePatterns on AccountProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountProfile value)  $default,){
final _that = this;
switch (_that) {
case _AccountProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountProfile value)?  $default,){
final _that = this;
switch (_that) {
case _AccountProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? avatar,  AccountRole role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountProfile() when $default != null:
return $default(_that.id,_that.name,_that.avatar,_that.role);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? avatar,  AccountRole role)  $default,) {final _that = this;
switch (_that) {
case _AccountProfile():
return $default(_that.id,_that.name,_that.avatar,_that.role);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? avatar,  AccountRole role)?  $default,) {final _that = this;
switch (_that) {
case _AccountProfile() when $default != null:
return $default(_that.id,_that.name,_that.avatar,_that.role);case _:
  return null;

}
}

}

/// @nodoc


class _AccountProfile implements AccountProfile {
  const _AccountProfile({required this.id, required this.name, this.avatar, required this.role});
  

@override final  String id;
@override final  String name;
/// 에셋 경로 또는 URL. null이면 빈 아바타 실루엣.
@override final  String? avatar;
@override final  AccountRole role;

/// Create a copy of AccountProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountProfileCopyWith<_AccountProfile> get copyWith => __$AccountProfileCopyWithImpl<_AccountProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.role, role) || other.role == role));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,avatar,role);

@override
String toString() {
  return 'AccountProfile(id: $id, name: $name, avatar: $avatar, role: $role)';
}


}

/// @nodoc
abstract mixin class _$AccountProfileCopyWith<$Res> implements $AccountProfileCopyWith<$Res> {
  factory _$AccountProfileCopyWith(_AccountProfile value, $Res Function(_AccountProfile) _then) = __$AccountProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? avatar, AccountRole role
});




}
/// @nodoc
class __$AccountProfileCopyWithImpl<$Res>
    implements _$AccountProfileCopyWith<$Res> {
  __$AccountProfileCopyWithImpl(this._self, this._then);

  final _AccountProfile _self;
  final $Res Function(_AccountProfile) _then;

/// Create a copy of AccountProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatar = freezed,Object? role = null,}) {
  return _then(_AccountProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AccountRole,
  ));
}


}

/// @nodoc
mixin _$AccountSession {

 List<AccountProfile> get profiles; String get activeProfileId;
/// Create a copy of AccountSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountSessionCopyWith<AccountSession> get copyWith => _$AccountSessionCopyWithImpl<AccountSession>(this as AccountSession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountSession&&const DeepCollectionEquality().equals(other.profiles, profiles)&&(identical(other.activeProfileId, activeProfileId) || other.activeProfileId == activeProfileId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(profiles),activeProfileId);

@override
String toString() {
  return 'AccountSession(profiles: $profiles, activeProfileId: $activeProfileId)';
}


}

/// @nodoc
abstract mixin class $AccountSessionCopyWith<$Res>  {
  factory $AccountSessionCopyWith(AccountSession value, $Res Function(AccountSession) _then) = _$AccountSessionCopyWithImpl;
@useResult
$Res call({
 List<AccountProfile> profiles, String activeProfileId
});




}
/// @nodoc
class _$AccountSessionCopyWithImpl<$Res>
    implements $AccountSessionCopyWith<$Res> {
  _$AccountSessionCopyWithImpl(this._self, this._then);

  final AccountSession _self;
  final $Res Function(AccountSession) _then;

/// Create a copy of AccountSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profiles = null,Object? activeProfileId = null,}) {
  return _then(_self.copyWith(
profiles: null == profiles ? _self.profiles : profiles // ignore: cast_nullable_to_non_nullable
as List<AccountProfile>,activeProfileId: null == activeProfileId ? _self.activeProfileId : activeProfileId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountSession].
extension AccountSessionPatterns on AccountSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountSession value)  $default,){
final _that = this;
switch (_that) {
case _AccountSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountSession value)?  $default,){
final _that = this;
switch (_that) {
case _AccountSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AccountProfile> profiles,  String activeProfileId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountSession() when $default != null:
return $default(_that.profiles,_that.activeProfileId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AccountProfile> profiles,  String activeProfileId)  $default,) {final _that = this;
switch (_that) {
case _AccountSession():
return $default(_that.profiles,_that.activeProfileId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AccountProfile> profiles,  String activeProfileId)?  $default,) {final _that = this;
switch (_that) {
case _AccountSession() when $default != null:
return $default(_that.profiles,_that.activeProfileId);case _:
  return null;

}
}

}

/// @nodoc


class _AccountSession extends AccountSession {
  const _AccountSession({required final  List<AccountProfile> profiles, required this.activeProfileId}): _profiles = profiles,super._();
  

 final  List<AccountProfile> _profiles;
@override List<AccountProfile> get profiles {
  if (_profiles is EqualUnmodifiableListView) return _profiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_profiles);
}

@override final  String activeProfileId;

/// Create a copy of AccountSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountSessionCopyWith<_AccountSession> get copyWith => __$AccountSessionCopyWithImpl<_AccountSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountSession&&const DeepCollectionEquality().equals(other._profiles, _profiles)&&(identical(other.activeProfileId, activeProfileId) || other.activeProfileId == activeProfileId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_profiles),activeProfileId);

@override
String toString() {
  return 'AccountSession(profiles: $profiles, activeProfileId: $activeProfileId)';
}


}

/// @nodoc
abstract mixin class _$AccountSessionCopyWith<$Res> implements $AccountSessionCopyWith<$Res> {
  factory _$AccountSessionCopyWith(_AccountSession value, $Res Function(_AccountSession) _then) = __$AccountSessionCopyWithImpl;
@override @useResult
$Res call({
 List<AccountProfile> profiles, String activeProfileId
});




}
/// @nodoc
class __$AccountSessionCopyWithImpl<$Res>
    implements _$AccountSessionCopyWith<$Res> {
  __$AccountSessionCopyWithImpl(this._self, this._then);

  final _AccountSession _self;
  final $Res Function(_AccountSession) _then;

/// Create a copy of AccountSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profiles = null,Object? activeProfileId = null,}) {
  return _then(_AccountSession(
profiles: null == profiles ? _self._profiles : profiles // ignore: cast_nullable_to_non_nullable
as List<AccountProfile>,activeProfileId: null == activeProfileId ? _self.activeProfileId : activeProfileId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
