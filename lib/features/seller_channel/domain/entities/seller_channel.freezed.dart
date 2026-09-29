// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SellerChannel {

 String get id; String get name;/// 에셋 경로 또는 URL.
 String? get avatar; String? get cover; String get intro; int get followerCount; bool get isFollowing;/// 지금 방송 중인 라이브. 없으면 null.
 SellerLiveNow? get liveNow; List<SellerPost> get posts; List<LiveSummary> get lives;/// 배송·반품·교환·A/S 안내.
 List<SellerNotice> get notices;
/// Create a copy of SellerChannel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerChannelCopyWith<SellerChannel> get copyWith => _$SellerChannelCopyWithImpl<SellerChannel>(this as SellerChannel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerChannel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.intro, intro) || other.intro == intro)&&(identical(other.followerCount, followerCount) || other.followerCount == followerCount)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&(identical(other.liveNow, liveNow) || other.liveNow == liveNow)&&const DeepCollectionEquality().equals(other.posts, posts)&&const DeepCollectionEquality().equals(other.lives, lives)&&const DeepCollectionEquality().equals(other.notices, notices));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,avatar,cover,intro,followerCount,isFollowing,liveNow,const DeepCollectionEquality().hash(posts),const DeepCollectionEquality().hash(lives),const DeepCollectionEquality().hash(notices));

@override
String toString() {
  return 'SellerChannel(id: $id, name: $name, avatar: $avatar, cover: $cover, intro: $intro, followerCount: $followerCount, isFollowing: $isFollowing, liveNow: $liveNow, posts: $posts, lives: $lives, notices: $notices)';
}


}

/// @nodoc
abstract mixin class $SellerChannelCopyWith<$Res>  {
  factory $SellerChannelCopyWith(SellerChannel value, $Res Function(SellerChannel) _then) = _$SellerChannelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? avatar, String? cover, String intro, int followerCount, bool isFollowing, SellerLiveNow? liveNow, List<SellerPost> posts, List<LiveSummary> lives, List<SellerNotice> notices
});


$SellerLiveNowCopyWith<$Res>? get liveNow;

}
/// @nodoc
class _$SellerChannelCopyWithImpl<$Res>
    implements $SellerChannelCopyWith<$Res> {
  _$SellerChannelCopyWithImpl(this._self, this._then);

  final SellerChannel _self;
  final $Res Function(SellerChannel) _then;

/// Create a copy of SellerChannel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatar = freezed,Object? cover = freezed,Object? intro = null,Object? followerCount = null,Object? isFollowing = null,Object? liveNow = freezed,Object? posts = null,Object? lives = null,Object? notices = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,followerCount: null == followerCount ? _self.followerCount : followerCount // ignore: cast_nullable_to_non_nullable
as int,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,liveNow: freezed == liveNow ? _self.liveNow : liveNow // ignore: cast_nullable_to_non_nullable
as SellerLiveNow?,posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<SellerPost>,lives: null == lives ? _self.lives : lives // ignore: cast_nullable_to_non_nullable
as List<LiveSummary>,notices: null == notices ? _self.notices : notices // ignore: cast_nullable_to_non_nullable
as List<SellerNotice>,
  ));
}
/// Create a copy of SellerChannel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerLiveNowCopyWith<$Res>? get liveNow {
    if (_self.liveNow == null) {
    return null;
  }

  return $SellerLiveNowCopyWith<$Res>(_self.liveNow!, (value) {
    return _then(_self.copyWith(liveNow: value));
  });
}
}


/// Adds pattern-matching-related methods to [SellerChannel].
extension SellerChannelPatterns on SellerChannel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerChannel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerChannel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerChannel value)  $default,){
final _that = this;
switch (_that) {
case _SellerChannel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerChannel value)?  $default,){
final _that = this;
switch (_that) {
case _SellerChannel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? avatar,  String? cover,  String intro,  int followerCount,  bool isFollowing,  SellerLiveNow? liveNow,  List<SellerPost> posts,  List<LiveSummary> lives,  List<SellerNotice> notices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerChannel() when $default != null:
return $default(_that.id,_that.name,_that.avatar,_that.cover,_that.intro,_that.followerCount,_that.isFollowing,_that.liveNow,_that.posts,_that.lives,_that.notices);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? avatar,  String? cover,  String intro,  int followerCount,  bool isFollowing,  SellerLiveNow? liveNow,  List<SellerPost> posts,  List<LiveSummary> lives,  List<SellerNotice> notices)  $default,) {final _that = this;
switch (_that) {
case _SellerChannel():
return $default(_that.id,_that.name,_that.avatar,_that.cover,_that.intro,_that.followerCount,_that.isFollowing,_that.liveNow,_that.posts,_that.lives,_that.notices);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? avatar,  String? cover,  String intro,  int followerCount,  bool isFollowing,  SellerLiveNow? liveNow,  List<SellerPost> posts,  List<LiveSummary> lives,  List<SellerNotice> notices)?  $default,) {final _that = this;
switch (_that) {
case _SellerChannel() when $default != null:
return $default(_that.id,_that.name,_that.avatar,_that.cover,_that.intro,_that.followerCount,_that.isFollowing,_that.liveNow,_that.posts,_that.lives,_that.notices);case _:
  return null;

}
}

}

