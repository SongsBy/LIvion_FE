// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'followed_seller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FollowedSeller {

 String get id; String get name; String? get avatar; bool get isLive;
/// Create a copy of FollowedSeller
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowedSellerCopyWith<FollowedSeller> get copyWith => _$FollowedSellerCopyWithImpl<FollowedSeller>(this as FollowedSeller, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FollowedSeller&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.isLive, isLive) || other.isLive == isLive));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,avatar,isLive);

@override
String toString() {
  return 'FollowedSeller(id: $id, name: $name, avatar: $avatar, isLive: $isLive)';
}


}

/// @nodoc
abstract mixin class $FollowedSellerCopyWith<$Res>  {
  factory $FollowedSellerCopyWith(FollowedSeller value, $Res Function(FollowedSeller) _then) = _$FollowedSellerCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? avatar, bool isLive
});




}
/// @nodoc
class _$FollowedSellerCopyWithImpl<$Res>
    implements $FollowedSellerCopyWith<$Res> {
  _$FollowedSellerCopyWithImpl(this._self, this._then);

  final FollowedSeller _self;
  final $Res Function(FollowedSeller) _then;

/// Create a copy of FollowedSeller
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatar = freezed,Object? isLive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,isLive: null == isLive ? _self.isLive : isLive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FollowedSeller].
extension FollowedSellerPatterns on FollowedSeller {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FollowedSeller value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FollowedSeller() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FollowedSeller value)  $default,){
final _that = this;
switch (_that) {
case _FollowedSeller():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FollowedSeller value)?  $default,){
final _that = this;
switch (_that) {
case _FollowedSeller() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? avatar,  bool isLive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FollowedSeller() when $default != null:
return $default(_that.id,_that.name,_that.avatar,_that.isLive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? avatar,  bool isLive)  $default,) {final _that = this;
switch (_that) {
case _FollowedSeller():
return $default(_that.id,_that.name,_that.avatar,_that.isLive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? avatar,  bool isLive)?  $default,) {final _that = this;
switch (_that) {
case _FollowedSeller() when $default != null:
return $default(_that.id,_that.name,_that.avatar,_that.isLive);case _:
  return null;

}
}

}

/// @nodoc


class _FollowedSeller implements FollowedSeller {
  const _FollowedSeller({required this.id, required this.name, this.avatar, this.isLive = false});
  

@override final  String id;
@override final  String name;
@override final  String? avatar;
@override@JsonKey() final  bool isLive;

/// Create a copy of FollowedSeller
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowedSellerCopyWith<_FollowedSeller> get copyWith => __$FollowedSellerCopyWithImpl<_FollowedSeller>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FollowedSeller&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.isLive, isLive) || other.isLive == isLive));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,avatar,isLive);

@override
String toString() {
  return 'FollowedSeller(id: $id, name: $name, avatar: $avatar, isLive: $isLive)';
}


}

/// @nodoc
abstract mixin class _$FollowedSellerCopyWith<$Res> implements $FollowedSellerCopyWith<$Res> {
  factory _$FollowedSellerCopyWith(_FollowedSeller value, $Res Function(_FollowedSeller) _then) = __$FollowedSellerCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? avatar, bool isLive
});




}
/// @nodoc
class __$FollowedSellerCopyWithImpl<$Res>
    implements _$FollowedSellerCopyWith<$Res> {
  __$FollowedSellerCopyWithImpl(this._self, this._then);

  final _FollowedSeller _self;
  final $Res Function(_FollowedSeller) _then;

/// Create a copy of FollowedSeller
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatar = freezed,Object? isLive = null,}) {
  return _then(_FollowedSeller(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,isLive: null == isLive ? _self.isLive : isLive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
