// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeFeed {

/// Livion 공식 방송 (히어로).
 LiveSummary get officialLive;/// 공식 방송 편성표. 첫 항목이 현재 방송.
 List<ScheduledLive> get schedule; List<FollowedSeller> get followedSellers; List<LiveSummary> get trendingLives; List<LiveSummary> get closingSoonLives;/// "전체 라이브" 첫 페이지.
 List<LiveSummary> get lives;/// 전체 라이브 총 개수 (섹션 제목 옆 숫자).
 int get totalLiveCount;/// 전체 라이브 필터 칩. 첫 항목이 "전체".
 List<String> get liveCategories;
/// Create a copy of HomeFeed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeFeedCopyWith<HomeFeed> get copyWith => _$HomeFeedCopyWithImpl<HomeFeed>(this as HomeFeed, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeFeed&&(identical(other.officialLive, officialLive) || other.officialLive == officialLive)&&const DeepCollectionEquality().equals(other.schedule, schedule)&&const DeepCollectionEquality().equals(other.followedSellers, followedSellers)&&const DeepCollectionEquality().equals(other.trendingLives, trendingLives)&&const DeepCollectionEquality().equals(other.closingSoonLives, closingSoonLives)&&const DeepCollectionEquality().equals(other.lives, lives)&&(identical(other.totalLiveCount, totalLiveCount) || other.totalLiveCount == totalLiveCount)&&const DeepCollectionEquality().equals(other.liveCategories, liveCategories));
}


@override
int get hashCode => Object.hash(runtimeType,officialLive,const DeepCollectionEquality().hash(schedule),const DeepCollectionEquality().hash(followedSellers),const DeepCollectionEquality().hash(trendingLives),const DeepCollectionEquality().hash(closingSoonLives),const DeepCollectionEquality().hash(lives),totalLiveCount,const DeepCollectionEquality().hash(liveCategories));

@override
String toString() {
  return 'HomeFeed(officialLive: $officialLive, schedule: $schedule, followedSellers: $followedSellers, trendingLives: $trendingLives, closingSoonLives: $closingSoonLives, lives: $lives, totalLiveCount: $totalLiveCount, liveCategories: $liveCategories)';
}


}