/// @nodoc


class _SellerChannel implements SellerChannel {
  const _SellerChannel({required this.id, required this.name, this.avatar, this.cover, required this.intro, required this.followerCount, this.isFollowing = false, this.liveNow, final  List<SellerPost> posts = const <SellerPost>[], final  List<LiveSummary> lives = const <LiveSummary>[], final  List<SellerNotice> notices = const <SellerNotice>[]}): _posts = posts,_lives = lives,_notices = notices;
  

@override final  String id;
@override final  String name;
/// 에셋 경로 또는 URL.
@override final  String? avatar;
@override final  String? cover;
@override final  String intro;
@override final  int followerCount;
@override@JsonKey() final  bool isFollowing;
/// 지금 방송 중인 라이브. 없으면 null.
@override final  SellerLiveNow? liveNow;
 final  List<SellerPost> _posts;
@override@JsonKey() List<SellerPost> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}

 final  List<LiveSummary> _lives;
@override@JsonKey() List<LiveSummary> get lives {
  if (_lives is EqualUnmodifiableListView) return _lives;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lives);
}

/// 배송·반품·교환·A/S 안내.
 final  List<SellerNotice> _notices;
/// 배송·반품·교환·A/S 안내.
@override@JsonKey() List<SellerNotice> get notices {
  if (_notices is EqualUnmodifiableListView) return _notices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notices);
}


/// Create a copy of SellerChannel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerChannelCopyWith<_SellerChannel> get copyWith => __$SellerChannelCopyWithImpl<_SellerChannel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerChannel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.intro, intro) || other.intro == intro)&&(identical(other.followerCount, followerCount) || other.followerCount == followerCount)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&(identical(other.liveNow, liveNow) || other.liveNow == liveNow)&&const DeepCollectionEquality().equals(other._posts, _posts)&&const DeepCollectionEquality().equals(other._lives, _lives)&&const DeepCollectionEquality().equals(other._notices, _notices));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,avatar,cover,intro,followerCount,isFollowing,liveNow,const DeepCollectionEquality().hash(_posts),const DeepCollectionEquality().hash(_lives),const DeepCollectionEquality().hash(_notices));

@override
String toString() {
  return 'SellerChannel(id: $id, name: $name, avatar: $avatar, cover: $cover, intro: $intro, followerCount: $followerCount, isFollowing: $isFollowing, liveNow: $liveNow, posts: $posts, lives: $lives, notices: $notices)';
}


}

/// @nodoc
abstract mixin class _$SellerChannelCopyWith<$Res> implements $SellerChannelCopyWith<$Res> {
  factory _$SellerChannelCopyWith(_SellerChannel value, $Res Function(_SellerChannel) _then) = __$SellerChannelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? avatar, String? cover, String intro, int followerCount, bool isFollowing, SellerLiveNow? liveNow, List<SellerPost> posts, List<LiveSummary> lives, List<SellerNotice> notices
});


@override $SellerLiveNowCopyWith<$Res>? get liveNow;

}
/// @nodoc
class __$SellerChannelCopyWithImpl<$Res>
    implements _$SellerChannelCopyWith<$Res> {
  __$SellerChannelCopyWithImpl(this._self, this._then);

  final _SellerChannel _self;
  final $Res Function(_SellerChannel) _then;

/// Create a copy of SellerChannel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatar = freezed,Object? cover = freezed,Object? intro = null,Object? followerCount = null,Object? isFollowing = null,Object? liveNow = freezed,Object? posts = null,Object? lives = null,Object? notices = null,}) {
  return _then(_SellerChannel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,followerCount: null == followerCount ? _self.followerCount : followerCount // ignore: cast_nullable_to_non_nullable
as int,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,liveNow: freezed == liveNow ? _self.liveNow : liveNow // ignore: cast_nullable_to_non_nullable
as SellerLiveNow?,posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<SellerPost>,lives: null == lives ? _self._lives : lives // ignore: cast_nullable_to_non_nullable
as List<LiveSummary>,notices: null == notices ? _self._notices : notices // ignore: cast_nullable_to_non_nullable
as List<SellerNotice>,
  ));
}

/// Create a copy of SellerChannel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerLiveNowCopyWith<$Res>? get liveNow {
    if (_self.liveNow == null) {
    return null;
  }

  return $SellerLiveNowCopyWith<$Res>(_self.liveNow!, (value) {
    return _then(_self.copyWith(liveNow: value));
  });
}
}

