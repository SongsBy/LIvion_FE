// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_listing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BroadcastSlot {

 BroadcastWeekday get weekday;/// 24시간제 시작 시각 (19, 20, 21).
 int get hour;
/// Create a copy of BroadcastSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadcastSlotCopyWith<BroadcastSlot> get copyWith => _$BroadcastSlotCopyWithImpl<BroadcastSlot>(this as BroadcastSlot, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastSlot&&(identical(other.weekday, weekday) || other.weekday == weekday)&&(identical(other.hour, hour) || other.hour == hour));
}


@override
int get hashCode => Object.hash(runtimeType,weekday,hour);

@override
String toString() {
  return 'BroadcastSlot(weekday: $weekday, hour: $hour)';
}


}

/// @nodoc
abstract mixin class $BroadcastSlotCopyWith<$Res>  {
  factory $BroadcastSlotCopyWith(BroadcastSlot value, $Res Function(BroadcastSlot) _then) = _$BroadcastSlotCopyWithImpl;
@useResult
$Res call({
 BroadcastWeekday weekday, int hour
});




}
/// @nodoc
class _$BroadcastSlotCopyWithImpl<$Res>
    implements $BroadcastSlotCopyWith<$Res> {
  _$BroadcastSlotCopyWithImpl(this._self, this._then);

  final BroadcastSlot _self;
  final $Res Function(BroadcastSlot) _then;

/// Create a copy of BroadcastSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weekday = null,Object? hour = null,}) {
  return _then(_self.copyWith(
weekday: null == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as BroadcastWeekday,hour: null == hour ? _self.hour : hour // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BroadcastSlot].
extension BroadcastSlotPatterns on BroadcastSlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BroadcastSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BroadcastSlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BroadcastSlot value)  $default,){
final _that = this;
switch (_that) {
case _BroadcastSlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BroadcastSlot value)?  $default,){
final _that = this;
switch (_that) {
case _BroadcastSlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BroadcastWeekday weekday,  int hour)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BroadcastSlot() when $default != null:
return $default(_that.weekday,_that.hour);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BroadcastWeekday weekday,  int hour)  $default,) {final _that = this;
switch (_that) {
case _BroadcastSlot():
return $default(_that.weekday,_that.hour);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BroadcastWeekday weekday,  int hour)?  $default,) {final _that = this;
switch (_that) {
case _BroadcastSlot() when $default != null:
return $default(_that.weekday,_that.hour);case _:
  return null;

}
}

}

/// @nodoc


class _BroadcastSlot implements BroadcastSlot {
  const _BroadcastSlot({required this.weekday, required this.hour});
  

@override final  BroadcastWeekday weekday;
/// 24시간제 시작 시각 (19, 20, 21).
@override final  int hour;

/// Create a copy of BroadcastSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BroadcastSlotCopyWith<_BroadcastSlot> get copyWith => __$BroadcastSlotCopyWithImpl<_BroadcastSlot>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BroadcastSlot&&(identical(other.weekday, weekday) || other.weekday == weekday)&&(identical(other.hour, hour) || other.hour == hour));
}


@override
int get hashCode => Object.hash(runtimeType,weekday,hour);

@override
String toString() {
  return 'BroadcastSlot(weekday: $weekday, hour: $hour)';
}


}

