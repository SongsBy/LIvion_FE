// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderItemSummary {

 String get name; InspectionGrade get grade;/// 마감까지 남은 일수. null이면 D-day 뱃지를 숨긴다.
 int? get dDay;/// 시작가 (원, 정수).
 int get startPriceWon;/// 에셋 경로 또는 URL.
 String? get thumbnail;
/// Create a copy of OrderItemSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemSummaryCopyWith<OrderItemSummary> get copyWith => _$OrderItemSummaryCopyWithImpl<OrderItemSummary>(this as OrderItemSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemSummary&&(identical(other.name, name) || other.name == name)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.dDay, dDay) || other.dDay == dDay)&&(identical(other.startPriceWon, startPriceWon) || other.startPriceWon == startPriceWon)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail));
}


@override
int get hashCode => Object.hash(runtimeType,name,grade,dDay,startPriceWon,thumbnail);

@override
String toString() {
  return 'OrderItemSummary(name: $name, grade: $grade, dDay: $dDay, startPriceWon: $startPriceWon, thumbnail: $thumbnail)';
}


}

/// @nodoc
abstract mixin class $OrderItemSummaryCopyWith<$Res>  {
  factory $OrderItemSummaryCopyWith(OrderItemSummary value, $Res Function(OrderItemSummary) _then) = _$OrderItemSummaryCopyWithImpl;
@useResult
$Res call({
 String name, InspectionGrade grade, int? dDay, int startPriceWon, String? thumbnail
});




}
/// @nodoc
class _$OrderItemSummaryCopyWithImpl<$Res>
    implements $OrderItemSummaryCopyWith<$Res> {
  _$OrderItemSummaryCopyWithImpl(this._self, this._then);

  final OrderItemSummary _self;
  final $Res Function(OrderItemSummary) _then;

/// Create a copy of OrderItemSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? grade = null,Object? dDay = freezed,Object? startPriceWon = null,Object? thumbnail = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as InspectionGrade,dDay: freezed == dDay ? _self.dDay : dDay // ignore: cast_nullable_to_non_nullable
as int?,startPriceWon: null == startPriceWon ? _self.startPriceWon : startPriceWon // ignore: cast_nullable_to_non_nullable
as int,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItemSummary].
extension OrderItemSummaryPatterns on OrderItemSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemSummary value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemSummary value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  InspectionGrade grade,  int? dDay,  int startPriceWon,  String? thumbnail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItemSummary() when $default != null:
return $default(_that.name,_that.grade,_that.dDay,_that.startPriceWon,_that.thumbnail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  InspectionGrade grade,  int? dDay,  int startPriceWon,  String? thumbnail)  $default,) {final _that = this;
switch (_that) {
case _OrderItemSummary():
return $default(_that.name,_that.grade,_that.dDay,_that.startPriceWon,_that.thumbnail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  InspectionGrade grade,  int? dDay,  int startPriceWon,  String? thumbnail)?  $default,) {final _that = this;
switch (_that) {
case _OrderItemSummary() when $default != null:
return $default(_that.name,_that.grade,_that.dDay,_that.startPriceWon,_that.thumbnail);case _:
  return null;

}
}

}

/// @nodoc


class _OrderItemSummary implements OrderItemSummary {
  const _OrderItemSummary({required this.name, required this.grade, this.dDay, required this.startPriceWon, this.thumbnail});
  

@override final  String name;
@override final  InspectionGrade grade;
/// 마감까지 남은 일수. null이면 D-day 뱃지를 숨긴다.
@override final  int? dDay;
/// 시작가 (원, 정수).
@override final  int startPriceWon;
/// 에셋 경로 또는 URL.
@override final  String? thumbnail;

/// Create a copy of OrderItemSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemSummaryCopyWith<_OrderItemSummary> get copyWith => __$OrderItemSummaryCopyWithImpl<_OrderItemSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemSummary&&(identical(other.name, name) || other.name == name)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.dDay, dDay) || other.dDay == dDay)&&(identical(other.startPriceWon, startPriceWon) || other.startPriceWon == startPriceWon)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail));
}


@override
int get hashCode => Object.hash(runtimeType,name,grade,dDay,startPriceWon,thumbnail);

@override
String toString() {
  return 'OrderItemSummary(name: $name, grade: $grade, dDay: $dDay, startPriceWon: $startPriceWon, thumbnail: $thumbnail)';
}


}