/// @nodoc
mixin _$SellerLiveNow {

 String get liveId; int get viewerCount;/// 지금까지 들어온 입찰 수.
 int get bidCount; List<SellerLiveProduct> get products;
/// Create a copy of SellerLiveNow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerLiveNowCopyWith<SellerLiveNow> get copyWith => _$SellerLiveNowCopyWithImpl<SellerLiveNow>(this as SellerLiveNow, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerLiveNow&&(identical(other.liveId, liveId) || other.liveId == liveId)&&(identical(other.viewerCount, viewerCount) || other.viewerCount == viewerCount)&&(identical(other.bidCount, bidCount) || other.bidCount == bidCount)&&const DeepCollectionEquality().equals(other.products, products));
}


@override
int get hashCode => Object.hash(runtimeType,liveId,viewerCount,bidCount,const DeepCollectionEquality().hash(products));

@override
String toString() {
  return 'SellerLiveNow(liveId: $liveId, viewerCount: $viewerCount, bidCount: $bidCount, products: $products)';
}


}

/// @nodoc
abstract mixin class $SellerLiveNowCopyWith<$Res>  {
  factory $SellerLiveNowCopyWith(SellerLiveNow value, $Res Function(SellerLiveNow) _then) = _$SellerLiveNowCopyWithImpl;
@useResult
$Res call({
 String liveId, int viewerCount, int bidCount, List<SellerLiveProduct> products
});




}
/// @nodoc
class _$SellerLiveNowCopyWithImpl<$Res>
    implements $SellerLiveNowCopyWith<$Res> {
  _$SellerLiveNowCopyWithImpl(this._self, this._then);

  final SellerLiveNow _self;
  final $Res Function(SellerLiveNow) _then;

/// Create a copy of SellerLiveNow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? liveId = null,Object? viewerCount = null,Object? bidCount = null,Object? products = null,}) {
  return _then(_self.copyWith(
liveId: null == liveId ? _self.liveId : liveId // ignore: cast_nullable_to_non_nullable
as String,viewerCount: null == viewerCount ? _self.viewerCount : viewerCount // ignore: cast_nullable_to_non_nullable
as int,bidCount: null == bidCount ? _self.bidCount : bidCount // ignore: cast_nullable_to_non_nullable
as int,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<SellerLiveProduct>,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerLiveNow].
extension SellerLiveNowPatterns on SellerLiveNow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerLiveNow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerLiveNow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerLiveNow value)  $default,){
final _that = this;
switch (_that) {
case _SellerLiveNow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerLiveNow value)?  $default,){
final _that = this;
switch (_that) {
case _SellerLiveNow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String liveId,  int viewerCount,  int bidCount,  List<SellerLiveProduct> products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerLiveNow() when $default != null:
return $default(_that.liveId,_that.viewerCount,_that.bidCount,_that.products);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String liveId,  int viewerCount,  int bidCount,  List<SellerLiveProduct> products)  $default,) {final _that = this;
switch (_that) {
case _SellerLiveNow():
return $default(_that.liveId,_that.viewerCount,_that.bidCount,_that.products);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String liveId,  int viewerCount,  int bidCount,  List<SellerLiveProduct> products)?  $default,) {final _that = this;
switch (_that) {
case _SellerLiveNow() when $default != null:
return $default(_that.liveId,_that.viewerCount,_that.bidCount,_that.products);case _:
  return null;

}
}

}

/// @nodoc


class _SellerLiveNow implements SellerLiveNow {
  const _SellerLiveNow({required this.liveId, required this.viewerCount, required this.bidCount, required final  List<SellerLiveProduct> products}): _products = products;
  

@override final  String liveId;
@override final  int viewerCount;
/// 지금까지 들어온 입찰 수.
@override final  int bidCount;
 final  List<SellerLiveProduct> _products;
@override List<SellerLiveProduct> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of SellerLiveNow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerLiveNowCopyWith<_SellerLiveNow> get copyWith => __$SellerLiveNowCopyWithImpl<_SellerLiveNow>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerLiveNow&&(identical(other.liveId, liveId) || other.liveId == liveId)&&(identical(other.viewerCount, viewerCount) || other.viewerCount == viewerCount)&&(identical(other.bidCount, bidCount) || other.bidCount == bidCount)&&const DeepCollectionEquality().equals(other._products, _products));
}


@override
int get hashCode => Object.hash(runtimeType,liveId,viewerCount,bidCount,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'SellerLiveNow(liveId: $liveId, viewerCount: $viewerCount, bidCount: $bidCount, products: $products)';
}


}