/// @nodoc
abstract mixin class _$BroadcastSlotCopyWith<$Res> implements $BroadcastSlotCopyWith<$Res> {
  factory _$BroadcastSlotCopyWith(_BroadcastSlot value, $Res Function(_BroadcastSlot) _then) = __$BroadcastSlotCopyWithImpl;
@override @useResult
$Res call({
 BroadcastWeekday weekday, int hour
});




}
/// @nodoc
class __$BroadcastSlotCopyWithImpl<$Res>
    implements _$BroadcastSlotCopyWith<$Res> {
  __$BroadcastSlotCopyWithImpl(this._self, this._then);

  final _BroadcastSlot _self;
  final $Res Function(_BroadcastSlot) _then;

/// Create a copy of BroadcastSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weekday = null,Object? hour = null,}) {
  return _then(_BroadcastSlot(
weekday: null == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as BroadcastWeekday,hour: null == hour ? _self.hour : hour // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$PricingGuide {

/// 권장 시작가.
 int get recommendedStartPrice;/// 유사 품목 최근 낙찰가 ÷ 시작가 평균 (2.3).
 double get similarItemMultiplier;/// 예상 정산을 계산할 기준 낙찰가.
 int get referenceWinningPrice;
/// Create a copy of PricingGuide
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PricingGuideCopyWith<PricingGuide> get copyWith => _$PricingGuideCopyWithImpl<PricingGuide>(this as PricingGuide, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PricingGuide&&(identical(other.recommendedStartPrice, recommendedStartPrice) || other.recommendedStartPrice == recommendedStartPrice)&&(identical(other.similarItemMultiplier, similarItemMultiplier) || other.similarItemMultiplier == similarItemMultiplier)&&(identical(other.referenceWinningPrice, referenceWinningPrice) || other.referenceWinningPrice == referenceWinningPrice));
}


@override
int get hashCode => Object.hash(runtimeType,recommendedStartPrice,similarItemMultiplier,referenceWinningPrice);

@override
String toString() {
  return 'PricingGuide(recommendedStartPrice: $recommendedStartPrice, similarItemMultiplier: $similarItemMultiplier, referenceWinningPrice: $referenceWinningPrice)';
}


}

/// @nodoc
abstract mixin class $PricingGuideCopyWith<$Res>  {
  factory $PricingGuideCopyWith(PricingGuide value, $Res Function(PricingGuide) _then) = _$PricingGuideCopyWithImpl;
@useResult
$Res call({
 int recommendedStartPrice, double similarItemMultiplier, int referenceWinningPrice
});




}
/// @nodoc
class _$PricingGuideCopyWithImpl<$Res>
    implements $PricingGuideCopyWith<$Res> {
  _$PricingGuideCopyWithImpl(this._self, this._then);

  final PricingGuide _self;
  final $Res Function(PricingGuide) _then;

/// Create a copy of PricingGuide
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recommendedStartPrice = null,Object? similarItemMultiplier = null,Object? referenceWinningPrice = null,}) {
  return _then(_self.copyWith(
recommendedStartPrice: null == recommendedStartPrice ? _self.recommendedStartPrice : recommendedStartPrice // ignore: cast_nullable_to_non_nullable
as int,similarItemMultiplier: null == similarItemMultiplier ? _self.similarItemMultiplier : similarItemMultiplier // ignore: cast_nullable_to_non_nullable
as double,referenceWinningPrice: null == referenceWinningPrice ? _self.referenceWinningPrice : referenceWinningPrice // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PricingGuide].
extension PricingGuidePatterns on PricingGuide {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PricingGuide value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PricingGuide() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PricingGuide value)  $default,){
final _that = this;
switch (_that) {
case _PricingGuide():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PricingGuide value)?  $default,){
final _that = this;
switch (_that) {
case _PricingGuide() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int recommendedStartPrice,  double similarItemMultiplier,  int referenceWinningPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PricingGuide() when $default != null:
return $default(_that.recommendedStartPrice,_that.similarItemMultiplier,_that.referenceWinningPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int recommendedStartPrice,  double similarItemMultiplier,  int referenceWinningPrice)  $default,) {final _that = this;
switch (_that) {
case _PricingGuide():
return $default(_that.recommendedStartPrice,_that.similarItemMultiplier,_that.referenceWinningPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int recommendedStartPrice,  double similarItemMultiplier,  int referenceWinningPrice)?  $default,) {final _that = this;
switch (_that) {
case _PricingGuide() when $default != null:
return $default(_that.recommendedStartPrice,_that.similarItemMultiplier,_that.referenceWinningPrice);case _:
  return null;

}
}

}

/// @nodoc


class _PricingGuide implements PricingGuide {
  const _PricingGuide({required this.recommendedStartPrice, required this.similarItemMultiplier, required this.referenceWinningPrice});
  

/// 권장 시작가.
@override final  int recommendedStartPrice;
/// 유사 품목 최근 낙찰가 ÷ 시작가 평균 (2.3).
@override final  double similarItemMultiplier;
/// 예상 정산을 계산할 기준 낙찰가.
@override final  int referenceWinningPrice;

/// Create a copy of PricingGuide
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PricingGuideCopyWith<_PricingGuide> get copyWith => __$PricingGuideCopyWithImpl<_PricingGuide>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PricingGuide&&(identical(other.recommendedStartPrice, recommendedStartPrice) || other.recommendedStartPrice == recommendedStartPrice)&&(identical(other.similarItemMultiplier, similarItemMultiplier) || other.similarItemMultiplier == similarItemMultiplier)&&(identical(other.referenceWinningPrice, referenceWinningPrice) || other.referenceWinningPrice == referenceWinningPrice));
}


@override
int get hashCode => Object.hash(runtimeType,recommendedStartPrice,similarItemMultiplier,referenceWinningPrice);

@override
String toString() {
  return 'PricingGuide(recommendedStartPrice: $recommendedStartPrice, similarItemMultiplier: $similarItemMultiplier, referenceWinningPrice: $referenceWinningPrice)';
}


}

/// @nodoc
abstract mixin class _$PricingGuideCopyWith<$Res> implements $PricingGuideCopyWith<$Res> {
  factory _$PricingGuideCopyWith(_PricingGuide value, $Res Function(_PricingGuide) _then) = __$PricingGuideCopyWithImpl;
@override @useResult
$Res call({
 int recommendedStartPrice, double similarItemMultiplier, int referenceWinningPrice
});




}
/// @nodoc
class __$PricingGuideCopyWithImpl<$Res>
    implements _$PricingGuideCopyWith<$Res> {
  __$PricingGuideCopyWithImpl(this._self, this._then);

  final _PricingGuide _self;
  final $Res Function(_PricingGuide) _then;

/// Create a copy of PricingGuide
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recommendedStartPrice = null,Object? similarItemMultiplier = null,Object? referenceWinningPrice = null,}) {
  return _then(_PricingGuide(
recommendedStartPrice: null == recommendedStartPrice ? _self.recommendedStartPrice : recommendedStartPrice // ignore: cast_nullable_to_non_nullable
as int,similarItemMultiplier: null == similarItemMultiplier ? _self.similarItemMultiplier : similarItemMultiplier // ignore: cast_nullable_to_non_nullable
as double,referenceWinningPrice: null == referenceWinningPrice ? _self.referenceWinningPrice : referenceWinningPrice // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$InventoryFormOptions {

/// "임박식품 > 냉동" 같은 표시용 경로.
 List<String> get categories; List<String> get brands;/// 고를 수 있는 호가 단위 (원).
 List<int> get bidIncrements;/// 편성 시작 시각 선택지 (19, 20, 21).
 List<int> get slotHours; PricingGuide get pricingGuide;
/// Create a copy of InventoryFormOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryFormOptionsCopyWith<InventoryFormOptions> get copyWith => _$InventoryFormOptionsCopyWithImpl<InventoryFormOptions>(this as InventoryFormOptions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryFormOptions&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.brands, brands)&&const DeepCollectionEquality().equals(other.bidIncrements, bidIncrements)&&const DeepCollectionEquality().equals(other.slotHours, slotHours)&&(identical(other.pricingGuide, pricingGuide) || other.pricingGuide == pricingGuide));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(brands),const DeepCollectionEquality().hash(bidIncrements),const DeepCollectionEquality().hash(slotHours),pricingGuide);

@override
String toString() {
  return 'InventoryFormOptions(categories: $categories, brands: $brands, bidIncrements: $bidIncrements, slotHours: $slotHours, pricingGuide: $pricingGuide)';
}


}

/// @nodoc
abstract mixin class $InventoryFormOptionsCopyWith<$Res>  {
  factory $InventoryFormOptionsCopyWith(InventoryFormOptions value, $Res Function(InventoryFormOptions) _then) = _$InventoryFormOptionsCopyWithImpl;
@useResult
$Res call({
 List<String> categories, List<String> brands, List<int> bidIncrements, List<int> slotHours, PricingGuide pricingGuide
});


$PricingGuideCopyWith<$Res> get pricingGuide;

}
/// @nodoc
class _$InventoryFormOptionsCopyWithImpl<$Res>
    implements $InventoryFormOptionsCopyWith<$Res> {
  _$InventoryFormOptionsCopyWithImpl(this._self, this._then);

  final InventoryFormOptions _self;
  final $Res Function(InventoryFormOptions) _then;

/// Create a copy of InventoryFormOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? brands = null,Object? bidIncrements = null,Object? slotHours = null,Object? pricingGuide = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,brands: null == brands ? _self.brands : brands // ignore: cast_nullable_to_non_nullable
as List<String>,bidIncrements: null == bidIncrements ? _self.bidIncrements : bidIncrements // ignore: cast_nullable_to_non_nullable
as List<int>,slotHours: null == slotHours ? _self.slotHours : slotHours // ignore: cast_nullable_to_non_nullable
as List<int>,pricingGuide: null == pricingGuide ? _self.pricingGuide : pricingGuide // ignore: cast_nullable_to_non_nullable
as PricingGuide,
  ));
}
/// Create a copy of InventoryFormOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PricingGuideCopyWith<$Res> get pricingGuide {
  
  return $PricingGuideCopyWith<$Res>(_self.pricingGuide, (value) {
    return _then(_self.copyWith(pricingGuide: value));
  });
}
}


