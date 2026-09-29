// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_registration_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InventoryRegistrationState {

 InventoryRegistrationStep get step;// ── 1 기본 정보 ──
 Map<InventoryPhotoSlot, String> get photos; String get productName; String? get category; String get size; String get supplyQuantity; String? get brand;// ── 2 상태·검수 ──
 DateTime? get expiryDate; StorageCondition? get storage; InventoryStockType? get stockType; Set<AppearanceCondition> get appearance; PackagingCondition? get packaging;// ── 3 방송·가격 ──
 BroadcastChannel get channel; BroadcastWeekday? get slotWeekday; int? get slotHour; String get startPrice; int? get bidIncrement; MinimumPriceMode get minimumPriceMode; String get minimumPrice;// ── 4 검토 ──
 bool get consentConfirmed;/// 신청 요청 중. 성공하면 화면이 닫힐 때까지 true로 둔다.
 bool get isSubmitting;
/// Create a copy of InventoryRegistrationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryRegistrationStateCopyWith<InventoryRegistrationState> get copyWith => _$InventoryRegistrationStateCopyWithImpl<InventoryRegistrationState>(this as InventoryRegistrationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryRegistrationState&&(identical(other.step, step) || other.step == step)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.category, category) || other.category == category)&&(identical(other.size, size) || other.size == size)&&(identical(other.supplyQuantity, supplyQuantity) || other.supplyQuantity == supplyQuantity)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.storage, storage) || other.storage == storage)&&(identical(other.stockType, stockType) || other.stockType == stockType)&&const DeepCollectionEquality().equals(other.appearance, appearance)&&(identical(other.packaging, packaging) || other.packaging == packaging)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.slotWeekday, slotWeekday) || other.slotWeekday == slotWeekday)&&(identical(other.slotHour, slotHour) || other.slotHour == slotHour)&&(identical(other.startPrice, startPrice) || other.startPrice == startPrice)&&(identical(other.bidIncrement, bidIncrement) || other.bidIncrement == bidIncrement)&&(identical(other.minimumPriceMode, minimumPriceMode) || other.minimumPriceMode == minimumPriceMode)&&(identical(other.minimumPrice, minimumPrice) || other.minimumPrice == minimumPrice)&&(identical(other.consentConfirmed, consentConfirmed) || other.consentConfirmed == consentConfirmed)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting));
}


@override
int get hashCode => Object.hashAll([runtimeType,step,const DeepCollectionEquality().hash(photos),productName,category,size,supplyQuantity,brand,expiryDate,storage,stockType,const DeepCollectionEquality().hash(appearance),packaging,channel,slotWeekday,slotHour,startPrice,bidIncrement,minimumPriceMode,minimumPrice,consentConfirmed,isSubmitting]);

@override
String toString() {
  return 'InventoryRegistrationState(step: $step, photos: $photos, productName: $productName, category: $category, size: $size, supplyQuantity: $supplyQuantity, brand: $brand, expiryDate: $expiryDate, storage: $storage, stockType: $stockType, appearance: $appearance, packaging: $packaging, channel: $channel, slotWeekday: $slotWeekday, slotHour: $slotHour, startPrice: $startPrice, bidIncrement: $bidIncrement, minimumPriceMode: $minimumPriceMode, minimumPrice: $minimumPrice, consentConfirmed: $consentConfirmed, isSubmitting: $isSubmitting)';
}


}