/// @nodoc
abstract mixin class _$SellerLiveNowCopyWith<$Res> implements $SellerLiveNowCopyWith<$Res> {
  factory _$SellerLiveNowCopyWith(_SellerLiveNow value, $Res Function(_SellerLiveNow) _then) = __$SellerLiveNowCopyWithImpl;
@override @useResult
$Res call({
 String liveId, int viewerCount, int bidCount, List<SellerLiveProduct> products
});




}
/// @nodoc
class __$SellerLiveNowCopyWithImpl<$Res>
    implements _$SellerLiveNowCopyWith<$Res> {
  __$SellerLiveNowCopyWithImpl(this._self, this._then);

  final _SellerLiveNow _self;
  final $Res Function(_SellerLiveNow) _then;

/// Create a copy of SellerLiveNow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? liveId = null,Object? viewerCount = null,Object? bidCount = null,Object? products = null,}) {
  return _then(_SellerLiveNow(
liveId: null == liveId ? _self.liveId : liveId // ignore: cast_nullable_to_non_nullable
as String,viewerCount: null == viewerCount ? _self.viewerCount : viewerCount // ignore: cast_nullable_to_non_nullable
as int,bidCount: null == bidCount ? _self.bidCount : bidCount // ignore: cast_nullable_to_non_nullable
as int,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<SellerLiveProduct>,
  ));
}


}

/// @nodoc
mixin _$SellerLiveProduct {

 String get name; InspectionGrade get grade; int get quantity;/// 소비기한까지 남은 날. null이면 표시하지 않는다.
 int? get dDay; int get startPriceWon;/// 현재가.
 int get priceWon; double? get multiplier;/// 경매 마감까지 남은 초. null이면 표시하지 않는다.
 int? get remainingSeconds; String? get thumbnail;
/// Create a copy of SellerLiveProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerLiveProductCopyWith<SellerLiveProduct> get copyWith => _$SellerLiveProductCopyWithImpl<SellerLiveProduct>(this as SellerLiveProduct, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerLiveProduct&&(identical(other.name, name) || other.name == name)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.dDay, dDay) || other.dDay == dDay)&&(identical(other.startPriceWon, startPriceWon) || other.startPriceWon == startPriceWon)&&(identical(other.priceWon, priceWon) || other.priceWon == priceWon)&&(identical(other.multiplier, multiplier) || other.multiplier == multiplier)&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail));
}


@override
int get hashCode => Object.hash(runtimeType,name,grade,quantity,dDay,startPriceWon,priceWon,multiplier,remainingSeconds,thumbnail);

@override
String toString() {
  return 'SellerLiveProduct(name: $name, grade: $grade, quantity: $quantity, dDay: $dDay, startPriceWon: $startPriceWon, priceWon: $priceWon, multiplier: $multiplier, remainingSeconds: $remainingSeconds, thumbnail: $thumbnail)';
}


}