/// Adds pattern-matching-related methods to [InventoryFormOptions].
extension InventoryFormOptionsPatterns on InventoryFormOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventoryFormOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventoryFormOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventoryFormOptions value)  $default,){
final _that = this;
switch (_that) {
case _InventoryFormOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventoryFormOptions value)?  $default,){
final _that = this;
switch (_that) {
case _InventoryFormOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> categories,  List<String> brands,  List<int> bidIncrements,  List<int> slotHours,  PricingGuide pricingGuide)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventoryFormOptions() when $default != null:
return $default(_that.categories,_that.brands,_that.bidIncrements,_that.slotHours,_that.pricingGuide);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> categories,  List<String> brands,  List<int> bidIncrements,  List<int> slotHours,  PricingGuide pricingGuide)  $default,) {final _that = this;
switch (_that) {
case _InventoryFormOptions():
return $default(_that.categories,_that.brands,_that.bidIncrements,_that.slotHours,_that.pricingGuide);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> categories,  List<String> brands,  List<int> bidIncrements,  List<int> slotHours,  PricingGuide pricingGuide)?  $default,) {final _that = this;
switch (_that) {
case _InventoryFormOptions() when $default != null:
return $default(_that.categories,_that.brands,_that.bidIncrements,_that.slotHours,_that.pricingGuide);case _:
  return null;

}
}

}