/// @nodoc
abstract mixin class $InventoryRegistrationStateCopyWith<$Res>  {
  factory $InventoryRegistrationStateCopyWith(InventoryRegistrationState value, $Res Function(InventoryRegistrationState) _then) = _$InventoryRegistrationStateCopyWithImpl;
@useResult
$Res call({
 InventoryRegistrationStep step, Map<InventoryPhotoSlot, String> photos, String productName, String? category, String size, String supplyQuantity, String? brand, DateTime? expiryDate, StorageCondition? storage, InventoryStockType? stockType, Set<AppearanceCondition> appearance, PackagingCondition? packaging, BroadcastChannel channel, BroadcastWeekday? slotWeekday, int? slotHour, String startPrice, int? bidIncrement, MinimumPriceMode minimumPriceMode, String minimumPrice, bool consentConfirmed, bool isSubmitting
});




}
/// @nodoc
class _$InventoryRegistrationStateCopyWithImpl<$Res>
    implements $InventoryRegistrationStateCopyWith<$Res> {
  _$InventoryRegistrationStateCopyWithImpl(this._self, this._then);

  final InventoryRegistrationState _self;
  final $Res Function(InventoryRegistrationState) _then;

/// Create a copy of InventoryRegistrationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? photos = null,Object? productName = null,Object? category = freezed,Object? size = null,Object? supplyQuantity = null,Object? brand = freezed,Object? expiryDate = freezed,Object? storage = freezed,Object? stockType = freezed,Object? appearance = null,Object? packaging = freezed,Object? channel = null,Object? slotWeekday = freezed,Object? slotHour = freezed,Object? startPrice = null,Object? bidIncrement = freezed,Object? minimumPriceMode = null,Object? minimumPrice = null,Object? consentConfirmed = null,Object? isSubmitting = null,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as InventoryRegistrationStep,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as Map<InventoryPhotoSlot, String>,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,supplyQuantity: null == supplyQuantity ? _self.supplyQuantity : supplyQuantity // ignore: cast_nullable_to_non_nullable
as String,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,storage: freezed == storage ? _self.storage : storage // ignore: cast_nullable_to_non_nullable
as StorageCondition?,stockType: freezed == stockType ? _self.stockType : stockType // ignore: cast_nullable_to_non_nullable
as InventoryStockType?,appearance: null == appearance ? _self.appearance : appearance // ignore: cast_nullable_to_non_nullable
as Set<AppearanceCondition>,packaging: freezed == packaging ? _self.packaging : packaging // ignore: cast_nullable_to_non_nullable
as PackagingCondition?,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as BroadcastChannel,slotWeekday: freezed == slotWeekday ? _self.slotWeekday : slotWeekday // ignore: cast_nullable_to_non_nullable
as BroadcastWeekday?,slotHour: freezed == slotHour ? _self.slotHour : slotHour // ignore: cast_nullable_to_non_nullable
as int?,startPrice: null == startPrice ? _self.startPrice : startPrice // ignore: cast_nullable_to_non_nullable
as String,bidIncrement: freezed == bidIncrement ? _self.bidIncrement : bidIncrement // ignore: cast_nullable_to_non_nullable
as int?,minimumPriceMode: null == minimumPriceMode ? _self.minimumPriceMode : minimumPriceMode // ignore: cast_nullable_to_non_nullable
as MinimumPriceMode,minimumPrice: null == minimumPrice ? _self.minimumPrice : minimumPrice // ignore: cast_nullable_to_non_nullable
as String,consentConfirmed: null == consentConfirmed ? _self.consentConfirmed : consentConfirmed // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [InventoryRegistrationState].
extension InventoryRegistrationStatePatterns on InventoryRegistrationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventoryRegistrationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventoryRegistrationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventoryRegistrationState value)  $default,){
final _that = this;
switch (_that) {
case _InventoryRegistrationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventoryRegistrationState value)?  $default,){
final _that = this;
switch (_that) {
case _InventoryRegistrationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InventoryRegistrationStep step,  Map<InventoryPhotoSlot, String> photos,  String productName,  String? category,  String size,  String supplyQuantity,  String? brand,  DateTime? expiryDate,  StorageCondition? storage,  InventoryStockType? stockType,  Set<AppearanceCondition> appearance,  PackagingCondition? packaging,  BroadcastChannel channel,  BroadcastWeekday? slotWeekday,  int? slotHour,  String startPrice,  int? bidIncrement,  MinimumPriceMode minimumPriceMode,  String minimumPrice,  bool consentConfirmed,  bool isSubmitting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventoryRegistrationState() when $default != null:
return $default(_that.step,_that.photos,_that.productName,_that.category,_that.size,_that.supplyQuantity,_that.brand,_that.expiryDate,_that.storage,_that.stockType,_that.appearance,_that.packaging,_that.channel,_that.slotWeekday,_that.slotHour,_that.startPrice,_that.bidIncrement,_that.minimumPriceMode,_that.minimumPrice,_that.consentConfirmed,_that.isSubmitting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InventoryRegistrationStep step,  Map<InventoryPhotoSlot, String> photos,  String productName,  String? category,  String size,  String supplyQuantity,  String? brand,  DateTime? expiryDate,  StorageCondition? storage,  InventoryStockType? stockType,  Set<AppearanceCondition> appearance,  PackagingCondition? packaging,  BroadcastChannel channel,  BroadcastWeekday? slotWeekday,  int? slotHour,  String startPrice,  int? bidIncrement,  MinimumPriceMode minimumPriceMode,  String minimumPrice,  bool consentConfirmed,  bool isSubmitting)  $default,) {final _that = this;
switch (_that) {
case _InventoryRegistrationState():
return $default(_that.step,_that.photos,_that.productName,_that.category,_that.size,_that.supplyQuantity,_that.brand,_that.expiryDate,_that.storage,_that.stockType,_that.appearance,_that.packaging,_that.channel,_that.slotWeekday,_that.slotHour,_that.startPrice,_that.bidIncrement,_that.minimumPriceMode,_that.minimumPrice,_that.consentConfirmed,_that.isSubmitting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InventoryRegistrationStep step,  Map<InventoryPhotoSlot, String> photos,  String productName,  String? category,  String size,  String supplyQuantity,  String? brand,  DateTime? expiryDate,  StorageCondition? storage,  InventoryStockType? stockType,  Set<AppearanceCondition> appearance,  PackagingCondition? packaging,  BroadcastChannel channel,  BroadcastWeekday? slotWeekday,  int? slotHour,  String startPrice,  int? bidIncrement,  MinimumPriceMode minimumPriceMode,  String minimumPrice,  bool consentConfirmed,  bool isSubmitting)?  $default,) {final _that = this;
switch (_that) {
case _InventoryRegistrationState() when $default != null:
return $default(_that.step,_that.photos,_that.productName,_that.category,_that.size,_that.supplyQuantity,_that.brand,_that.expiryDate,_that.storage,_that.stockType,_that.appearance,_that.packaging,_that.channel,_that.slotWeekday,_that.slotHour,_that.startPrice,_that.bidIncrement,_that.minimumPriceMode,_that.minimumPrice,_that.consentConfirmed,_that.isSubmitting);case _:
  return null;

}
}

}

/// @nodoc


class _InventoryRegistrationState extends InventoryRegistrationState {
  const _InventoryRegistrationState({this.step = InventoryRegistrationStep.basic, final  Map<InventoryPhotoSlot, String> photos = const <InventoryPhotoSlot, String>{}, this.productName = '', this.category, this.size = '', this.supplyQuantity = '', this.brand, this.expiryDate, this.storage, this.stockType, final  Set<AppearanceCondition> appearance = const <AppearanceCondition>{}, this.packaging, this.channel = BroadcastChannel.official, this.slotWeekday, this.slotHour, this.startPrice = '', this.bidIncrement, this.minimumPriceMode = MinimumPriceMode.none, this.minimumPrice = '', this.consentConfirmed = false, this.isSubmitting = false}): _photos = photos,_appearance = appearance,super._();
  

@override@JsonKey() final  InventoryRegistrationStep step;
// ── 1 기본 정보 ──
 final  Map<InventoryPhotoSlot, String> _photos;
// ── 1 기본 정보 ──
@override@JsonKey() Map<InventoryPhotoSlot, String> get photos {
  if (_photos is EqualUnmodifiableMapView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_photos);
}

@override@JsonKey() final  String productName;
@override final  String? category;
@override@JsonKey() final  String size;
@override@JsonKey() final  String supplyQuantity;
@override final  String? brand;
// ── 2 상태·검수 ──
@override final  DateTime? expiryDate;
@override final  StorageCondition? storage;
@override final  InventoryStockType? stockType;
 final  Set<AppearanceCondition> _appearance;
@override@JsonKey() Set<AppearanceCondition> get appearance {
  if (_appearance is EqualUnmodifiableSetView) return _appearance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_appearance);
}

@override final  PackagingCondition? packaging;
// ── 3 방송·가격 ──
@override@JsonKey() final  BroadcastChannel channel;
@override final  BroadcastWeekday? slotWeekday;
@override final  int? slotHour;
@override@JsonKey() final  String startPrice;
@override final  int? bidIncrement;
@override@JsonKey() final  MinimumPriceMode minimumPriceMode;
@override@JsonKey() final  String minimumPrice;
// ── 4 검토 ──
@override@JsonKey() final  bool consentConfirmed;
/// 신청 요청 중. 성공하면 화면이 닫힐 때까지 true로 둔다.
@override@JsonKey() final  bool isSubmitting;

/// Create a copy of InventoryRegistrationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventoryRegistrationStateCopyWith<_InventoryRegistrationState> get copyWith => __$InventoryRegistrationStateCopyWithImpl<_InventoryRegistrationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventoryRegistrationState&&(identical(other.step, step) || other.step == step)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.category, category) || other.category == category)&&(identical(other.size, size) || other.size == size)&&(identical(other.supplyQuantity, supplyQuantity) || other.supplyQuantity == supplyQuantity)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.storage, storage) || other.storage == storage)&&(identical(other.stockType, stockType) || other.stockType == stockType)&&const DeepCollectionEquality().equals(other._appearance, _appearance)&&(identical(other.packaging, packaging) || other.packaging == packaging)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.slotWeekday, slotWeekday) || other.slotWeekday == slotWeekday)&&(identical(other.slotHour, slotHour) || other.slotHour == slotHour)&&(identical(other.startPrice, startPrice) || other.startPrice == startPrice)&&(identical(other.bidIncrement, bidIncrement) || other.bidIncrement == bidIncrement)&&(identical(other.minimumPriceMode, minimumPriceMode) || other.minimumPriceMode == minimumPriceMode)&&(identical(other.minimumPrice, minimumPrice) || other.minimumPrice == minimumPrice)&&(identical(other.consentConfirmed, consentConfirmed) || other.consentConfirmed == consentConfirmed)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting));
}