/// @nodoc
abstract mixin class _$OrderItemSummaryCopyWith<$Res> implements $OrderItemSummaryCopyWith<$Res> {
  factory _$OrderItemSummaryCopyWith(_OrderItemSummary value, $Res Function(_OrderItemSummary) _then) = __$OrderItemSummaryCopyWithImpl;
@override @useResult
$Res call({
 String name, InspectionGrade grade, int? dDay, int startPriceWon, String? thumbnail
});




}
/// @nodoc
class __$OrderItemSummaryCopyWithImpl<$Res>
    implements _$OrderItemSummaryCopyWith<$Res> {
  __$OrderItemSummaryCopyWithImpl(this._self, this._then);

  final _OrderItemSummary _self;
  final $Res Function(_OrderItemSummary) _then;

/// Create a copy of OrderItemSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? grade = null,Object? dDay = freezed,Object? startPriceWon = null,Object? thumbnail = freezed,}) {
  return _then(_OrderItemSummary(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as InspectionGrade,dDay: freezed == dDay ? _self.dDay : dDay // ignore: cast_nullable_to_non_nullable
as int?,startPriceWon: null == startPriceWon ? _self.startPriceWon : startPriceWon // ignore: cast_nullable_to_non_nullable
as int,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$PaymentCard {

/// "국민카드"
 String get issuer;/// "****1234"
 String get maskedNumber; bool get isDefault;/// 낙찰 즉시 자동결제되는 카드.
 bool get isAutoPay;
/// Create a copy of PaymentCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentCardCopyWith<PaymentCard> get copyWith => _$PaymentCardCopyWithImpl<PaymentCard>(this as PaymentCard, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentCard&&(identical(other.issuer, issuer) || other.issuer == issuer)&&(identical(other.maskedNumber, maskedNumber) || other.maskedNumber == maskedNumber)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.isAutoPay, isAutoPay) || other.isAutoPay == isAutoPay));
}


@override
int get hashCode => Object.hash(runtimeType,issuer,maskedNumber,isDefault,isAutoPay);

@override
String toString() {
  return 'PaymentCard(issuer: $issuer, maskedNumber: $maskedNumber, isDefault: $isDefault, isAutoPay: $isAutoPay)';
}


}

/// @nodoc
abstract mixin class $PaymentCardCopyWith<$Res>  {
  factory $PaymentCardCopyWith(PaymentCard value, $Res Function(PaymentCard) _then) = _$PaymentCardCopyWithImpl;
@useResult
$Res call({
 String issuer, String maskedNumber, bool isDefault, bool isAutoPay
});




}
/// @nodoc
class _$PaymentCardCopyWithImpl<$Res>
    implements $PaymentCardCopyWith<$Res> {
  _$PaymentCardCopyWithImpl(this._self, this._then);

  final PaymentCard _self;
  final $Res Function(PaymentCard) _then;

/// Create a copy of PaymentCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? issuer = null,Object? maskedNumber = null,Object? isDefault = null,Object? isAutoPay = null,}) {
  return _then(_self.copyWith(
issuer: null == issuer ? _self.issuer : issuer // ignore: cast_nullable_to_non_nullable
as String,maskedNumber: null == maskedNumber ? _self.maskedNumber : maskedNumber // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,isAutoPay: null == isAutoPay ? _self.isAutoPay : isAutoPay // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentCard].
extension PaymentCardPatterns on PaymentCard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentCard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentCard value)  $default,){
final _that = this;
switch (_that) {
case _PaymentCard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentCard value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentCard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String issuer,  String maskedNumber,  bool isDefault,  bool isAutoPay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentCard() when $default != null:
return $default(_that.issuer,_that.maskedNumber,_that.isDefault,_that.isAutoPay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String issuer,  String maskedNumber,  bool isDefault,  bool isAutoPay)  $default,) {final _that = this;
switch (_that) {
case _PaymentCard():
return $default(_that.issuer,_that.maskedNumber,_that.isDefault,_that.isAutoPay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String issuer,  String maskedNumber,  bool isDefault,  bool isAutoPay)?  $default,) {final _that = this;
switch (_that) {
case _PaymentCard() when $default != null:
return $default(_that.issuer,_that.maskedNumber,_that.isDefault,_that.isAutoPay);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentCard implements PaymentCard {
  const _PaymentCard({required this.issuer, required this.maskedNumber, this.isDefault = false, this.isAutoPay = false});
  

/// "국민카드"
@override final  String issuer;
/// "****1234"
@override final  String maskedNumber;
@override@JsonKey() final  bool isDefault;
/// 낙찰 즉시 자동결제되는 카드.
@override@JsonKey() final  bool isAutoPay;

/// Create a copy of PaymentCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentCardCopyWith<_PaymentCard> get copyWith => __$PaymentCardCopyWithImpl<_PaymentCard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentCard&&(identical(other.issuer, issuer) || other.issuer == issuer)&&(identical(other.maskedNumber, maskedNumber) || other.maskedNumber == maskedNumber)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.isAutoPay, isAutoPay) || other.isAutoPay == isAutoPay));
}


@override
int get hashCode => Object.hash(runtimeType,issuer,maskedNumber,isDefault,isAutoPay);

@override
String toString() {
  return 'PaymentCard(issuer: $issuer, maskedNumber: $maskedNumber, isDefault: $isDefault, isAutoPay: $isAutoPay)';
}


}

/// @nodoc
abstract mixin class _$PaymentCardCopyWith<$Res> implements $PaymentCardCopyWith<$Res> {
  factory _$PaymentCardCopyWith(_PaymentCard value, $Res Function(_PaymentCard) _then) = __$PaymentCardCopyWithImpl;
@override @useResult
$Res call({
 String issuer, String maskedNumber, bool isDefault, bool isAutoPay
});




}
/// @nodoc
class __$PaymentCardCopyWithImpl<$Res>
    implements _$PaymentCardCopyWith<$Res> {
  __$PaymentCardCopyWithImpl(this._self, this._then);

  final _PaymentCard _self;
  final $Res Function(_PaymentCard) _then;

/// Create a copy of PaymentCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? issuer = null,Object? maskedNumber = null,Object? isDefault = null,Object? isAutoPay = null,}) {
  return _then(_PaymentCard(
issuer: null == issuer ? _self.issuer : issuer // ignore: cast_nullable_to_non_nullable
as String,maskedNumber: null == maskedNumber ? _self.maskedNumber : maskedNumber // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,isAutoPay: null == isAutoPay ? _self.isAutoPay : isAutoPay // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ShippingAddress {

/// "우리집"
 String get label; String get recipient; String get phone; String get address;
/// Create a copy of ShippingAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingAddressCopyWith<ShippingAddress> get copyWith => _$ShippingAddressCopyWithImpl<ShippingAddress>(this as ShippingAddress, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingAddress&&(identical(other.label, label) || other.label == label)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,label,recipient,phone,address);



}

/// @nodoc
abstract mixin class $ShippingAddressCopyWith<$Res>  {
  factory $ShippingAddressCopyWith(ShippingAddress value, $Res Function(ShippingAddress) _then) = _$ShippingAddressCopyWithImpl;
@useResult
$Res call({
 String label, String recipient, String phone, String address
});




}
/// @nodoc
class _$ShippingAddressCopyWithImpl<$Res>
    implements $ShippingAddressCopyWith<$Res> {
  _$ShippingAddressCopyWithImpl(this._self, this._then);

  final ShippingAddress _self;
  final $Res Function(ShippingAddress) _then;

/// Create a copy of ShippingAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? recipient = null,Object? phone = null,Object? address = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,recipient: null == recipient ? _self.recipient : recipient // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ShippingAddress].
extension ShippingAddressPatterns on ShippingAddress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShippingAddress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShippingAddress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShippingAddress value)  $default,){
final _that = this;
switch (_that) {
case _ShippingAddress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShippingAddress value)?  $default,){
final _that = this;
switch (_that) {
case _ShippingAddress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String recipient,  String phone,  String address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShippingAddress() when $default != null:
return $default(_that.label,_that.recipient,_that.phone,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String recipient,  String phone,  String address)  $default,) {final _that = this;
switch (_that) {
case _ShippingAddress():
return $default(_that.label,_that.recipient,_that.phone,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String recipient,  String phone,  String address)?  $default,) {final _that = this;
switch (_that) {
case _ShippingAddress() when $default != null:
return $default(_that.label,_that.recipient,_that.phone,_that.address);case _:
  return null;

}
}

}

/// @nodoc


class _ShippingAddress extends ShippingAddress {
  const _ShippingAddress({required this.label, required this.recipient, required this.phone, required this.address}): super._();
  

/// "우리집"
@override final  String label;
@override final  String recipient;
@override final  String phone;
@override final  String address;

/// Create a copy of ShippingAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingAddressCopyWith<_ShippingAddress> get copyWith => __$ShippingAddressCopyWithImpl<_ShippingAddress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingAddress&&(identical(other.label, label) || other.label == label)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,label,recipient,phone,address);



}

/// @nodoc
abstract mixin class _$ShippingAddressCopyWith<$Res> implements $ShippingAddressCopyWith<$Res> {
  factory _$ShippingAddressCopyWith(_ShippingAddress value, $Res Function(_ShippingAddress) _then) = __$ShippingAddressCopyWithImpl;
@override @useResult
$Res call({
 String label, String recipient, String phone, String address
});




}
/// @nodoc
class __$ShippingAddressCopyWithImpl<$Res>
    implements _$ShippingAddressCopyWith<$Res> {
  __$ShippingAddressCopyWithImpl(this._self, this._then);

  final _ShippingAddress _self;
  final $Res Function(_ShippingAddress) _then;

/// Create a copy of ShippingAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? recipient = null,Object? phone = null,Object? address = null,}) {
  return _then(_ShippingAddress(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,recipient: null == recipient ? _self.recipient : recipient // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$LineupProgress {

 int get position; int get total;
/// Create a copy of LineupProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LineupProgressCopyWith<LineupProgress> get copyWith => _$LineupProgressCopyWithImpl<LineupProgress>(this as LineupProgress, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LineupProgress&&(identical(other.position, position) || other.position == position)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,position,total);

@override
String toString() {
  return 'LineupProgress(position: $position, total: $total)';
}


}

/// @nodoc
abstract mixin class $LineupProgressCopyWith<$Res>  {
  factory $LineupProgressCopyWith(LineupProgress value, $Res Function(LineupProgress) _then) = _$LineupProgressCopyWithImpl;
@useResult
$Res call({
 int position, int total
});




}
/// @nodoc
class _$LineupProgressCopyWithImpl<$Res>
    implements $LineupProgressCopyWith<$Res> {
  _$LineupProgressCopyWithImpl(this._self, this._then);

  final LineupProgress _self;
  final $Res Function(LineupProgress) _then;

/// Create a copy of LineupProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? position = null,Object? total = null,}) {
  return _then(_self.copyWith(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LineupProgress].
extension LineupProgressPatterns on LineupProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LineupProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LineupProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LineupProgress value)  $default,){
final _that = this;
switch (_that) {
case _LineupProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LineupProgress value)?  $default,){
final _that = this;
switch (_that) {
case _LineupProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int position,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LineupProgress() when $default != null:
return $default(_that.position,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int position,  int total)  $default,) {final _that = this;
switch (_that) {
case _LineupProgress():
return $default(_that.position,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int position,  int total)?  $default,) {final _that = this;
switch (_that) {
case _LineupProgress() when $default != null:
return $default(_that.position,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _LineupProgress implements LineupProgress {
  const _LineupProgress({required this.position, required this.total});
  

@override final  int position;
@override final  int total;

/// Create a copy of LineupProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LineupProgressCopyWith<_LineupProgress> get copyWith => __$LineupProgressCopyWithImpl<_LineupProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LineupProgress&&(identical(other.position, position) || other.position == position)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,position,total);

@override
String toString() {
  return 'LineupProgress(position: $position, total: $total)';
}


}

/// @nodoc
abstract mixin class _$LineupProgressCopyWith<$Res> implements $LineupProgressCopyWith<$Res> {
  factory _$LineupProgressCopyWith(_LineupProgress value, $Res Function(_LineupProgress) _then) = __$LineupProgressCopyWithImpl;
@override @useResult
$Res call({
 int position, int total
});




}
/// @nodoc
class __$LineupProgressCopyWithImpl<$Res>
    implements _$LineupProgressCopyWith<$Res> {
  __$LineupProgressCopyWithImpl(this._self, this._then);

  final _LineupProgress _self;
  final $Res Function(_LineupProgress) _then;

/// Create a copy of LineupProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? total = null,}) {
  return _then(_LineupProgress(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$OrderPayment {

 String get orderId;/// 결제 시각 (기기 로컬).
 DateTime get paidAt; OrderItemSummary get item; int get winningPriceWon; int get shippingFeeWon;/// 배송 방식 ("냉동"). null이면 "배송비"만 보인다.
 String? get shippingMethod; int get buyerFeeWon; PaymentCard get card; ShippingAddress get address;/// 배송 메모. 고르지 않았으면 null.
 String? get deliveryMemo; EscrowStage get stage;/// 라이브로 돌아가면 이어질 품목. 방송이 끝났으면 null.
 LineupProgress? get nextItem;
/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderPaymentCopyWith<OrderPayment> get copyWith => _$OrderPaymentCopyWithImpl<OrderPayment>(this as OrderPayment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderPayment&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.item, item) || other.item == item)&&(identical(other.winningPriceWon, winningPriceWon) || other.winningPriceWon == winningPriceWon)&&(identical(other.shippingFeeWon, shippingFeeWon) || other.shippingFeeWon == shippingFeeWon)&&(identical(other.shippingMethod, shippingMethod) || other.shippingMethod == shippingMethod)&&(identical(other.buyerFeeWon, buyerFeeWon) || other.buyerFeeWon == buyerFeeWon)&&(identical(other.card, card) || other.card == card)&&(identical(other.address, address) || other.address == address)&&(identical(other.deliveryMemo, deliveryMemo) || other.deliveryMemo == deliveryMemo)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.nextItem, nextItem) || other.nextItem == nextItem));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,paidAt,item,winningPriceWon,shippingFeeWon,shippingMethod,buyerFeeWon,card,address,deliveryMemo,stage,nextItem);

@override
String toString() {
  return 'OrderPayment(orderId: $orderId, paidAt: $paidAt, item: $item, winningPriceWon: $winningPriceWon, shippingFeeWon: $shippingFeeWon, shippingMethod: $shippingMethod, buyerFeeWon: $buyerFeeWon, card: $card, address: $address, deliveryMemo: $deliveryMemo, stage: $stage, nextItem: $nextItem)';
}


}

/// @nodoc
abstract mixin class $OrderPaymentCopyWith<$Res>  {
  factory $OrderPaymentCopyWith(OrderPayment value, $Res Function(OrderPayment) _then) = _$OrderPaymentCopyWithImpl;
@useResult
$Res call({
 String orderId, DateTime paidAt, OrderItemSummary item, int winningPriceWon, int shippingFeeWon, String? shippingMethod, int buyerFeeWon, PaymentCard card, ShippingAddress address, String? deliveryMemo, EscrowStage stage, LineupProgress? nextItem
});


$OrderItemSummaryCopyWith<$Res> get item;$PaymentCardCopyWith<$Res> get card;$ShippingAddressCopyWith<$Res> get address;$LineupProgressCopyWith<$Res>? get nextItem;

}
/// @nodoc
class _$OrderPaymentCopyWithImpl<$Res>
    implements $OrderPaymentCopyWith<$Res> {
  _$OrderPaymentCopyWithImpl(this._self, this._then);

  final OrderPayment _self;
  final $Res Function(OrderPayment) _then;

/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? paidAt = null,Object? item = null,Object? winningPriceWon = null,Object? shippingFeeWon = null,Object? shippingMethod = freezed,Object? buyerFeeWon = null,Object? card = null,Object? address = null,Object? deliveryMemo = freezed,Object? stage = null,Object? nextItem = freezed,}) {
  return _then(_self.copyWith(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,paidAt: null == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as OrderItemSummary,winningPriceWon: null == winningPriceWon ? _self.winningPriceWon : winningPriceWon // ignore: cast_nullable_to_non_nullable
as int,shippingFeeWon: null == shippingFeeWon ? _self.shippingFeeWon : shippingFeeWon // ignore: cast_nullable_to_non_nullable
as int,shippingMethod: freezed == shippingMethod ? _self.shippingMethod : shippingMethod // ignore: cast_nullable_to_non_nullable
as String?,buyerFeeWon: null == buyerFeeWon ? _self.buyerFeeWon : buyerFeeWon // ignore: cast_nullable_to_non_nullable
as int,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as PaymentCard,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as ShippingAddress,deliveryMemo: freezed == deliveryMemo ? _self.deliveryMemo : deliveryMemo // ignore: cast_nullable_to_non_nullable
as String?,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as EscrowStage,nextItem: freezed == nextItem ? _self.nextItem : nextItem // ignore: cast_nullable_to_non_nullable
as LineupProgress?,
  ));
}
/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderItemSummaryCopyWith<$Res> get item {
  
  return $OrderItemSummaryCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentCardCopyWith<$Res> get card {
  
  return $PaymentCardCopyWith<$Res>(_self.card, (value) {
    return _then(_self.copyWith(card: value));
  });
}/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShippingAddressCopyWith<$Res> get address {
  
  return $ShippingAddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LineupProgressCopyWith<$Res>? get nextItem {
    if (_self.nextItem == null) {
    return null;
  }

  return $LineupProgressCopyWith<$Res>(_self.nextItem!, (value) {
    return _then(_self.copyWith(nextItem: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderPayment].
extension OrderPaymentPatterns on OrderPayment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderPayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderPayment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderPayment value)  $default,){
final _that = this;
switch (_that) {
case _OrderPayment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderPayment value)?  $default,){
final _that = this;
switch (_that) {
case _OrderPayment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderId,  DateTime paidAt,  OrderItemSummary item,  int winningPriceWon,  int shippingFeeWon,  String? shippingMethod,  int buyerFeeWon,  PaymentCard card,  ShippingAddress address,  String? deliveryMemo,  EscrowStage stage,  LineupProgress? nextItem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderPayment() when $default != null:
return $default(_that.orderId,_that.paidAt,_that.item,_that.winningPriceWon,_that.shippingFeeWon,_that.shippingMethod,_that.buyerFeeWon,_that.card,_that.address,_that.deliveryMemo,_that.stage,_that.nextItem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderId,  DateTime paidAt,  OrderItemSummary item,  int winningPriceWon,  int shippingFeeWon,  String? shippingMethod,  int buyerFeeWon,  PaymentCard card,  ShippingAddress address,  String? deliveryMemo,  EscrowStage stage,  LineupProgress? nextItem)  $default,) {final _that = this;
switch (_that) {
case _OrderPayment():
return $default(_that.orderId,_that.paidAt,_that.item,_that.winningPriceWon,_that.shippingFeeWon,_that.shippingMethod,_that.buyerFeeWon,_that.card,_that.address,_that.deliveryMemo,_that.stage,_that.nextItem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderId,  DateTime paidAt,  OrderItemSummary item,  int winningPriceWon,  int shippingFeeWon,  String? shippingMethod,  int buyerFeeWon,  PaymentCard card,  ShippingAddress address,  String? deliveryMemo,  EscrowStage stage,  LineupProgress? nextItem)?  $default,) {final _that = this;
switch (_that) {
case _OrderPayment() when $default != null:
return $default(_that.orderId,_that.paidAt,_that.item,_that.winningPriceWon,_that.shippingFeeWon,_that.shippingMethod,_that.buyerFeeWon,_that.card,_that.address,_that.deliveryMemo,_that.stage,_that.nextItem);case _:
  return null;

}
}

}

/// @nodoc


class _OrderPayment extends OrderPayment {
  const _OrderPayment({required this.orderId, required this.paidAt, required this.item, required this.winningPriceWon, required this.shippingFeeWon, this.shippingMethod, required this.buyerFeeWon, required this.card, required this.address, this.deliveryMemo, required this.stage, this.nextItem}): super._();
  

@override final  String orderId;
/// 결제 시각 (기기 로컬).
@override final  DateTime paidAt;
@override final  OrderItemSummary item;
@override final  int winningPriceWon;
@override final  int shippingFeeWon;
/// 배송 방식 ("냉동"). null이면 "배송비"만 보인다.
@override final  String? shippingMethod;
@override final  int buyerFeeWon;
@override final  PaymentCard card;
@override final  ShippingAddress address;
/// 배송 메모. 고르지 않았으면 null.
@override final  String? deliveryMemo;
@override final  EscrowStage stage;
/// 라이브로 돌아가면 이어질 품목. 방송이 끝났으면 null.
@override final  LineupProgress? nextItem;

/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderPaymentCopyWith<_OrderPayment> get copyWith => __$OrderPaymentCopyWithImpl<_OrderPayment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderPayment&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.item, item) || other.item == item)&&(identical(other.winningPriceWon, winningPriceWon) || other.winningPriceWon == winningPriceWon)&&(identical(other.shippingFeeWon, shippingFeeWon) || other.shippingFeeWon == shippingFeeWon)&&(identical(other.shippingMethod, shippingMethod) || other.shippingMethod == shippingMethod)&&(identical(other.buyerFeeWon, buyerFeeWon) || other.buyerFeeWon == buyerFeeWon)&&(identical(other.card, card) || other.card == card)&&(identical(other.address, address) || other.address == address)&&(identical(other.deliveryMemo, deliveryMemo) || other.deliveryMemo == deliveryMemo)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.nextItem, nextItem) || other.nextItem == nextItem));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,paidAt,item,winningPriceWon,shippingFeeWon,shippingMethod,buyerFeeWon,card,address,deliveryMemo,stage,nextItem);

@override
String toString() {
  return 'OrderPayment(orderId: $orderId, paidAt: $paidAt, item: $item, winningPriceWon: $winningPriceWon, shippingFeeWon: $shippingFeeWon, shippingMethod: $shippingMethod, buyerFeeWon: $buyerFeeWon, card: $card, address: $address, deliveryMemo: $deliveryMemo, stage: $stage, nextItem: $nextItem)';
}


}

/// @nodoc
abstract mixin class _$OrderPaymentCopyWith<$Res> implements $OrderPaymentCopyWith<$Res> {
  factory _$OrderPaymentCopyWith(_OrderPayment value, $Res Function(_OrderPayment) _then) = __$OrderPaymentCopyWithImpl;
@override @useResult
$Res call({
 String orderId, DateTime paidAt, OrderItemSummary item, int winningPriceWon, int shippingFeeWon, String? shippingMethod, int buyerFeeWon, PaymentCard card, ShippingAddress address, String? deliveryMemo, EscrowStage stage, LineupProgress? nextItem
});


@override $OrderItemSummaryCopyWith<$Res> get item;@override $PaymentCardCopyWith<$Res> get card;@override $ShippingAddressCopyWith<$Res> get address;@override $LineupProgressCopyWith<$Res>? get nextItem;

}
/// @nodoc
class __$OrderPaymentCopyWithImpl<$Res>
    implements _$OrderPaymentCopyWith<$Res> {
  __$OrderPaymentCopyWithImpl(this._self, this._then);

  final _OrderPayment _self;
  final $Res Function(_OrderPayment) _then;

/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? paidAt = null,Object? item = null,Object? winningPriceWon = null,Object? shippingFeeWon = null,Object? shippingMethod = freezed,Object? buyerFeeWon = null,Object? card = null,Object? address = null,Object? deliveryMemo = freezed,Object? stage = null,Object? nextItem = freezed,}) {
  return _then(_OrderPayment(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,paidAt: null == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as OrderItemSummary,winningPriceWon: null == winningPriceWon ? _self.winningPriceWon : winningPriceWon // ignore: cast_nullable_to_non_nullable
as int,shippingFeeWon: null == shippingFeeWon ? _self.shippingFeeWon : shippingFeeWon // ignore: cast_nullable_to_non_nullable
as int,shippingMethod: freezed == shippingMethod ? _self.shippingMethod : shippingMethod // ignore: cast_nullable_to_non_nullable
as String?,buyerFeeWon: null == buyerFeeWon ? _self.buyerFeeWon : buyerFeeWon // ignore: cast_nullable_to_non_nullable
as int,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as PaymentCard,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as ShippingAddress,deliveryMemo: freezed == deliveryMemo ? _self.deliveryMemo : deliveryMemo // ignore: cast_nullable_to_non_nullable
as String?,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as EscrowStage,nextItem: freezed == nextItem ? _self.nextItem : nextItem // ignore: cast_nullable_to_non_nullable
as LineupProgress?,
  ));
}

/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderItemSummaryCopyWith<$Res> get item {
  
  return $OrderItemSummaryCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentCardCopyWith<$Res> get card {
  
  return $PaymentCardCopyWith<$Res>(_self.card, (value) {
    return _then(_self.copyWith(card: value));
  });
}/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShippingAddressCopyWith<$Res> get address {
  
  return $ShippingAddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LineupProgressCopyWith<$Res>? get nextItem {
    if (_self.nextItem == null) {
    return null;
  }

  return $LineupProgressCopyWith<$Res>(_self.nextItem!, (value) {
    return _then(_self.copyWith(nextItem: value));
  });
}
}

// dart format on