/// @nodoc


class _InventoryFormOptions implements InventoryFormOptions {
  const _InventoryFormOptions({required final  List<String> categories, required final  List<String> brands, required final  List<int> bidIncrements, required final  List<int> slotHours, required this.pricingGuide}): _categories = categories,_brands = brands,_bidIncrements = bidIncrements,_slotHours = slotHours;
  

/// "임박식품 > 냉동" 같은 표시용 경로.
 final  List<String> _categories;
/// "임박식품 > 냉동" 같은 표시용 경로.
@override List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<String> _brands;
@override List<String> get brands {
  if (_brands is EqualUnmodifiableListView) return _brands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_brands);
}

/// 고를 수 있는 호가 단위 (원).
 final  List<int> _bidIncrements;
/// 고를 수 있는 호가 단위 (원).
@override List<int> get bidIncrements {
  if (_bidIncrements is EqualUnmodifiableListView) return _bidIncrements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bidIncrements);
}

/// 편성 시작 시각 선택지 (19, 20, 21).
 final  List<int> _slotHours;
/// 편성 시작 시각 선택지 (19, 20, 21).
@override List<int> get slotHours {
  if (_slotHours is EqualUnmodifiableListView) return _slotHours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slotHours);
}

@override final  PricingGuide pricingGuide;

/// Create a copy of InventoryFormOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventoryFormOptionsCopyWith<_InventoryFormOptions> get copyWith => __$InventoryFormOptionsCopyWithImpl<_InventoryFormOptions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventoryFormOptions&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._brands, _brands)&&const DeepCollectionEquality().equals(other._bidIncrements, _bidIncrements)&&const DeepCollectionEquality().equals(other._slotHours, _slotHours)&&(identical(other.pricingGuide, pricingGuide) || other.pricingGuide == pricingGuide));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_brands),const DeepCollectionEquality().hash(_bidIncrements),const DeepCollectionEquality().hash(_slotHours),pricingGuide);

@override
String toString() {
  return 'InventoryFormOptions(categories: $categories, brands: $brands, bidIncrements: $bidIncrements, slotHours: $slotHours, pricingGuide: $pricingGuide)';
}


}

/// @nodoc
abstract mixin class _$InventoryFormOptionsCopyWith<$Res> implements $InventoryFormOptionsCopyWith<$Res> {
  factory _$InventoryFormOptionsCopyWith(_InventoryFormOptions value, $Res Function(_InventoryFormOptions) _then) = __$InventoryFormOptionsCopyWithImpl;
@override @useResult
$Res call({
 List<String> categories, List<String> brands, List<int> bidIncrements, List<int> slotHours, PricingGuide pricingGuide
});


@override $PricingGuideCopyWith<$Res> get pricingGuide;

}
/// @nodoc
class __$InventoryFormOptionsCopyWithImpl<$Res>
    implements _$InventoryFormOptionsCopyWith<$Res> {
  __$InventoryFormOptionsCopyWithImpl(this._self, this._then);

  final _InventoryFormOptions _self;
  final $Res Function(_InventoryFormOptions) _then;

/// Create a copy of InventoryFormOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? brands = null,Object? bidIncrements = null,Object? slotHours = null,Object? pricingGuide = null,}) {
  return _then(_InventoryFormOptions(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,brands: null == brands ? _self._brands : brands // ignore: cast_nullable_to_non_nullable
as List<String>,bidIncrements: null == bidIncrements ? _self._bidIncrements : bidIncrements // ignore: cast_nullable_to_non_nullable
as List<int>,slotHours: null == slotHours ? _self._slotHours : slotHours // ignore: cast_nullable_to_non_nullable
as List<int>,pricingGuide: null == pricingGuide ? _self.pricingGuide : pricingGuide // ignore: cast_nullable_to_non_nullable
as PricingGuide,
  ));
}

/// Create a copy of InventoryFormOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PricingGuideCopyWith<$Res> get pricingGuide {
  
  return $PricingGuideCopyWith<$Res>(_self.pricingGuide, (value) {
    return _then(_self.copyWith(pricingGuide: value));
  });
}
}

