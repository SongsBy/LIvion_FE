// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategorySeller {

 String get id; String get name; String? get avatar; bool get isLive;
/// Create a copy of CategorySeller
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategorySellerCopyWith<CategorySeller> get copyWith => _$CategorySellerCopyWithImpl<CategorySeller>(this as CategorySeller, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategorySeller&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.isLive, isLive) || other.isLive == isLive));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,avatar,isLive);

@override
String toString() {
  return 'CategorySeller(id: $id, name: $name, avatar: $avatar, isLive: $isLive)';
}


}

/// @nodoc
abstract mixin class $CategorySellerCopyWith<$Res>  {
  factory $CategorySellerCopyWith(CategorySeller value, $Res Function(CategorySeller) _then) = _$CategorySellerCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? avatar, bool isLive
});




}
/// @nodoc
class _$CategorySellerCopyWithImpl<$Res>
    implements $CategorySellerCopyWith<$Res> {
  _$CategorySellerCopyWithImpl(this._self, this._then);

  final CategorySeller _self;
  final $Res Function(CategorySeller) _then;

/// Create a copy of CategorySeller
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


/// Adds pattern-matching-related methods to [CategorySeller].
extension CategorySellerPatterns on CategorySeller {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategorySeller value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategorySeller() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategorySeller value)  $default,){
final _that = this;
switch (_that) {
case _CategorySeller():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategorySeller value)?  $default,){
final _that = this;
switch (_that) {
case _CategorySeller() when $default != null:
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
case _CategorySeller() when $default != null:
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
case _CategorySeller():
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
case _CategorySeller() when $default != null:
return $default(_that.id,_that.name,_that.avatar,_that.isLive);case _:
  return null;

}
}

}

/// @nodoc


class _CategorySeller implements CategorySeller {
  const _CategorySeller({required this.id, required this.name, this.avatar, this.isLive = false});
  

@override final  String id;
@override final  String name;
@override final  String? avatar;
@override@JsonKey() final  bool isLive;

/// Create a copy of CategorySeller
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategorySellerCopyWith<_CategorySeller> get copyWith => __$CategorySellerCopyWithImpl<_CategorySeller>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategorySeller&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.isLive, isLive) || other.isLive == isLive));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,avatar,isLive);

@override
String toString() {
  return 'CategorySeller(id: $id, name: $name, avatar: $avatar, isLive: $isLive)';
}


}