@override
int get hashCode => Object.hashAll([runtimeType,step,const DeepCollectionEquality().hash(_photos),productName,category,size,supplyQuantity,brand,expiryDate,storage,stockType,const DeepCollectionEquality().hash(_appearance),packaging,channel,slotWeekday,slotHour,startPrice,bidIncrement,minimumPriceMode,minimumPrice,consentConfirmed,isSubmitting]);

@override
String toString() {
  return 'InventoryRegistrationState(step: $step, photos: $photos, productName: $productName, category: $category, size: $size, supplyQuantity: $supplyQuantity, brand: $brand, expiryDate: $expiryDate, storage: $storage, stockType: $stockType, appearance: $appearance, packaging: $packaging, channel: $channel, slotWeekday: $slotWeekday, slotHour: $slotHour, startPrice: $startPrice, bidIncrement: $bidIncrement, minimumPriceMode: $minimumPriceMode, minimumPrice: $minimumPrice, consentConfirmed: $consentConfirmed, isSubmitting: $isSubmitting)';
}


}

/// @nodoc
abstract mixin class _$InventoryRegistrationStateCopyWith<$Res> implements $InventoryRegistrationStateCopyWith<$Res> {
  factory _$InventoryRegistrationStateCopyWith(_InventoryRegistrationState value, $Res Function(_InventoryRegistrationState) _then) = __$InventoryRegistrationStateCopyWithImpl;
@override @useResult
$Res call({
 InventoryRegistrationStep step, Map<InventoryPhotoSlot, String> photos, String productName, String? category, String size, String supplyQuantity, String? brand, DateTime? expiryDate, StorageCondition? storage, InventoryStockType? stockType, Set<AppearanceCondition> appearance, PackagingCondition? packaging, BroadcastChannel channel, BroadcastWeekday? slotWeekday, int? slotHour, String startPrice, int? bidIncrement, MinimumPriceMode minimumPriceMode, String minimumPrice, bool consentConfirmed, bool isSubmitting
});




}
/// @nodoc
class __$InventoryRegistrationStateCopyWithImpl<$Res>
    implements _$InventoryRegistrationStateCopyWith<$Res> {
  __$InventoryRegistrationStateCopyWithImpl(this._self, this._then);

  final _InventoryRegistrationState _self;
  final $Res Function(_InventoryRegistrationState) _then;

/// Create a copy of InventoryRegistrationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? photos = null,Object? productName = null,Object? category = freezed,Object? size = null,Object? supplyQuantity = null,Object? brand = freezed,Object? expiryDate = freezed,Object? storage = freezed,Object? stockType = freezed,Object? appearance = null,Object? packaging = freezed,Object? channel = null,Object? slotWeekday = freezed,Object? slotHour = freezed,Object? startPrice = null,Object? bidIncrement = freezed,Object? minimumPriceMode = null,Object? minimumPrice = null,Object? consentConfirmed = null,Object? isSubmitting = null,}) {
  return _then(_InventoryRegistrationState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as InventoryRegistrationStep,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as Map<InventoryPhotoSlot, String>,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,supplyQuantity: null == supplyQuantity ? _self.supplyQuantity : supplyQuantity // ignore: cast_nullable_to_non_nullable
as String,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,storage: freezed == storage ? _self.storage : storage // ignore: cast_nullable_to_non_nullable
as StorageCondition?,stockType: freezed == stockType ? _self.stockType : stockType // ignore: cast_nullable_to_non_nullable
as InventoryStockType?,appearance: null == appearance ? _self._appearance : appearance // ignore: cast_nullable_to_non_nullable
as Set<AppearanceCondition>,packaging: freezed == packaging ? _self.packaging : packaging // ignore: cast_nullable_to_non_nullable
as PackagingCondition?,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as BroadcastChannel,slotWeekday: freezed == slotWeekday ? _self.slotWeekday : slotWeekday // ignore: cast_nullable_to_non_nullable
as BroadcastWeekday?,slotHour: freezed == slotHour ? _self.slotHour : slotHour // ignore: cast_nullable_to_non_nullable
as int?,startPrice: null == startPrice ? _self.startPrice : startPrice // ignore: cast_nullable_to_non_nullable
as String,bidIncrement: freezed == bidIncrement ? _self.bidIncrement : bidIncrement // ignore: cast_nullable_to_non_nullable
as int?,minimumPriceMode: null == minimumPriceMode ? _self.minimumPriceMode : minimumPriceMode // ignore: cast_nullable_to_non_nullable
as MinimumPriceMode,minimumPrice: null == minimumPrice ? _self.minimumPrice : minimumPrice // ignore: cast_nullable_to_non_nullable
as String,consentConfirmed: null == consentConfirmed ? _self.consentConfirmed : consentConfirmed // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