/// @nodoc
abstract mixin class $HomeFeedCopyWith<$Res>  {
  factory $HomeFeedCopyWith(HomeFeed value, $Res Function(HomeFeed) _then) = _$HomeFeedCopyWithImpl;
@useResult
$Res call({
 LiveSummary officialLive, List<ScheduledLive> schedule, List<FollowedSeller> followedSellers, List<LiveSummary> trendingLives, List<LiveSummary> closingSoonLives, List<LiveSummary> lives, int totalLiveCount, List<String> liveCategories
});


$LiveSummaryCopyWith<$Res> get officialLive;

}
/// @nodoc
class _$HomeFeedCopyWithImpl<$Res>
    implements $HomeFeedCopyWith<$Res> {
  _$HomeFeedCopyWithImpl(this._self, this._then);

  final HomeFeed _self;
  final $Res Function(HomeFeed) _then;

/// Create a copy of HomeFeed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? officialLive = null,Object? schedule = null,Object? followedSellers = null,Object? trendingLives = null,Object? closingSoonLives = null,Object? lives = null,Object? totalLiveCount = null,Object? liveCategories = null,}) {
  return _then(_self.copyWith(
officialLive: null == officialLive ? _self.officialLive : officialLive // ignore: cast_nullable_to_non_nullable
as LiveSummary,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as List<ScheduledLive>,followedSellers: null == followedSellers ? _self.followedSellers : followedSellers // ignore: cast_nullable_to_non_nullable
as List<FollowedSeller>,trendingLives: null == trendingLives ? _self.trendingLives : trendingLives // ignore: cast_nullable_to_non_nullable
as List<LiveSummary>,closingSoonLives: null == closingSoonLives ? _self.closingSoonLives : closingSoonLives // ignore: cast_nullable_to_non_nullable
as List<LiveSummary>,lives: null == lives ? _self.lives : lives // ignore: cast_nullable_to_non_nullable
as List<LiveSummary>,totalLiveCount: null == totalLiveCount ? _self.totalLiveCount : totalLiveCount // ignore: cast_nullable_to_non_nullable
as int,liveCategories: null == liveCategories ? _self.liveCategories : liveCategories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of HomeFeed
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveSummaryCopyWith<$Res> get officialLive {
  
  return $LiveSummaryCopyWith<$Res>(_self.officialLive, (value) {
    return _then(_self.copyWith(officialLive: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeFeed].
extension HomeFeedPatterns on HomeFeed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeFeed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeFeed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeFeed value)  $default,){
final _that = this;
switch (_that) {
case _HomeFeed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeFeed value)?  $default,){
final _that = this;
switch (_that) {
case _HomeFeed() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LiveSummary officialLive,  List<ScheduledLive> schedule,  List<FollowedSeller> followedSellers,  List<LiveSummary> trendingLives,  List<LiveSummary> closingSoonLives,  List<LiveSummary> lives,  int totalLiveCount,  List<String> liveCategories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeFeed() when $default != null:
return $default(_that.officialLive,_that.schedule,_that.followedSellers,_that.trendingLives,_that.closingSoonLives,_that.lives,_that.totalLiveCount,_that.liveCategories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LiveSummary officialLive,  List<ScheduledLive> schedule,  List<FollowedSeller> followedSellers,  List<LiveSummary> trendingLives,  List<LiveSummary> closingSoonLives,  List<LiveSummary> lives,  int totalLiveCount,  List<String> liveCategories)  $default,) {final _that = this;
switch (_that) {
case _HomeFeed():
return $default(_that.officialLive,_that.schedule,_that.followedSellers,_that.trendingLives,_that.closingSoonLives,_that.lives,_that.totalLiveCount,_that.liveCategories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LiveSummary officialLive,  List<ScheduledLive> schedule,  List<FollowedSeller> followedSellers,  List<LiveSummary> trendingLives,  List<LiveSummary> closingSoonLives,  List<LiveSummary> lives,  int totalLiveCount,  List<String> liveCategories)?  $default,) {final _that = this;
switch (_that) {
case _HomeFeed() when $default != null:
return $default(_that.officialLive,_that.schedule,_that.followedSellers,_that.trendingLives,_that.closingSoonLives,_that.lives,_that.totalLiveCount,_that.liveCategories);case _:
  return null;

}
}

}

/// @nodoc


class _HomeFeed implements HomeFeed {
  const _HomeFeed({required this.officialLive, final  List<ScheduledLive> schedule = const <ScheduledLive>[], final  List<FollowedSeller> followedSellers = const <FollowedSeller>[], final  List<LiveSummary> trendingLives = const <LiveSummary>[], final  List<LiveSummary> closingSoonLives = const <LiveSummary>[], final  List<LiveSummary> lives = const <LiveSummary>[], this.totalLiveCount = 0, final  List<String> liveCategories = const <String>['전체']}): _schedule = schedule,_followedSellers = followedSellers,_trendingLives = trendingLives,_closingSoonLives = closingSoonLives,_lives = lives,_liveCategories = liveCategories;
  

/// Livion 공식 방송 (히어로).
@override final  LiveSummary officialLive;
/// 공식 방송 편성표. 첫 항목이 현재 방송.
 final  List<ScheduledLive> _schedule;
/// 공식 방송 편성표. 첫 항목이 현재 방송.
@override@JsonKey() List<ScheduledLive> get schedule {
  if (_schedule is EqualUnmodifiableListView) return _schedule;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_schedule);
}

 final  List<FollowedSeller> _followedSellers;
@override@JsonKey() List<FollowedSeller> get followedSellers {
  if (_followedSellers is EqualUnmodifiableListView) return _followedSellers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_followedSellers);
}

 final  List<LiveSummary> _trendingLives;
@override@JsonKey() List<LiveSummary> get trendingLives {
  if (_trendingLives is EqualUnmodifiableListView) return _trendingLives;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trendingLives);
}

 final  List<LiveSummary> _closingSoonLives;
@override@JsonKey() List<LiveSummary> get closingSoonLives {
  if (_closingSoonLives is EqualUnmodifiableListView) return _closingSoonLives;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_closingSoonLives);
}

/// "전체 라이브" 첫 페이지.
 final  List<LiveSummary> _lives;
/// "전체 라이브" 첫 페이지.
@override@JsonKey() List<LiveSummary> get lives {
  if (_lives is EqualUnmodifiableListView) return _lives;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lives);
}

/// 전체 라이브 총 개수 (섹션 제목 옆 숫자).
@override@JsonKey() final  int totalLiveCount;
/// 전체 라이브 필터 칩. 첫 항목이 "전체".
 final  List<String> _liveCategories;
/// 전체 라이브 필터 칩. 첫 항목이 "전체".
@override@JsonKey() List<String> get liveCategories {
  if (_liveCategories is EqualUnmodifiableListView) return _liveCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_liveCategories);
}


/// Create a copy of HomeFeed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeFeedCopyWith<_HomeFeed> get copyWith => __$HomeFeedCopyWithImpl<_HomeFeed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeFeed&&(identical(other.officialLive, officialLive) || other.officialLive == officialLive)&&const DeepCollectionEquality().equals(other._schedule, _schedule)&&const DeepCollectionEquality().equals(other._followedSellers, _followedSellers)&&const DeepCollectionEquality().equals(other._trendingLives, _trendingLives)&&const DeepCollectionEquality().equals(other._closingSoonLives, _closingSoonLives)&&const DeepCollectionEquality().equals(other._lives, _lives)&&(identical(other.totalLiveCount, totalLiveCount) || other.totalLiveCount == totalLiveCount)&&const DeepCollectionEquality().equals(other._liveCategories, _liveCategories));
}


