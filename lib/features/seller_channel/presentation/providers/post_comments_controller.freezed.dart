// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_comments_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostCommentsState {

 List<PostComment> get comments; bool get isSending;
/// Create a copy of PostCommentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostCommentsStateCopyWith<PostCommentsState> get copyWith => _$PostCommentsStateCopyWithImpl<PostCommentsState>(this as PostCommentsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostCommentsState&&const DeepCollectionEquality().equals(other.comments, comments)&&(identical(other.isSending, isSending) || other.isSending == isSending));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(comments),isSending);

@override
String toString() {
  return 'PostCommentsState(comments: $comments, isSending: $isSending)';
}


}

/// @nodoc
abstract mixin class $PostCommentsStateCopyWith<$Res>  {
  factory $PostCommentsStateCopyWith(PostCommentsState value, $Res Function(PostCommentsState) _then) = _$PostCommentsStateCopyWithImpl;
@useResult
$Res call({
 List<PostComment> comments, bool isSending
});




}
/// @nodoc
class _$PostCommentsStateCopyWithImpl<$Res>
    implements $PostCommentsStateCopyWith<$Res> {
  _$PostCommentsStateCopyWithImpl(this._self, this._then);

  final PostCommentsState _self;
  final $Res Function(PostCommentsState) _then;

/// Create a copy of PostCommentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comments = null,Object? isSending = null,}) {
  return _then(_self.copyWith(
comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<PostComment>,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PostCommentsState].
extension PostCommentsStatePatterns on PostCommentsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostCommentsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostCommentsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostCommentsState value)  $default,){
final _that = this;
switch (_that) {
case _PostCommentsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostCommentsState value)?  $default,){
final _that = this;
switch (_that) {
case _PostCommentsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PostComment> comments,  bool isSending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostCommentsState() when $default != null:
return $default(_that.comments,_that.isSending);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PostComment> comments,  bool isSending)  $default,) {final _that = this;
switch (_that) {
case _PostCommentsState():
return $default(_that.comments,_that.isSending);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PostComment> comments,  bool isSending)?  $default,) {final _that = this;
switch (_that) {
case _PostCommentsState() when $default != null:
return $default(_that.comments,_that.isSending);case _:
  return null;

}
}

}

/// @nodoc


class _PostCommentsState implements PostCommentsState {
  const _PostCommentsState({required final  List<PostComment> comments, this.isSending = false}): _comments = comments;
  

 final  List<PostComment> _comments;
@override List<PostComment> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}

@override@JsonKey() final  bool isSending;

/// Create a copy of PostCommentsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostCommentsStateCopyWith<_PostCommentsState> get copyWith => __$PostCommentsStateCopyWithImpl<_PostCommentsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostCommentsState&&const DeepCollectionEquality().equals(other._comments, _comments)&&(identical(other.isSending, isSending) || other.isSending == isSending));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_comments),isSending);

@override
String toString() {
  return 'PostCommentsState(comments: $comments, isSending: $isSending)';
}


}

/// @nodoc
abstract mixin class _$PostCommentsStateCopyWith<$Res> implements $PostCommentsStateCopyWith<$Res> {
  factory _$PostCommentsStateCopyWith(_PostCommentsState value, $Res Function(_PostCommentsState) _then) = __$PostCommentsStateCopyWithImpl;
@override @useResult
$Res call({
 List<PostComment> comments, bool isSending
});




}
/// @nodoc
class __$PostCommentsStateCopyWithImpl<$Res>
    implements _$PostCommentsStateCopyWith<$Res> {
  __$PostCommentsStateCopyWithImpl(this._self, this._then);

  final _PostCommentsState _self;
  final $Res Function(_PostCommentsState) _then;

/// Create a copy of PostCommentsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comments = null,Object? isSending = null,}) {
  return _then(_PostCommentsState(
comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<PostComment>,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