/// @nodoc
abstract mixin class $SellerLiveProductCopyWith<$Res>  {
  factory $SellerLiveProductCopyWith(SellerLiveProduct value, $Res Function(SellerLiveProduct) _then) = _$SellerLiveProductCopyWithImpl;
@useResult
$Res call({
 String name, InspectionGrade grade, int quantity, int? dDay, int startPriceWon, int priceWon, double? multiplier, int? remainingSeconds, String? thumbnail
});




}
/// @nodoc
class _$SellerLiveProductCopyWithImpl<$Res>
    implements $SellerLiveProductCopyWith<$Res> {
  _$SellerLiveProductCopyWithImpl(this._self, this._then);

  final SellerLiveProduct _self;
  final $Res Function(SellerLiveProduct) _then;

/// Create a copy of SellerLiveProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? grade = null,Object? quantity = null,Object? dDay = freezed,Object? startPriceWon = null,Object? priceWon = null,Object? multiplier = freezed,Object? remainingSeconds = freezed,Object? thumbnail = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as InspectionGrade,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,dDay: freezed == dDay ? _self.dDay : dDay // ignore: cast_nullable_to_non_nullable
as int?,startPriceWon: null == startPriceWon ? _self.startPriceWon : startPriceWon // ignore: cast_nullable_to_non_nullable
as int,priceWon: null == priceWon ? _self.priceWon : priceWon // ignore: cast_nullable_to_non_nullable
as int,multiplier: freezed == multiplier ? _self.multiplier : multiplier // ignore: cast_nullable_to_non_nullable
as double?,remainingSeconds: freezed == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerLiveProduct].
extension SellerLiveProductPatterns on SellerLiveProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerLiveProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerLiveProduct() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerLiveProduct value)  $default,){
final _that = this;
switch (_that) {
case _SellerLiveProduct():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerLiveProduct value)?  $default,){
final _that = this;
switch (_that) {
case _SellerLiveProduct() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  InspectionGrade grade,  int quantity,  int? dDay,  int startPriceWon,  int priceWon,  double? multiplier,  int? remainingSeconds,  String? thumbnail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerLiveProduct() when $default != null:
return $default(_that.name,_that.grade,_that.quantity,_that.dDay,_that.startPriceWon,_that.priceWon,_that.multiplier,_that.remainingSeconds,_that.thumbnail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  InspectionGrade grade,  int quantity,  int? dDay,  int startPriceWon,  int priceWon,  double? multiplier,  int? remainingSeconds,  String? thumbnail)  $default,) {final _that = this;
switch (_that) {
case _SellerLiveProduct():
return $default(_that.name,_that.grade,_that.quantity,_that.dDay,_that.startPriceWon,_that.priceWon,_that.multiplier,_that.remainingSeconds,_that.thumbnail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  InspectionGrade grade,  int quantity,  int? dDay,  int startPriceWon,  int priceWon,  double? multiplier,  int? remainingSeconds,  String? thumbnail)?  $default,) {final _that = this;
switch (_that) {
case _SellerLiveProduct() when $default != null:
return $default(_that.name,_that.grade,_that.quantity,_that.dDay,_that.startPriceWon,_that.priceWon,_that.multiplier,_that.remainingSeconds,_that.thumbnail);case _:
  return null;

}
}

}

/// @nodoc


class _SellerLiveProduct implements SellerLiveProduct {
  const _SellerLiveProduct({required this.name, required this.grade, required this.quantity, this.dDay, required this.startPriceWon, required this.priceWon, this.multiplier, this.remainingSeconds, this.thumbnail});
  

@override final  String name;
@override final  InspectionGrade grade;
@override final  int quantity;
/// 소비기한까지 남은 날. null이면 표시하지 않는다.
@override final  int? dDay;
@override final  int startPriceWon;
/// 현재가.
@override final  int priceWon;
@override final  double? multiplier;
/// 경매 마감까지 남은 초. null이면 표시하지 않는다.
@override final  int? remainingSeconds;
@override final  String? thumbnail;

/// Create a copy of SellerLiveProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerLiveProductCopyWith<_SellerLiveProduct> get copyWith => __$SellerLiveProductCopyWithImpl<_SellerLiveProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerLiveProduct&&(identical(other.name, name) || other.name == name)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.dDay, dDay) || other.dDay == dDay)&&(identical(other.startPriceWon, startPriceWon) || other.startPriceWon == startPriceWon)&&(identical(other.priceWon, priceWon) || other.priceWon == priceWon)&&(identical(other.multiplier, multiplier) || other.multiplier == multiplier)&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail));
}


@override
int get hashCode => Object.hash(runtimeType,name,grade,quantity,dDay,startPriceWon,priceWon,multiplier,remainingSeconds,thumbnail);

@override
String toString() {
  return 'SellerLiveProduct(name: $name, grade: $grade, quantity: $quantity, dDay: $dDay, startPriceWon: $startPriceWon, priceWon: $priceWon, multiplier: $multiplier, remainingSeconds: $remainingSeconds, thumbnail: $thumbnail)';
}


}