@override
int get hashCode => Object.hash(runtimeType,officialLive,const DeepCollectionEquality().hash(_schedule),const DeepCollectionEquality().hash(_followedSellers),const DeepCollectionEquality().hash(_trendingLives),const DeepCollectionEquality().hash(_closingSoonLives),const DeepCollectionEquality().hash(_lives),totalLiveCount,const DeepCollectionEquality().hash(_liveCategories));

@override
String toString() {
  return 'HomeFeed(officialLive: $officialLive, schedule: $schedule, followedSellers: $followedSellers, trendingLives: $trendingLives, closingSoonLives: $closingSoonLives, lives: $lives, totalLiveCount: $totalLiveCount, liveCategories: $liveCategories)';
}


}

/// @nodoc
abstract mixin class _$HomeFeedCopyWith<$Res> implements $HomeFeedCopyWith<$Res> {
  factory _$HomeFeedCopyWith(_HomeFeed value, $Res Function(_HomeFeed) _then) = __$HomeFeedCopyWithImpl;
@override @useResult
$Res call({
 LiveSummary officialLive, List<ScheduledLive> schedule, List<FollowedSeller> followedSellers, List<LiveSummary> trendingLives, List<LiveSummary> closingSoonLives, List<LiveSummary> lives, int totalLiveCount, List<String> liveCategories
});


@override $LiveSummaryCopyWith<$Res> get officialLive;

}
/// @nodoc
class __$HomeFeedCopyWithImpl<$Res>
    implements _$HomeFeedCopyWith<$Res> {
  __$HomeFeedCopyWithImpl(this._self, this._then);

  final _HomeFeed _self;
  final $Res Function(_HomeFeed) _then;

/// Create a copy of HomeFeed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? officialLive = null,Object? schedule = null,Object? followedSellers = null,Object? trendingLives = null,Object? closingSoonLives = null,Object? lives = null,Object? totalLiveCount = null,Object? liveCategories = null,}) {
  return _then(_HomeFeed(
officialLive: null == officialLive ? _self.officialLive : officialLive // ignore: cast_nullable_to_non_nullable
as LiveSummary,schedule: null == schedule ? _self._schedule : schedule // ignore: cast_nullable_to_non_nullable
as List<ScheduledLive>,followedSellers: null == followedSellers ? _self._followedSellers : followedSellers // ignore: cast_nullable_to_non_nullable
as List<FollowedSeller>,trendingLives: null == trendingLives ? _self._trendingLives : trendingLives // ignore: cast_nullable_to_non_nullable
as List<LiveSummary>,closingSoonLives: null == closingSoonLives ? _self._closingSoonLives : closingSoonLives // ignore: cast_nullable_to_non_nullable
as List<LiveSummary>,lives: null == lives ? _self._lives : lives // ignore: cast_nullable_to_non_nullable
as List<LiveSummary>,totalLiveCount: null == totalLiveCount ? _self.totalLiveCount : totalLiveCount // ignore: cast_nullable_to_non_nullable
as int,liveCategories: null == liveCategories ? _self._liveCategories : liveCategories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of HomeFeed
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveSummaryCopyWith<$Res> get officialLive {
  
  return $LiveSummaryCopyWith<$Res>(_self.officialLive, (value) {
    return _then(_self.copyWith(officialLive: value));
  });
}
}

// dart format on