/// @nodoc
abstract mixin class _$CategorySellerCopyWith<$Res> implements $CategorySellerCopyWith<$Res> {
  factory _$CategorySellerCopyWith(_CategorySeller value, $Res Function(_CategorySeller) _then) = __$CategorySellerCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? avatar, bool isLive
});




}
/// @nodoc
class __$CategorySellerCopyWithImpl<$Res>
    implements _$CategorySellerCopyWith<$Res> {
  __$CategorySellerCopyWithImpl(this._self, this._then);

  final _CategorySeller _self;
  final $Res Function(_CategorySeller) _then;

/// Create a copy of CategorySeller
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatar = freezed,Object? isLive = null,}) {
  return _then(_CategorySeller(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,isLive: null == isLive ? _self.isLive : isLive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$CategoryFeed {

/// "BEST 라이브" 가로 목록.
 List<LiveSummary> get bestLives; List<CategorySeller> get popularSellers;/// "전체 보기" · 라이브 탭.
 List<LiveSummary> get lives;/// "전체 보기" · 예정 라이브 탭.
 List<LiveSummary> get scheduledLives;/// "전체 보기" · 지난 방송 탭.
 List<LiveSummary> get pastLives;
/// Create a copy of CategoryFeed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryFeedCopyWith<CategoryFeed> get copyWith => _$CategoryFeedCopyWithImpl<CategoryFeed>(this as CategoryFeed, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryFeed&&const DeepCollectionEquality().equals(other.bestLives, bestLives)&&const DeepCollectionEquality().equals(other.popularSellers, popularSellers)&&const DeepCollectionEquality().equals(other.lives, lives)&&const DeepCollectionEquality().equals(other.scheduledLives, scheduledLives)&&const DeepCollectionEquality().equals(other.pastLives, pastLives));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bestLives),const DeepCollectionEquality().hash(popularSellers),const DeepCollectionEquality().hash(lives),const DeepCollectionEquality().hash(scheduledLives),const DeepCollectionEquality().hash(pastLives));

@override
String toString() {
  return 'CategoryFeed(bestLives: $bestLives, popularSellers: $popularSellers, lives: $lives, scheduledLives: $scheduledLives, pastLives: $pastLives)';
}


}

/// @nodoc
abstract mixin class $CategoryFeedCopyWith<$Res>  {
  factory $CategoryFeedCopyWith(CategoryFeed value, $Res Function(CategoryFeed) _then) = _$CategoryFeedCopyWithImpl;
@useResult
$Res call({
 List<LiveSummary> bestLives, List<CategorySeller> popularSellers, List<LiveSummary> lives, List<LiveSummary> scheduledLives, List<LiveSummary> pastLives
});




}
/// @nodoc
class _$CategoryFeedCopyWithImpl<$Res>
    implements $CategoryFeedCopyWith<$Res> {
  _$CategoryFeedCopyWithImpl(this._self, this._then);

  final CategoryFeed _self;
  final $Res Function(CategoryFeed) _then;

/// Create a copy of CategoryFeed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bestLives = null,Object? popularSellers = null,Object? lives = null,Object? scheduledLives = null,Object? pastLives = null,}) {
  return _then(_self.copyWith(
bestLives: null == bestLives ? _self.bestLives : bestLives // ignore: cast_nullable_to_non_nullable
as List<LiveSummary>,popularSellers: null == popularSellers ? _self.popularSellers : popularSellers // ignore: cast_nullable_to_non_nullable
as List<CategorySeller>,lives: null == lives ? _self.lives : lives // ignore: cast_nullable_to_non_nullable
as List<LiveSummary>,scheduledLives: null == scheduledLives ? _self.scheduledLives : scheduledLives // ignore: cast_nullable_to_non_nullable
as List<LiveSummary>,pastLives: null == pastLives ? _self.pastLives : pastLives // ignore: cast_nullable_to_non_nullable
as List<LiveSummary>,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryFeed].
extension CategoryFeedPatterns on CategoryFeed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryFeed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryFeed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryFeed value)  $default,){
final _that = this;
switch (_that) {
case _CategoryFeed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryFeed value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryFeed() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LiveSummary> bestLives,  List<CategorySeller> popularSellers,  List<LiveSummary> lives,  List<LiveSummary> scheduledLives,  List<LiveSummary> pastLives)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryFeed() when $default != null:
return $default(_that.bestLives,_that.popularSellers,_that.lives,_that.scheduledLives,_that.pastLives);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LiveSummary> bestLives,  List<CategorySeller> popularSellers,  List<LiveSummary> lives,  List<LiveSummary> scheduledLives,  List<LiveSummary> pastLives)  $default,) {final _that = this;
switch (_that) {
case _CategoryFeed():
return $default(_that.bestLives,_that.popularSellers,_that.lives,_that.scheduledLives,_that.pastLives);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LiveSummary> bestLives,  List<CategorySeller> popularSellers,  List<LiveSummary> lives,  List<LiveSummary> scheduledLives,  List<LiveSummary> pastLives)?  $default,) {final _that = this;
switch (_that) {
case _CategoryFeed() when $default != null:
return $default(_that.bestLives,_that.popularSellers,_that.lives,_that.scheduledLives,_that.pastLives);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryFeed implements CategoryFeed {
  const _CategoryFeed({final  List<LiveSummary> bestLives = const <LiveSummary>[], final  List<CategorySeller> popularSellers = const <CategorySeller>[], final  List<LiveSummary> lives = const <LiveSummary>[], final  List<LiveSummary> scheduledLives = const <LiveSummary>[], final  List<LiveSummary> pastLives = const <LiveSummary>[]}): _bestLives = bestLives,_popularSellers = popularSellers,_lives = lives,_scheduledLives = scheduledLives,_pastLives = pastLives;
  

/// "BEST 라이브" 가로 목록.
 final  List<LiveSummary> _bestLives;
/// "BEST 라이브" 가로 목록.
@override@JsonKey() List<LiveSummary> get bestLives {
  if (_bestLives is EqualUnmodifiableListView) return _bestLives;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bestLives);
}

 final  List<CategorySeller> _popularSellers;
@override@JsonKey() List<CategorySeller> get popularSellers {
  if (_popularSellers is EqualUnmodifiableListView) return _popularSellers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_popularSellers);
}

/// "전체 보기" · 라이브 탭.
 final  List<LiveSummary> _lives;
/// "전체 보기" · 라이브 탭.
@override@JsonKey() List<LiveSummary> get lives {
  if (_lives is EqualUnmodifiableListView) return _lives;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lives);
}

/// "전체 보기" · 예정 라이브 탭.
 final  List<LiveSummary> _scheduledLives;
/// "전체 보기" · 예정 라이브 탭.
@override@JsonKey() List<LiveSummary> get scheduledLives {
  if (_scheduledLives is EqualUnmodifiableListView) return _scheduledLives;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scheduledLives);
}

/// "전체 보기" · 지난 방송 탭.
 final  List<LiveSummary> _pastLives;
/// "전체 보기" · 지난 방송 탭.
@override@JsonKey() List<LiveSummary> get pastLives {
  if (_pastLives is EqualUnmodifiableListView) return _pastLives;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pastLives);
}