/// @nodoc
abstract mixin class _$SellerLiveProductCopyWith<$Res> implements $SellerLiveProductCopyWith<$Res> {
  factory _$SellerLiveProductCopyWith(_SellerLiveProduct value, $Res Function(_SellerLiveProduct) _then) = __$SellerLiveProductCopyWithImpl;
@override @useResult
$Res call({
 String name, InspectionGrade grade, int quantity, int? dDay, int startPriceWon, int priceWon, double? multiplier, int? remainingSeconds, String? thumbnail
});




}
/// @nodoc
class __$SellerLiveProductCopyWithImpl<$Res>
    implements _$SellerLiveProductCopyWith<$Res> {
  __$SellerLiveProductCopyWithImpl(this._self, this._then);

  final _SellerLiveProduct _self;
  final $Res Function(_SellerLiveProduct) _then;

/// Create a copy of SellerLiveProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? grade = null,Object? quantity = null,Object? dDay = freezed,Object? startPriceWon = null,Object? priceWon = null,Object? multiplier = freezed,Object? remainingSeconds = freezed,Object? thumbnail = freezed,}) {
  return _then(_SellerLiveProduct(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as InspectionGrade,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,dDay: freezed == dDay ? _self.dDay : dDay // ignore: cast_nullable_to_non_nullable
as int?,startPriceWon: null == startPriceWon ? _self.startPriceWon : startPriceWon // ignore: cast_nullable_to_non_nullable
as int,priceWon: null == priceWon ? _self.priceWon : priceWon // ignore: cast_nullable_to_non_nullable
as int,multiplier: freezed == multiplier ? _self.multiplier : multiplier // ignore: cast_nullable_to_non_nullable
as double?,remainingSeconds: freezed == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$SellerPost {

 String get id; String get authorName; String? get authorAvatar; DateTime get publishedAt; String? get image; String get body; int get likeCount; int get commentCount; bool get isLiked;
/// Create a copy of SellerPost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerPostCopyWith<SellerPost> get copyWith => _$SellerPostCopyWithImpl<SellerPost>(this as SellerPost, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerPost&&(identical(other.id, id) || other.id == id)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorAvatar, authorAvatar) || other.authorAvatar == authorAvatar)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.image, image) || other.image == image)&&(identical(other.body, body) || other.body == body)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked));
}


@override
int get hashCode => Object.hash(runtimeType,id,authorName,authorAvatar,publishedAt,image,body,likeCount,commentCount,isLiked);

@override
String toString() {
  return 'SellerPost(id: $id, authorName: $authorName, authorAvatar: $authorAvatar, publishedAt: $publishedAt, image: $image, body: $body, likeCount: $likeCount, commentCount: $commentCount, isLiked: $isLiked)';
}


}

/// @nodoc
abstract mixin class $SellerPostCopyWith<$Res>  {
  factory $SellerPostCopyWith(SellerPost value, $Res Function(SellerPost) _then) = _$SellerPostCopyWithImpl;
@useResult
$Res call({
 String id, String authorName, String? authorAvatar, DateTime publishedAt, String? image, String body, int likeCount, int commentCount, bool isLiked
});




}
/// @nodoc
class _$SellerPostCopyWithImpl<$Res>
    implements $SellerPostCopyWith<$Res> {
  _$SellerPostCopyWithImpl(this._self, this._then);

  final SellerPost _self;
  final $Res Function(SellerPost) _then;

/// Create a copy of SellerPost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? authorName = null,Object? authorAvatar = freezed,Object? publishedAt = null,Object? image = freezed,Object? body = null,Object? likeCount = null,Object? commentCount = null,Object? isLiked = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorAvatar: freezed == authorAvatar ? _self.authorAvatar : authorAvatar // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,commentCount: null == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerPost].
extension SellerPostPatterns on SellerPost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerPost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerPost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerPost value)  $default,){
final _that = this;
switch (_that) {
case _SellerPost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerPost value)?  $default,){
final _that = this;
switch (_that) {
case _SellerPost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String authorName,  String? authorAvatar,  DateTime publishedAt,  String? image,  String body,  int likeCount,  int commentCount,  bool isLiked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerPost() when $default != null:
return $default(_that.id,_that.authorName,_that.authorAvatar,_that.publishedAt,_that.image,_that.body,_that.likeCount,_that.commentCount,_that.isLiked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String authorName,  String? authorAvatar,  DateTime publishedAt,  String? image,  String body,  int likeCount,  int commentCount,  bool isLiked)  $default,) {final _that = this;
switch (_that) {
case _SellerPost():
return $default(_that.id,_that.authorName,_that.authorAvatar,_that.publishedAt,_that.image,_that.body,_that.likeCount,_that.commentCount,_that.isLiked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String authorName,  String? authorAvatar,  DateTime publishedAt,  String? image,  String body,  int likeCount,  int commentCount,  bool isLiked)?  $default,) {final _that = this;
switch (_that) {
case _SellerPost() when $default != null:
return $default(_that.id,_that.authorName,_that.authorAvatar,_that.publishedAt,_that.image,_that.body,_that.likeCount,_that.commentCount,_that.isLiked);case _:
  return null;

}
}

}

/// @nodoc


class _SellerPost implements SellerPost {
  const _SellerPost({required this.id, required this.authorName, this.authorAvatar, required this.publishedAt, this.image, required this.body, required this.likeCount, required this.commentCount, this.isLiked = false});
  

@override final  String id;
@override final  String authorName;
@override final  String? authorAvatar;
@override final  DateTime publishedAt;
@override final  String? image;
@override final  String body;
@override final  int likeCount;
@override final  int commentCount;
@override@JsonKey() final  bool isLiked;

/// Create a copy of SellerPost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerPostCopyWith<_SellerPost> get copyWith => __$SellerPostCopyWithImpl<_SellerPost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerPost&&(identical(other.id, id) || other.id == id)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorAvatar, authorAvatar) || other.authorAvatar == authorAvatar)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.image, image) || other.image == image)&&(identical(other.body, body) || other.body == body)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked));
}


@override
int get hashCode => Object.hash(runtimeType,id,authorName,authorAvatar,publishedAt,image,body,likeCount,commentCount,isLiked);

@override
String toString() {
  return 'SellerPost(id: $id, authorName: $authorName, authorAvatar: $authorAvatar, publishedAt: $publishedAt, image: $image, body: $body, likeCount: $likeCount, commentCount: $commentCount, isLiked: $isLiked)';
}


}

/// @nodoc
abstract mixin class _$SellerPostCopyWith<$Res> implements $SellerPostCopyWith<$Res> {
  factory _$SellerPostCopyWith(_SellerPost value, $Res Function(_SellerPost) _then) = __$SellerPostCopyWithImpl;
@override @useResult
$Res call({
 String id, String authorName, String? authorAvatar, DateTime publishedAt, String? image, String body, int likeCount, int commentCount, bool isLiked
});




}
/// @nodoc
class __$SellerPostCopyWithImpl<$Res>
    implements _$SellerPostCopyWith<$Res> {
  __$SellerPostCopyWithImpl(this._self, this._then);

  final _SellerPost _self;
  final $Res Function(_SellerPost) _then;

/// Create a copy of SellerPost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? authorName = null,Object? authorAvatar = freezed,Object? publishedAt = null,Object? image = freezed,Object? body = null,Object? likeCount = null,Object? commentCount = null,Object? isLiked = null,}) {
  return _then(_SellerPost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorAvatar: freezed == authorAvatar ? _self.authorAvatar : authorAvatar // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,commentCount: null == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$PostComment {

 String get id; String get authorName; String? get authorAvatar; DateTime get writtenAt; String get message; bool get isSeller; bool get isReply;
/// Create a copy of PostComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostCommentCopyWith<PostComment> get copyWith => _$PostCommentCopyWithImpl<PostComment>(this as PostComment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostComment&&(identical(other.id, id) || other.id == id)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorAvatar, authorAvatar) || other.authorAvatar == authorAvatar)&&(identical(other.writtenAt, writtenAt) || other.writtenAt == writtenAt)&&(identical(other.message, message) || other.message == message)&&(identical(other.isSeller, isSeller) || other.isSeller == isSeller)&&(identical(other.isReply, isReply) || other.isReply == isReply));
}


@override
int get hashCode => Object.hash(runtimeType,id,authorName,authorAvatar,writtenAt,message,isSeller,isReply);

@override
String toString() {
  return 'PostComment(id: $id, authorName: $authorName, authorAvatar: $authorAvatar, writtenAt: $writtenAt, message: $message, isSeller: $isSeller, isReply: $isReply)';
}


}

/// @nodoc
abstract mixin class $PostCommentCopyWith<$Res>  {
  factory $PostCommentCopyWith(PostComment value, $Res Function(PostComment) _then) = _$PostCommentCopyWithImpl;
@useResult
$Res call({
 String id, String authorName, String? authorAvatar, DateTime writtenAt, String message, bool isSeller, bool isReply
});




}
/// @nodoc
class _$PostCommentCopyWithImpl<$Res>
    implements $PostCommentCopyWith<$Res> {
  _$PostCommentCopyWithImpl(this._self, this._then);

  final PostComment _self;
  final $Res Function(PostComment) _then;

/// Create a copy of PostComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? authorName = null,Object? authorAvatar = freezed,Object? writtenAt = null,Object? message = null,Object? isSeller = null,Object? isReply = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorAvatar: freezed == authorAvatar ? _self.authorAvatar : authorAvatar // ignore: cast_nullable_to_non_nullable
as String?,writtenAt: null == writtenAt ? _self.writtenAt : writtenAt // ignore: cast_nullable_to_non_nullable
as DateTime,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isSeller: null == isSeller ? _self.isSeller : isSeller // ignore: cast_nullable_to_non_nullable
as bool,isReply: null == isReply ? _self.isReply : isReply // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PostComment].
extension PostCommentPatterns on PostComment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostComment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostComment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostComment value)  $default,){
final _that = this;
switch (_that) {
case _PostComment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostComment value)?  $default,){
final _that = this;
switch (_that) {
case _PostComment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String authorName,  String? authorAvatar,  DateTime writtenAt,  String message,  bool isSeller,  bool isReply)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostComment() when $default != null:
return $default(_that.id,_that.authorName,_that.authorAvatar,_that.writtenAt,_that.message,_that.isSeller,_that.isReply);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String authorName,  String? authorAvatar,  DateTime writtenAt,  String message,  bool isSeller,  bool isReply)  $default,) {final _that = this;
switch (_that) {
case _PostComment():
return $default(_that.id,_that.authorName,_that.authorAvatar,_that.writtenAt,_that.message,_that.isSeller,_that.isReply);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String authorName,  String? authorAvatar,  DateTime writtenAt,  String message,  bool isSeller,  bool isReply)?  $default,) {final _that = this;
switch (_that) {
case _PostComment() when $default != null:
return $default(_that.id,_that.authorName,_that.authorAvatar,_that.writtenAt,_that.message,_that.isSeller,_that.isReply);case _:
  return null;

}
}

}