/// @nodoc
mixin _$InventoryListing {

 Map<InventoryPhotoSlot, String> get photos; String get productName; String get category; String get size; int get supplyQuantity; String? get brand; DateTime get expiryDate; StorageCondition get storage; InventoryStockType get stockType; Set<AppearanceCondition> get appearance; PackagingCondition get packaging; BroadcastChannel get channel; BroadcastSlot? get slot; int get startPrice; int get bidIncrement;/// 이 금액보다 낮으면 유찰. null이면 설정하지 않는다.
 int? get minimumWinningPrice;
/// Create a copy of InventoryListing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryListingCopyWith<InventoryListing> get copyWith => _$InventoryListingCopyWithImpl<InventoryListing>(this as InventoryListing, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryListing&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.category, category) || other.category == category)&&(identical(other.size, size) || other.size == size)&&(identical(other.supplyQuantity, supplyQuantity) || other.supplyQuantity == supplyQuantity)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.storage, storage) || other.storage == storage)&&(identical(other.stockType, stockType) || other.stockType == stockType)&&const DeepCollectionEquality().equals(other.appearance, appearance)&&(identical(other.packaging, packaging) || other.packaging == packaging)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.startPrice, startPrice) || other.startPrice == startPrice)&&(identical(other.bidIncrement, bidIncrement) || other.bidIncrement == bidIncrement)&&(identical(other.minimumWinningPrice, minimumWinningPrice) || other.minimumWinningPrice == minimumWinningPrice));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(photos),productName,category,size,supplyQuantity,brand,expiryDate,storage,stockType,const DeepCollectionEquality().hash(appearance),packaging,channel,slot,startPrice,bidIncrement,minimumWinningPrice);

@override
String toString() {
  return 'InventoryListing(photos: $photos, productName: $productName, category: $category, size: $size, supplyQuantity: $supplyQuantity, brand: $brand, expiryDate: $expiryDate, storage: $storage, stockType: $stockType, appearance: $appearance, packaging: $packaging, channel: $channel, slot: $slot, startPrice: $startPrice, bidIncrement: $bidIncrement, minimumWinningPrice: $minimumWinningPrice)';
}


}