/// Create a copy of CategoryFeed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryFeedCopyWith<_CategoryFeed> get copyWith => __$CategoryFeedCopyWithImpl<_CategoryFeed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryFeed&&const DeepCollectionEquality().equals(other._bestLives, _bestLives)&&const DeepCollectionEquality().equals(other._popularSellers, _popularSellers)&&const DeepCollectionEquality().equals(other._lives, _lives)&&const DeepCollectionEquality().equals(other._scheduledLives, _scheduledLives)&&const DeepCollectionEquality().equals(other._pastLives, _pastLives));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bestLives),const DeepCollectionEquality().hash(_popularSellers),const DeepCollectionEquality().hash(_lives),const DeepCollectionEquality().hash(_scheduledLives),const DeepCollectionEquality().hash(_pastLives));

@override
String toString() {
  return 'CategoryFeed(bestLives: $bestLives, popularSellers: $popularSellers, lives: $lives, scheduledLives: $scheduledLives, pastLives: $pastLives)';
}


}

/// @nodoc
abstract mixin class _$CategoryFeedCopyWith<$Res> implements $CategoryFeedCopyWith<$Res> {
  factory _$CategoryFeedCopyWith(_CategoryFeed value, $Res Function(_CategoryFeed) _then) = __$CategoryFeedCopyWithImpl;
@override @useResult
$Res call({
 List<LiveSummary> bestLives, List<CategorySeller> popularSellers, List<LiveSummary> lives, List<LiveSummary> scheduledLives, List<LiveSummary> pastLives
});




}
/// @nodoc
class __$CategoryFeedCopyWithImpl<$Res>
    implements _$CategoryFeedCopyWith<$Res> {
  __$CategoryFeedCopyWithImpl(this._self, this._then);

  final _CategoryFeed _self;
  final $Res Function(_CategoryFeed) _then;

/// Create a copy of CategoryFeed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bestLives = null,Object? popularSellers = null,Object? lives = null,Object? scheduledLives = null,Object? pastLives = null,}) {
  return _then(_CategoryFeed(
bestLives: null == bestLives ? _self._bestLives : bestLives // ignore: cast_nullable_to_non_nullable
as List<LiveSummary>,popularSellers: null == popularSellers ? _self._popularSellers : popularSellers // ignore: cast_nullable_to_non_nullable
as List<CategorySeller>,lives: null == lives ? _self._lives : lives // ignore: cast_nullable_to_non_nullable
as List<LiveSummary>,scheduledLives: null == scheduledLives ? _self._scheduledLives : scheduledLives // ignore: cast_nullable_to_non_nullable
as List<LiveSummary>,pastLives: null == pastLives ? _self._pastLives : pastLives // ignore: cast_nullable_to_non_nullable
as List<LiveSummary>,
  ));
}


}

// dart format on