/// @nodoc


class _PostComment implements PostComment {
  const _PostComment({required this.id, required this.authorName, this.authorAvatar, required this.writtenAt, required this.message, this.isSeller = false, this.isReply = false});
  

@override final  String id;
@override final  String authorName;
@override final  String? authorAvatar;
@override final  DateTime writtenAt;
@override final  String message;
@override@JsonKey() final  bool isSeller;
@override@JsonKey() final  bool isReply;

/// Create a copy of PostComment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostCommentCopyWith<_PostComment> get copyWith => __$PostCommentCopyWithImpl<_PostComment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostComment&&(identical(other.id, id) || other.id == id)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorAvatar, authorAvatar) || other.authorAvatar == authorAvatar)&&(identical(other.writtenAt, writtenAt) || other.writtenAt == writtenAt)&&(identical(other.message, message) || other.message == message)&&(identical(other.isSeller, isSeller) || other.isSeller == isSeller)&&(identical(other.isReply, isReply) || other.isReply == isReply));
}


@override
int get hashCode => Object.hash(runtimeType,id,authorName,authorAvatar,writtenAt,message,isSeller,isReply);

@override
String toString() {
  return 'PostComment(id: $id, authorName: $authorName, authorAvatar: $authorAvatar, writtenAt: $writtenAt, message: $message, isSeller: $isSeller, isReply: $isReply)';
}


}