/// @nodoc
abstract mixin class $InventoryListingCopyWith<$Res>  {
  factory $InventoryListingCopyWith(InventoryListing value, $Res Function(InventoryListing) _then) = _$InventoryListingCopyWithImpl;
@useResult
$Res call({
 Map<InventoryPhotoSlot, String> photos, String productName, String category, String size, int supplyQuantity, String? brand, DateTime expiryDate, StorageCondition storage, InventoryStockType stockType, Set<AppearanceCondition> appearance, PackagingCondition packaging, BroadcastChannel channel, BroadcastSlot? slot, int startPrice, int bidIncrement, int? minimumWinningPrice
});


$BroadcastSlotCopyWith<$Res>? get slot;

}
/// @nodoc
class _$InventoryListingCopyWithImpl<$Res>
    implements $InventoryListingCopyWith<$Res> {
  _$InventoryListingCopyWithImpl(this._self, this._then);

  final InventoryListing _self;
  final $Res Function(InventoryListing) _then;

/// Create a copy of InventoryListing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? photos = null,Object? productName = null,Object? category = null,Object? size = null,Object? supplyQuantity = null,Object? brand = freezed,Object? expiryDate = null,Object? storage = null,Object? stockType = null,Object? appearance = null,Object? packaging = null,Object? channel = null,Object? slot = freezed,Object? startPrice = null,Object? bidIncrement = null,Object? minimumWinningPrice = freezed,}) {
  return _then(_self.copyWith(
photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as Map<InventoryPhotoSlot, String>,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,supplyQuantity: null == supplyQuantity ? _self.supplyQuantity : supplyQuantity // ignore: cast_nullable_to_non_nullable
as int,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime,storage: null == storage ? _self.storage : storage // ignore: cast_nullable_to_non_nullable
as StorageCondition,stockType: null == stockType ? _self.stockType : stockType // ignore: cast_nullable_to_non_nullable
as InventoryStockType,appearance: null == appearance ? _self.appearance : appearance // ignore: cast_nullable_to_non_nullable
as Set<AppearanceCondition>,packaging: null == packaging ? _self.packaging : packaging // ignore: cast_nullable_to_non_nullable
as PackagingCondition,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as BroadcastChannel,slot: freezed == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as BroadcastSlot?,startPrice: null == startPrice ? _self.startPrice : startPrice // ignore: cast_nullable_to_non_nullable
as int,bidIncrement: null == bidIncrement ? _self.bidIncrement : bidIncrement // ignore: cast_nullable_to_non_nullable
as int,minimumWinningPrice: freezed == minimumWinningPrice ? _self.minimumWinningPrice : minimumWinningPrice // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of InventoryListing
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BroadcastSlotCopyWith<$Res>? get slot {
    if (_self.slot == null) {
    return null;
  }

  return $BroadcastSlotCopyWith<$Res>(_self.slot!, (value) {
    return _then(_self.copyWith(slot: value));
  });
}
}


/// Adds pattern-matching-related methods to [InventoryListing].
extension InventoryListingPatterns on InventoryListing {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventoryListing value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventoryListing() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventoryListing value)  $default,){
final _that = this;
switch (_that) {
case _InventoryListing():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventoryListing value)?  $default,){
final _that = this;
switch (_that) {
case _InventoryListing() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<InventoryPhotoSlot, String> photos,  String productName,  String category,  String size,  int supplyQuantity,  String? brand,  DateTime expiryDate,  StorageCondition storage,  InventoryStockType stockType,  Set<AppearanceCondition> appearance,  PackagingCondition packaging,  BroadcastChannel channel,  BroadcastSlot? slot,  int startPrice,  int bidIncrement,  int? minimumWinningPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventoryListing() when $default != null:
return $default(_that.photos,_that.productName,_that.category,_that.size,_that.supplyQuantity,_that.brand,_that.expiryDate,_that.storage,_that.stockType,_that.appearance,_that.packaging,_that.channel,_that.slot,_that.startPrice,_that.bidIncrement,_that.minimumWinningPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<InventoryPhotoSlot, String> photos,  String productName,  String category,  String size,  int supplyQuantity,  String? brand,  DateTime expiryDate,  StorageCondition storage,  InventoryStockType stockType,  Set<AppearanceCondition> appearance,  PackagingCondition packaging,  BroadcastChannel channel,  BroadcastSlot? slot,  int startPrice,  int bidIncrement,  int? minimumWinningPrice)  $default,) {final _that = this;
switch (_that) {
case _InventoryListing():
return $default(_that.photos,_that.productName,_that.category,_that.size,_that.supplyQuantity,_that.brand,_that.expiryDate,_that.storage,_that.stockType,_that.appearance,_that.packaging,_that.channel,_that.slot,_that.startPrice,_that.bidIncrement,_that.minimumWinningPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<InventoryPhotoSlot, String> photos,  String productName,  String category,  String size,  int supplyQuantity,  String? brand,  DateTime expiryDate,  StorageCondition storage,  InventoryStockType stockType,  Set<AppearanceCondition> appearance,  PackagingCondition packaging,  BroadcastChannel channel,  BroadcastSlot? slot,  int startPrice,  int bidIncrement,  int? minimumWinningPrice)?  $default,) {final _that = this;
switch (_that) {
case _InventoryListing() when $default != null:
return $default(_that.photos,_that.productName,_that.category,_that.size,_that.supplyQuantity,_that.brand,_that.expiryDate,_that.storage,_that.stockType,_that.appearance,_that.packaging,_that.channel,_that.slot,_that.startPrice,_that.bidIncrement,_that.minimumWinningPrice);case _:
  return null;

}
}

}

/// @nodoc


class _InventoryListing implements InventoryListing {
  const _InventoryListing({required final  Map<InventoryPhotoSlot, String> photos, required this.productName, required this.category, required this.size, required this.supplyQuantity, this.brand, required this.expiryDate, required this.storage, required this.stockType, required final  Set<AppearanceCondition> appearance, required this.packaging, required this.channel, this.slot, required this.startPrice, required this.bidIncrement, this.minimumWinningPrice}): _photos = photos,_appearance = appearance;
  

 final  Map<InventoryPhotoSlot, String> _photos;
@override Map<InventoryPhotoSlot, String> get photos {
  if (_photos is EqualUnmodifiableMapView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_photos);
}

@override final  String productName;
@override final  String category;
@override final  String size;
@override final  int supplyQuantity;
@override final  String? brand;
@override final  DateTime expiryDate;
@override final  StorageCondition storage;
@override final  InventoryStockType stockType;
 final  Set<AppearanceCondition> _appearance;
@override Set<AppearanceCondition> get appearance {
  if (_appearance is EqualUnmodifiableSetView) return _appearance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_appearance);
}

@override final  PackagingCondition packaging;
@override final  BroadcastChannel channel;
@override final  BroadcastSlot? slot;
@override final  int startPrice;
@override final  int bidIncrement;
/// 이 금액보다 낮으면 유찰. null이면 설정하지 않는다.
@override final  int? minimumWinningPrice;

/// Create a copy of InventoryListing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventoryListingCopyWith<_InventoryListing> get copyWith => __$InventoryListingCopyWithImpl<_InventoryListing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventoryListing&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.category, category) || other.category == category)&&(identical(other.size, size) || other.size == size)&&(identical(other.supplyQuantity, supplyQuantity) || other.supplyQuantity == supplyQuantity)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.storage, storage) || other.storage == storage)&&(identical(other.stockType, stockType) || other.stockType == stockType)&&const DeepCollectionEquality().equals(other._appearance, _appearance)&&(identical(other.packaging, packaging) || other.packaging == packaging)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.startPrice, startPrice) || other.startPrice == startPrice)&&(identical(other.bidIncrement, bidIncrement) || other.bidIncrement == bidIncrement)&&(identical(other.minimumWinningPrice, minimumWinningPrice) || other.minimumWinningPrice == minimumWinningPrice));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_photos),productName,category,size,supplyQuantity,brand,expiryDate,storage,stockType,const DeepCollectionEquality().hash(_appearance),packaging,channel,slot,startPrice,bidIncrement,minimumWinningPrice);

@override
String toString() {
  return 'InventoryListing(photos: $photos, productName: $productName, category: $category, size: $size, supplyQuantity: $supplyQuantity, brand: $brand, expiryDate: $expiryDate, storage: $storage, stockType: $stockType, appearance: $appearance, packaging: $packaging, channel: $channel, slot: $slot, startPrice: $startPrice, bidIncrement: $bidIncrement, minimumWinningPrice: $minimumWinningPrice)';
}


}

/// @nodoc
abstract mixin class _$InventoryListingCopyWith<$Res> implements $InventoryListingCopyWith<$Res> {
  factory _$InventoryListingCopyWith(_InventoryListing value, $Res Function(_InventoryListing) _then) = __$InventoryListingCopyWithImpl;
@override @useResult
$Res call({
 Map<InventoryPhotoSlot, String> photos, String productName, String category, String size, int supplyQuantity, String? brand, DateTime expiryDate, StorageCondition storage, InventoryStockType stockType, Set<AppearanceCondition> appearance, PackagingCondition packaging, BroadcastChannel channel, BroadcastSlot? slot, int startPrice, int bidIncrement, int? minimumWinningPrice
});


@override $BroadcastSlotCopyWith<$Res>? get slot;

}
/// @nodoc
class __$InventoryListingCopyWithImpl<$Res>
    implements _$InventoryListingCopyWith<$Res> {
  __$InventoryListingCopyWithImpl(this._self, this._then);

  final _InventoryListing _self;
  final $Res Function(_InventoryListing) _then;

/// Create a copy of InventoryListing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? photos = null,Object? productName = null,Object? category = null,Object? size = null,Object? supplyQuantity = null,Object? brand = freezed,Object? expiryDate = null,Object? storage = null,Object? stockType = null,Object? appearance = null,Object? packaging = null,Object? channel = null,Object? slot = freezed,Object? startPrice = null,Object? bidIncrement = null,Object? minimumWinningPrice = freezed,}) {
  return _then(_InventoryListing(
photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as Map<InventoryPhotoSlot, String>,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,supplyQuantity: null == supplyQuantity ? _self.supplyQuantity : supplyQuantity // ignore: cast_nullable_to_non_nullable
as int,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime,storage: null == storage ? _self.storage : storage // ignore: cast_nullable_to_non_nullable
as StorageCondition,stockType: null == stockType ? _self.stockType : stockType // ignore: cast_nullable_to_non_nullable
as InventoryStockType,appearance: null == appearance ? _self._appearance : appearance // ignore: cast_nullable_to_non_nullable
as Set<AppearanceCondition>,packaging: null == packaging ? _self.packaging : packaging // ignore: cast_nullable_to_non_nullable
as PackagingCondition,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as BroadcastChannel,slot: freezed == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as BroadcastSlot?,startPrice: null == startPrice ? _self.startPrice : startPrice // ignore: cast_nullable_to_non_nullable
as int,bidIncrement: null == bidIncrement ? _self.bidIncrement : bidIncrement // ignore: cast_nullable_to_non_nullable
as int,minimumWinningPrice: freezed == minimumWinningPrice ? _self.minimumWinningPrice : minimumWinningPrice // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of InventoryListing
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BroadcastSlotCopyWith<$Res>? get slot {
    if (_self.slot == null) {
    return null;
  }

  return $BroadcastSlotCopyWith<$Res>(_self.slot!, (value) {
    return _then(_self.copyWith(slot: value));
  });
}
}

/// @nodoc
mixin _$InventoryListingReceipt {

/// 재고 번호 ("L-260929-0001").
 String get listingId;/// 예상 검수 등급. 실제 등급은 검수 후 확정된다.
 InspectionGrade? get estimatedGrade;
/// Create a copy of InventoryListingReceipt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryListingReceiptCopyWith<InventoryListingReceipt> get copyWith => _$InventoryListingReceiptCopyWithImpl<InventoryListingReceipt>(this as InventoryListingReceipt, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryListingReceipt&&(identical(other.listingId, listingId) || other.listingId == listingId)&&(identical(other.estimatedGrade, estimatedGrade) || other.estimatedGrade == estimatedGrade));
}


@override
int get hashCode => Object.hash(runtimeType,listingId,estimatedGrade);

@override
String toString() {
  return 'InventoryListingReceipt(listingId: $listingId, estimatedGrade: $estimatedGrade)';
}


}

/// @nodoc
abstract mixin class $InventoryListingReceiptCopyWith<$Res>  {
  factory $InventoryListingReceiptCopyWith(InventoryListingReceipt value, $Res Function(InventoryListingReceipt) _then) = _$InventoryListingReceiptCopyWithImpl;
@useResult
$Res call({
 String listingId, InspectionGrade? estimatedGrade
});




}
/// @nodoc
class _$InventoryListingReceiptCopyWithImpl<$Res>
    implements $InventoryListingReceiptCopyWith<$Res> {
  _$InventoryListingReceiptCopyWithImpl(this._self, this._then);

  final InventoryListingReceipt _self;
  final $Res Function(InventoryListingReceipt) _then;

/// Create a copy of InventoryListingReceipt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? listingId = null,Object? estimatedGrade = freezed,}) {
  return _then(_self.copyWith(
listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,estimatedGrade: freezed == estimatedGrade ? _self.estimatedGrade : estimatedGrade // ignore: cast_nullable_to_non_nullable
as InspectionGrade?,
  ));
}

}


/// Adds pattern-matching-related methods to [InventoryListingReceipt].
extension InventoryListingReceiptPatterns on InventoryListingReceipt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventoryListingReceipt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventoryListingReceipt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventoryListingReceipt value)  $default,){
final _that = this;
switch (_that) {
case _InventoryListingReceipt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventoryListingReceipt value)?  $default,){
final _that = this;
switch (_that) {
case _InventoryListingReceipt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String listingId,  InspectionGrade? estimatedGrade)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventoryListingReceipt() when $default != null:
return $default(_that.listingId,_that.estimatedGrade);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String listingId,  InspectionGrade? estimatedGrade)  $default,) {final _that = this;
switch (_that) {
case _InventoryListingReceipt():
return $default(_that.listingId,_that.estimatedGrade);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String listingId,  InspectionGrade? estimatedGrade)?  $default,) {final _that = this;
switch (_that) {
case _InventoryListingReceipt() when $default != null:
return $default(_that.listingId,_that.estimatedGrade);case _:
  return null;

}
}

}

