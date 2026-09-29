// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_program_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SellerProgramStats {

/// 참여 기업의 평균 낙찰가 ÷ 시작가 (예: 2.0).
 double get averageStartPriceMultiplier;/// 낙찰률 (0~100, 정수 %).
 int get winRatePercent;
/// Create a copy of SellerProgramStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerProgramStatsCopyWith<SellerProgramStats> get copyWith => _$SellerProgramStatsCopyWithImpl<SellerProgramStats>(this as SellerProgramStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerProgramStats&&(identical(other.averageStartPriceMultiplier, averageStartPriceMultiplier) || other.averageStartPriceMultiplier == averageStartPriceMultiplier)&&(identical(other.winRatePercent, winRatePercent) || other.winRatePercent == winRatePercent));
}


@override
int get hashCode => Object.hash(runtimeType,averageStartPriceMultiplier,winRatePercent);

@override
String toString() {
  return 'SellerProgramStats(averageStartPriceMultiplier: $averageStartPriceMultiplier, winRatePercent: $winRatePercent)';
}


}

/// @nodoc
abstract mixin class $SellerProgramStatsCopyWith<$Res>  {
  factory $SellerProgramStatsCopyWith(SellerProgramStats value, $Res Function(SellerProgramStats) _then) = _$SellerProgramStatsCopyWithImpl;
@useResult
$Res call({
 double averageStartPriceMultiplier, int winRatePercent
});




}
/// @nodoc
class _$SellerProgramStatsCopyWithImpl<$Res>
    implements $SellerProgramStatsCopyWith<$Res> {
  _$SellerProgramStatsCopyWithImpl(this._self, this._then);

  final SellerProgramStats _self;
  final $Res Function(SellerProgramStats) _then;

/// Create a copy of SellerProgramStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? averageStartPriceMultiplier = null,Object? winRatePercent = null,}) {
  return _then(_self.copyWith(
averageStartPriceMultiplier: null == averageStartPriceMultiplier ? _self.averageStartPriceMultiplier : averageStartPriceMultiplier // ignore: cast_nullable_to_non_nullable
as double,winRatePercent: null == winRatePercent ? _self.winRatePercent : winRatePercent // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerProgramStats].
extension SellerProgramStatsPatterns on SellerProgramStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerProgramStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerProgramStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerProgramStats value)  $default,){
final _that = this;
switch (_that) {
case _SellerProgramStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerProgramStats value)?  $default,){
final _that = this;
switch (_that) {
case _SellerProgramStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double averageStartPriceMultiplier,  int winRatePercent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerProgramStats() when $default != null:
return $default(_that.averageStartPriceMultiplier,_that.winRatePercent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double averageStartPriceMultiplier,  int winRatePercent)  $default,) {final _that = this;
switch (_that) {
case _SellerProgramStats():
return $default(_that.averageStartPriceMultiplier,_that.winRatePercent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double averageStartPriceMultiplier,  int winRatePercent)?  $default,) {final _that = this;
switch (_that) {
case _SellerProgramStats() when $default != null:
return $default(_that.averageStartPriceMultiplier,_that.winRatePercent);case _:
  return null;

}
}

}

/// @nodoc


class _SellerProgramStats implements SellerProgramStats {
  const _SellerProgramStats({required this.averageStartPriceMultiplier, required this.winRatePercent});
  

/// 참여 기업의 평균 낙찰가 ÷ 시작가 (예: 2.0).
@override final  double averageStartPriceMultiplier;
/// 낙찰률 (0~100, 정수 %).
@override final  int winRatePercent;

/// Create a copy of SellerProgramStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerProgramStatsCopyWith<_SellerProgramStats> get copyWith => __$SellerProgramStatsCopyWithImpl<_SellerProgramStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerProgramStats&&(identical(other.averageStartPriceMultiplier, averageStartPriceMultiplier) || other.averageStartPriceMultiplier == averageStartPriceMultiplier)&&(identical(other.winRatePercent, winRatePercent) || other.winRatePercent == winRatePercent));
}


@override
int get hashCode => Object.hash(runtimeType,averageStartPriceMultiplier,winRatePercent);

@override
String toString() {
  return 'SellerProgramStats(averageStartPriceMultiplier: $averageStartPriceMultiplier, winRatePercent: $winRatePercent)';
}


}

/// @nodoc
abstract mixin class _$SellerProgramStatsCopyWith<$Res> implements $SellerProgramStatsCopyWith<$Res> {
  factory _$SellerProgramStatsCopyWith(_SellerProgramStats value, $Res Function(_SellerProgramStats) _then) = __$SellerProgramStatsCopyWithImpl;
@override @useResult
$Res call({
 double averageStartPriceMultiplier, int winRatePercent
});




}
/// @nodoc
class __$SellerProgramStatsCopyWithImpl<$Res>
    implements _$SellerProgramStatsCopyWith<$Res> {
  __$SellerProgramStatsCopyWithImpl(this._self, this._then);

  final _SellerProgramStats _self;
  final $Res Function(_SellerProgramStats) _then;

/// Create a copy of SellerProgramStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? averageStartPriceMultiplier = null,Object? winRatePercent = null,}) {
  return _then(_SellerProgramStats(
averageStartPriceMultiplier: null == averageStartPriceMultiplier ? _self.averageStartPriceMultiplier : averageStartPriceMultiplier // ignore: cast_nullable_to_non_nullable
as double,winRatePercent: null == winRatePercent ? _self.winRatePercent : winRatePercent // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