/// @nodoc
abstract mixin class _$PostCommentCopyWith<$Res> implements $PostCommentCopyWith<$Res> {
  factory _$PostCommentCopyWith(_PostComment value, $Res Function(_PostComment) _then) = __$PostCommentCopyWithImpl;
@override @useResult
$Res call({
 String id, String authorName, String? authorAvatar, DateTime writtenAt, String message, bool isSeller, bool isReply
});




}
/// @nodoc
class __$PostCommentCopyWithImpl<$Res>
    implements _$PostCommentCopyWith<$Res> {
  __$PostCommentCopyWithImpl(this._self, this._then);

  final _PostComment _self;
  final $Res Function(_PostComment) _then;

/// Create a copy of PostComment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? authorName = null,Object? authorAvatar = freezed,Object? writtenAt = null,Object? message = null,Object? isSeller = null,Object? isReply = null,}) {
  return _then(_PostComment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorAvatar: freezed == authorAvatar ? _self.authorAvatar : authorAvatar // ignore: cast_nullable_to_non_nullable
as String?,writtenAt: null == writtenAt ? _self.writtenAt : writtenAt // ignore: cast_nullable_to_non_nullable
as DateTime,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isSeller: null == isSeller ? _self.isSeller : isSeller // ignore: cast_nullable_to_non_nullable
as bool,isReply: null == isReply ? _self.isReply : isReply // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SellerNotice {

 String get title; String get body;
/// Create a copy of SellerNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerNoticeCopyWith<SellerNotice> get copyWith => _$SellerNoticeCopyWithImpl<SellerNotice>(this as SellerNotice, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerNotice&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode => Object.hash(runtimeType,title,body);

@override
String toString() {
  return 'SellerNotice(title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class $SellerNoticeCopyWith<$Res>  {
  factory $SellerNoticeCopyWith(SellerNotice value, $Res Function(SellerNotice) _then) = _$SellerNoticeCopyWithImpl;
@useResult
$Res call({
 String title, String body
});




}
/// @nodoc
class _$SellerNoticeCopyWithImpl<$Res>
    implements $SellerNoticeCopyWith<$Res> {
  _$SellerNoticeCopyWithImpl(this._self, this._then);

  final SellerNotice _self;
  final $Res Function(SellerNotice) _then;

/// Create a copy of SellerNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? body = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerNotice].
extension SellerNoticePatterns on SellerNotice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerNotice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerNotice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerNotice value)  $default,){
final _that = this;
switch (_that) {
case _SellerNotice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerNotice value)?  $default,){
final _that = this;
switch (_that) {
case _SellerNotice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String body)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerNotice() when $default != null:
return $default(_that.title,_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String body)  $default,) {final _that = this;
switch (_that) {
case _SellerNotice():
return $default(_that.title,_that.body);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String body)?  $default,) {final _that = this;
switch (_that) {
case _SellerNotice() when $default != null:
return $default(_that.title,_that.body);case _:
  return null;

}
}

}

/// @nodoc


class _SellerNotice implements SellerNotice {
  const _SellerNotice({required this.title, required this.body});
  

@override final  String title;
@override final  String body;

/// Create a copy of SellerNotice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerNoticeCopyWith<_SellerNotice> get copyWith => __$SellerNoticeCopyWithImpl<_SellerNotice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerNotice&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode => Object.hash(runtimeType,title,body);

@override
String toString() {
  return 'SellerNotice(title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class _$SellerNoticeCopyWith<$Res> implements $SellerNoticeCopyWith<$Res> {
  factory _$SellerNoticeCopyWith(_SellerNotice value, $Res Function(_SellerNotice) _then) = __$SellerNoticeCopyWithImpl;
@override @useResult
$Res call({
 String title, String body
});




}
/// @nodoc
class __$SellerNoticeCopyWithImpl<$Res>
    implements _$SellerNoticeCopyWith<$Res> {
  __$SellerNoticeCopyWithImpl(this._self, this._then);

  final _SellerNotice _self;
  final $Res Function(_SellerNotice) _then;

/// Create a copy of SellerNotice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? body = null,}) {
  return _then(_SellerNotice(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