/// @nodoc


class _InventoryListingReceipt implements InventoryListingReceipt {
  const _InventoryListingReceipt({required this.listingId, this.estimatedGrade});
  

/// 재고 번호 ("L-260929-0001").
@override final  String listingId;
/// 예상 검수 등급. 실제 등급은 검수 후 확정된다.
@override final  InspectionGrade? estimatedGrade;

/// Create a copy of InventoryListingReceipt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventoryListingReceiptCopyWith<_InventoryListingReceipt> get copyWith => __$InventoryListingReceiptCopyWithImpl<_InventoryListingReceipt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventoryListingReceipt&&(identical(other.listingId, listingId) || other.listingId == listingId)&&(identical(other.estimatedGrade, estimatedGrade) || other.estimatedGrade == estimatedGrade));
}


@override
int get hashCode => Object.hash(runtimeType,listingId,estimatedGrade);

@override
String toString() {
  return 'InventoryListingReceipt(listingId: $listingId, estimatedGrade: $estimatedGrade)';
}


}

/// @nodoc
abstract mixin class _$InventoryListingReceiptCopyWith<$Res> implements $InventoryListingReceiptCopyWith<$Res> {
  factory _$InventoryListingReceiptCopyWith(_InventoryListingReceipt value, $Res Function(_InventoryListingReceipt) _then) = __$InventoryListingReceiptCopyWithImpl;
@override @useResult
$Res call({
 String listingId, InspectionGrade? estimatedGrade
});




}
/// @nodoc
class __$InventoryListingReceiptCopyWithImpl<$Res>
    implements _$InventoryListingReceiptCopyWith<$Res> {
  __$InventoryListingReceiptCopyWithImpl(this._self, this._then);

  final _InventoryListingReceipt _self;
  final $Res Function(_InventoryListingReceipt) _then;

/// Create a copy of InventoryListingReceipt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? listingId = null,Object? estimatedGrade = freezed,}) {
  return _then(_InventoryListingReceipt(
listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,estimatedGrade: freezed == estimatedGrade ? _self.estimatedGrade : estimatedGrade // ignore: cast_nullable_to_non_nullable
as InspectionGrade?,
  ));
}


}

// dart format on
