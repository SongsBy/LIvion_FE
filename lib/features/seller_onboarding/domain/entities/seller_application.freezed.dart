// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_application.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettlementBank {

 String get code; String get name;
/// Create a copy of SettlementBank
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettlementBankCopyWith<SettlementBank> get copyWith => _$SettlementBankCopyWithImpl<SettlementBank>(this as SettlementBank, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettlementBank&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,code,name);

@override
String toString() {
  return 'SettlementBank(code: $code, name: $name)';
}


}

/// @nodoc
abstract mixin class $SettlementBankCopyWith<$Res>  {
  factory $SettlementBankCopyWith(SettlementBank value, $Res Function(SettlementBank) _then) = _$SettlementBankCopyWithImpl;
@useResult
$Res call({
 String code, String name
});




}
/// @nodoc
class _$SettlementBankCopyWithImpl<$Res>
    implements $SettlementBankCopyWith<$Res> {
  _$SettlementBankCopyWithImpl(this._self, this._then);

  final SettlementBank _self;
  final $Res Function(SettlementBank) _then;

/// Create a copy of SettlementBank
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SettlementBank].
extension SettlementBankPatterns on SettlementBank {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettlementBank value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettlementBank() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettlementBank value)  $default,){
final _that = this;
switch (_that) {
case _SettlementBank():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettlementBank value)?  $default,){
final _that = this;
switch (_that) {
case _SettlementBank() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettlementBank() when $default != null:
return $default(_that.code,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name)  $default,) {final _that = this;
switch (_that) {
case _SettlementBank():
return $default(_that.code,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name)?  $default,) {final _that = this;
switch (_that) {
case _SettlementBank() when $default != null:
return $default(_that.code,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _SettlementBank implements SettlementBank {
  const _SettlementBank({required this.code, required this.name});
  

@override final  String code;
@override final  String name;

/// Create a copy of SettlementBank
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettlementBankCopyWith<_SettlementBank> get copyWith => __$SettlementBankCopyWithImpl<_SettlementBank>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettlementBank&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,code,name);

@override
String toString() {
  return 'SettlementBank(code: $code, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SettlementBankCopyWith<$Res> implements $SettlementBankCopyWith<$Res> {
  factory _$SettlementBankCopyWith(_SettlementBank value, $Res Function(_SettlementBank) _then) = __$SettlementBankCopyWithImpl;
@override @useResult
$Res call({
 String code, String name
});




}
/// @nodoc
class __$SettlementBankCopyWithImpl<$Res>
    implements _$SettlementBankCopyWith<$Res> {
  __$SettlementBankCopyWithImpl(this._self, this._then);

  final _SettlementBank _self;
  final $Res Function(_SettlementBank) _then;

/// Create a copy of SettlementBank
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,}) {
  return _then(_SettlementBank(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SellerApplicationReceipt {

/// 접수번호 ("S-260914-0042").
 String get receiptNumber; String get channelName; BroadcastMode get broadcastMode;
/// Create a copy of SellerApplicationReceipt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerApplicationReceiptCopyWith<SellerApplicationReceipt> get copyWith => _$SellerApplicationReceiptCopyWithImpl<SellerApplicationReceipt>(this as SellerApplicationReceipt, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerApplicationReceipt&&(identical(other.receiptNumber, receiptNumber) || other.receiptNumber == receiptNumber)&&(identical(other.channelName, channelName) || other.channelName == channelName)&&(identical(other.broadcastMode, broadcastMode) || other.broadcastMode == broadcastMode));
}


@override
int get hashCode => Object.hash(runtimeType,receiptNumber,channelName,broadcastMode);

@override
String toString() {
  return 'SellerApplicationReceipt(receiptNumber: $receiptNumber, channelName: $channelName, broadcastMode: $broadcastMode)';
}


}

/// @nodoc
abstract mixin class $SellerApplicationReceiptCopyWith<$Res>  {
  factory $SellerApplicationReceiptCopyWith(SellerApplicationReceipt value, $Res Function(SellerApplicationReceipt) _then) = _$SellerApplicationReceiptCopyWithImpl;
@useResult
$Res call({
 String receiptNumber, String channelName, BroadcastMode broadcastMode
});




}
/// @nodoc
class _$SellerApplicationReceiptCopyWithImpl<$Res>
    implements $SellerApplicationReceiptCopyWith<$Res> {
  _$SellerApplicationReceiptCopyWithImpl(this._self, this._then);

  final SellerApplicationReceipt _self;
  final $Res Function(SellerApplicationReceipt) _then;

/// Create a copy of SellerApplicationReceipt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? receiptNumber = null,Object? channelName = null,Object? broadcastMode = null,}) {
  return _then(_self.copyWith(
receiptNumber: null == receiptNumber ? _self.receiptNumber : receiptNumber // ignore: cast_nullable_to_non_nullable
as String,channelName: null == channelName ? _self.channelName : channelName // ignore: cast_nullable_to_non_nullable
as String,broadcastMode: null == broadcastMode ? _self.broadcastMode : broadcastMode // ignore: cast_nullable_to_non_nullable
as BroadcastMode,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerApplicationReceipt].
extension SellerApplicationReceiptPatterns on SellerApplicationReceipt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerApplicationReceipt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerApplicationReceipt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerApplicationReceipt value)  $default,){
final _that = this;
switch (_that) {
case _SellerApplicationReceipt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerApplicationReceipt value)?  $default,){
final _that = this;
switch (_that) {
case _SellerApplicationReceipt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String receiptNumber,  String channelName,  BroadcastMode broadcastMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerApplicationReceipt() when $default != null:
return $default(_that.receiptNumber,_that.channelName,_that.broadcastMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String receiptNumber,  String channelName,  BroadcastMode broadcastMode)  $default,) {final _that = this;
switch (_that) {
case _SellerApplicationReceipt():
return $default(_that.receiptNumber,_that.channelName,_that.broadcastMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String receiptNumber,  String channelName,  BroadcastMode broadcastMode)?  $default,) {final _that = this;
switch (_that) {
case _SellerApplicationReceipt() when $default != null:
return $default(_that.receiptNumber,_that.channelName,_that.broadcastMode);case _:
  return null;

}
}

}

/// @nodoc


class _SellerApplicationReceipt implements SellerApplicationReceipt {
  const _SellerApplicationReceipt({required this.receiptNumber, required this.channelName, required this.broadcastMode});
  

/// 접수번호 ("S-260914-0042").
@override final  String receiptNumber;
@override final  String channelName;
@override final  BroadcastMode broadcastMode;

/// Create a copy of SellerApplicationReceipt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerApplicationReceiptCopyWith<_SellerApplicationReceipt> get copyWith => __$SellerApplicationReceiptCopyWithImpl<_SellerApplicationReceipt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerApplicationReceipt&&(identical(other.receiptNumber, receiptNumber) || other.receiptNumber == receiptNumber)&&(identical(other.channelName, channelName) || other.channelName == channelName)&&(identical(other.broadcastMode, broadcastMode) || other.broadcastMode == broadcastMode));
}


@override
int get hashCode => Object.hash(runtimeType,receiptNumber,channelName,broadcastMode);

@override
String toString() {
  return 'SellerApplicationReceipt(receiptNumber: $receiptNumber, channelName: $channelName, broadcastMode: $broadcastMode)';
}


}

/// @nodoc
abstract mixin class _$SellerApplicationReceiptCopyWith<$Res> implements $SellerApplicationReceiptCopyWith<$Res> {
  factory _$SellerApplicationReceiptCopyWith(_SellerApplicationReceipt value, $Res Function(_SellerApplicationReceipt) _then) = __$SellerApplicationReceiptCopyWithImpl;
@override @useResult
$Res call({
 String receiptNumber, String channelName, BroadcastMode broadcastMode
});




}
/// @nodoc
class __$SellerApplicationReceiptCopyWithImpl<$Res>
    implements _$SellerApplicationReceiptCopyWith<$Res> {
  __$SellerApplicationReceiptCopyWithImpl(this._self, this._then);

  final _SellerApplicationReceipt _self;
  final $Res Function(_SellerApplicationReceipt) _then;

/// Create a copy of SellerApplicationReceipt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? receiptNumber = null,Object? channelName = null,Object? broadcastMode = null,}) {
  return _then(_SellerApplicationReceipt(
receiptNumber: null == receiptNumber ? _self.receiptNumber : receiptNumber // ignore: cast_nullable_to_non_nullable
as String,channelName: null == channelName ? _self.channelName : channelName // ignore: cast_nullable_to_non_nullable
as String,broadcastMode: null == broadcastMode ? _self.broadcastMode : broadcastMode // ignore: cast_nullable_to_non_nullable
as BroadcastMode,
  ));
}


}

/// @nodoc
mixin _$SellerApplication {

 SellerType get sellerType; String get businessNumber; String get companyName; String get representativeName; String get contactPhone; String? get mailOrderNumber; Set<StockType> get stockTypes; MonthlyBroadcasts get monthlyBroadcasts; String get channelName; String get channelIntro; ChannelCategory get category; BroadcastMode get broadcastMode; String get bankCode; String get accountNumber; String get taxInvoiceEmail; Set<SellerAgreement> get agreements;
/// Create a copy of SellerApplication
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerApplicationCopyWith<SellerApplication> get copyWith => _$SellerApplicationCopyWithImpl<SellerApplication>(this as SellerApplication, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerApplication&&(identical(other.sellerType, sellerType) || other.sellerType == sellerType)&&(identical(other.businessNumber, businessNumber) || other.businessNumber == businessNumber)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.representativeName, representativeName) || other.representativeName == representativeName)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.mailOrderNumber, mailOrderNumber) || other.mailOrderNumber == mailOrderNumber)&&const DeepCollectionEquality().equals(other.stockTypes, stockTypes)&&(identical(other.monthlyBroadcasts, monthlyBroadcasts) || other.monthlyBroadcasts == monthlyBroadcasts)&&(identical(other.channelName, channelName) || other.channelName == channelName)&&(identical(other.channelIntro, channelIntro) || other.channelIntro == channelIntro)&&(identical(other.category, category) || other.category == category)&&(identical(other.broadcastMode, broadcastMode) || other.broadcastMode == broadcastMode)&&(identical(other.bankCode, bankCode) || other.bankCode == bankCode)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.taxInvoiceEmail, taxInvoiceEmail) || other.taxInvoiceEmail == taxInvoiceEmail)&&const DeepCollectionEquality().equals(other.agreements, agreements));
}


@override
int get hashCode => Object.hash(runtimeType,sellerType,businessNumber,companyName,representativeName,contactPhone,mailOrderNumber,const DeepCollectionEquality().hash(stockTypes),monthlyBroadcasts,channelName,channelIntro,category,broadcastMode,bankCode,accountNumber,taxInvoiceEmail,const DeepCollectionEquality().hash(agreements));

@override
String toString() {
  return 'SellerApplication(sellerType: $sellerType, businessNumber: $businessNumber, companyName: $companyName, representativeName: $representativeName, contactPhone: $contactPhone, mailOrderNumber: $mailOrderNumber, stockTypes: $stockTypes, monthlyBroadcasts: $monthlyBroadcasts, channelName: $channelName, channelIntro: $channelIntro, category: $category, broadcastMode: $broadcastMode, bankCode: $bankCode, accountNumber: $accountNumber, taxInvoiceEmail: $taxInvoiceEmail, agreements: $agreements)';
}


}

/// @nodoc
abstract mixin class $SellerApplicationCopyWith<$Res>  {
  factory $SellerApplicationCopyWith(SellerApplication value, $Res Function(SellerApplication) _then) = _$SellerApplicationCopyWithImpl;
@useResult
$Res call({
 SellerType sellerType, String businessNumber, String companyName, String representativeName, String contactPhone, String? mailOrderNumber, Set<StockType> stockTypes, MonthlyBroadcasts monthlyBroadcasts, String channelName, String channelIntro, ChannelCategory category, BroadcastMode broadcastMode, String bankCode, String accountNumber, String taxInvoiceEmail, Set<SellerAgreement> agreements
});




}
/// @nodoc
class _$SellerApplicationCopyWithImpl<$Res>
    implements $SellerApplicationCopyWith<$Res> {
  _$SellerApplicationCopyWithImpl(this._self, this._then);

  final SellerApplication _self;
  final $Res Function(SellerApplication) _then;

/// Create a copy of SellerApplication
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sellerType = null,Object? businessNumber = null,Object? companyName = null,Object? representativeName = null,Object? contactPhone = null,Object? mailOrderNumber = freezed,Object? stockTypes = null,Object? monthlyBroadcasts = null,Object? channelName = null,Object? channelIntro = null,Object? category = null,Object? broadcastMode = null,Object? bankCode = null,Object? accountNumber = null,Object? taxInvoiceEmail = null,Object? agreements = null,}) {
  return _then(_self.copyWith(
sellerType: null == sellerType ? _self.sellerType : sellerType // ignore: cast_nullable_to_non_nullable
as SellerType,businessNumber: null == businessNumber ? _self.businessNumber : businessNumber // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,representativeName: null == representativeName ? _self.representativeName : representativeName // ignore: cast_nullable_to_non_nullable
as String,contactPhone: null == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String,mailOrderNumber: freezed == mailOrderNumber ? _self.mailOrderNumber : mailOrderNumber // ignore: cast_nullable_to_non_nullable
as String?,stockTypes: null == stockTypes ? _self.stockTypes : stockTypes // ignore: cast_nullable_to_non_nullable
as Set<StockType>,monthlyBroadcasts: null == monthlyBroadcasts ? _self.monthlyBroadcasts : monthlyBroadcasts // ignore: cast_nullable_to_non_nullable
as MonthlyBroadcasts,channelName: null == channelName ? _self.channelName : channelName // ignore: cast_nullable_to_non_nullable
as String,channelIntro: null == channelIntro ? _self.channelIntro : channelIntro // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ChannelCategory,broadcastMode: null == broadcastMode ? _self.broadcastMode : broadcastMode // ignore: cast_nullable_to_non_nullable
as BroadcastMode,bankCode: null == bankCode ? _self.bankCode : bankCode // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,taxInvoiceEmail: null == taxInvoiceEmail ? _self.taxInvoiceEmail : taxInvoiceEmail // ignore: cast_nullable_to_non_nullable
as String,agreements: null == agreements ? _self.agreements : agreements // ignore: cast_nullable_to_non_nullable
as Set<SellerAgreement>,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerApplication].
extension SellerApplicationPatterns on SellerApplication {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerApplication value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerApplication() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerApplication value)  $default,){
final _that = this;
switch (_that) {
case _SellerApplication():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerApplication value)?  $default,){
final _that = this;
switch (_that) {
case _SellerApplication() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SellerType sellerType,  String businessNumber,  String companyName,  String representativeName,  String contactPhone,  String? mailOrderNumber,  Set<StockType> stockTypes,  MonthlyBroadcasts monthlyBroadcasts,  String channelName,  String channelIntro,  ChannelCategory category,  BroadcastMode broadcastMode,  String bankCode,  String accountNumber,  String taxInvoiceEmail,  Set<SellerAgreement> agreements)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerApplication() when $default != null:
return $default(_that.sellerType,_that.businessNumber,_that.companyName,_that.representativeName,_that.contactPhone,_that.mailOrderNumber,_that.stockTypes,_that.monthlyBroadcasts,_that.channelName,_that.channelIntro,_that.category,_that.broadcastMode,_that.bankCode,_that.accountNumber,_that.taxInvoiceEmail,_that.agreements);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SellerType sellerType,  String businessNumber,  String companyName,  String representativeName,  String contactPhone,  String? mailOrderNumber,  Set<StockType> stockTypes,  MonthlyBroadcasts monthlyBroadcasts,  String channelName,  String channelIntro,  ChannelCategory category,  BroadcastMode broadcastMode,  String bankCode,  String accountNumber,  String taxInvoiceEmail,  Set<SellerAgreement> agreements)  $default,) {final _that = this;
switch (_that) {
case _SellerApplication():
return $default(_that.sellerType,_that.businessNumber,_that.companyName,_that.representativeName,_that.contactPhone,_that.mailOrderNumber,_that.stockTypes,_that.monthlyBroadcasts,_that.channelName,_that.channelIntro,_that.category,_that.broadcastMode,_that.bankCode,_that.accountNumber,_that.taxInvoiceEmail,_that.agreements);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SellerType sellerType,  String businessNumber,  String companyName,  String representativeName,  String contactPhone,  String? mailOrderNumber,  Set<StockType> stockTypes,  MonthlyBroadcasts monthlyBroadcasts,  String channelName,  String channelIntro,  ChannelCategory category,  BroadcastMode broadcastMode,  String bankCode,  String accountNumber,  String taxInvoiceEmail,  Set<SellerAgreement> agreements)?  $default,) {final _that = this;
switch (_that) {
case _SellerApplication() when $default != null:
return $default(_that.sellerType,_that.businessNumber,_that.companyName,_that.representativeName,_that.contactPhone,_that.mailOrderNumber,_that.stockTypes,_that.monthlyBroadcasts,_that.channelName,_that.channelIntro,_that.category,_that.broadcastMode,_that.bankCode,_that.accountNumber,_that.taxInvoiceEmail,_that.agreements);case _:
  return null;

}
}

}

/// @nodoc


class _SellerApplication implements SellerApplication {
  const _SellerApplication({required this.sellerType, required this.businessNumber, required this.companyName, required this.representativeName, required this.contactPhone, this.mailOrderNumber, required final  Set<StockType> stockTypes, required this.monthlyBroadcasts, required this.channelName, required this.channelIntro, required this.category, required this.broadcastMode, required this.bankCode, required this.accountNumber, required this.taxInvoiceEmail, required final  Set<SellerAgreement> agreements}): _stockTypes = stockTypes,_agreements = agreements;
  

@override final  SellerType sellerType;
@override final  String businessNumber;
@override final  String companyName;
@override final  String representativeName;
@override final  String contactPhone;
@override final  String? mailOrderNumber;
 final  Set<StockType> _stockTypes;
@override Set<StockType> get stockTypes {
  if (_stockTypes is EqualUnmodifiableSetView) return _stockTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_stockTypes);
}

@override final  MonthlyBroadcasts monthlyBroadcasts;
@override final  String channelName;
@override final  String channelIntro;
@override final  ChannelCategory category;
@override final  BroadcastMode broadcastMode;
@override final  String bankCode;
@override final  String accountNumber;
@override final  String taxInvoiceEmail;
 final  Set<SellerAgreement> _agreements;
@override Set<SellerAgreement> get agreements {
  if (_agreements is EqualUnmodifiableSetView) return _agreements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_agreements);
}


/// Create a copy of SellerApplication
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerApplicationCopyWith<_SellerApplication> get copyWith => __$SellerApplicationCopyWithImpl<_SellerApplication>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerApplication&&(identical(other.sellerType, sellerType) || other.sellerType == sellerType)&&(identical(other.businessNumber, businessNumber) || other.businessNumber == businessNumber)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.representativeName, representativeName) || other.representativeName == representativeName)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.mailOrderNumber, mailOrderNumber) || other.mailOrderNumber == mailOrderNumber)&&const DeepCollectionEquality().equals(other._stockTypes, _stockTypes)&&(identical(other.monthlyBroadcasts, monthlyBroadcasts) || other.monthlyBroadcasts == monthlyBroadcasts)&&(identical(other.channelName, channelName) || other.channelName == channelName)&&(identical(other.channelIntro, channelIntro) || other.channelIntro == channelIntro)&&(identical(other.category, category) || other.category == category)&&(identical(other.broadcastMode, broadcastMode) || other.broadcastMode == broadcastMode)&&(identical(other.bankCode, bankCode) || other.bankCode == bankCode)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.taxInvoiceEmail, taxInvoiceEmail) || other.taxInvoiceEmail == taxInvoiceEmail)&&const DeepCollectionEquality().equals(other._agreements, _agreements));
}


@override
int get hashCode => Object.hash(runtimeType,sellerType,businessNumber,companyName,representativeName,contactPhone,mailOrderNumber,const DeepCollectionEquality().hash(_stockTypes),monthlyBroadcasts,channelName,channelIntro,category,broadcastMode,bankCode,accountNumber,taxInvoiceEmail,const DeepCollectionEquality().hash(_agreements));

@override
String toString() {
  return 'SellerApplication(sellerType: $sellerType, businessNumber: $businessNumber, companyName: $companyName, representativeName: $representativeName, contactPhone: $contactPhone, mailOrderNumber: $mailOrderNumber, stockTypes: $stockTypes, monthlyBroadcasts: $monthlyBroadcasts, channelName: $channelName, channelIntro: $channelIntro, category: $category, broadcastMode: $broadcastMode, bankCode: $bankCode, accountNumber: $accountNumber, taxInvoiceEmail: $taxInvoiceEmail, agreements: $agreements)';
}


}

/// @nodoc
abstract mixin class _$SellerApplicationCopyWith<$Res> implements $SellerApplicationCopyWith<$Res> {
  factory _$SellerApplicationCopyWith(_SellerApplication value, $Res Function(_SellerApplication) _then) = __$SellerApplicationCopyWithImpl;
@override @useResult
$Res call({
 SellerType sellerType, String businessNumber, String companyName, String representativeName, String contactPhone, String? mailOrderNumber, Set<StockType> stockTypes, MonthlyBroadcasts monthlyBroadcasts, String channelName, String channelIntro, ChannelCategory category, BroadcastMode broadcastMode, String bankCode, String accountNumber, String taxInvoiceEmail, Set<SellerAgreement> agreements
});




}
/// @nodoc
class __$SellerApplicationCopyWithImpl<$Res>
    implements _$SellerApplicationCopyWith<$Res> {
  __$SellerApplicationCopyWithImpl(this._self, this._then);

  final _SellerApplication _self;
  final $Res Function(_SellerApplication) _then;

/// Create a copy of SellerApplication
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sellerType = null,Object? businessNumber = null,Object? companyName = null,Object? representativeName = null,Object? contactPhone = null,Object? mailOrderNumber = freezed,Object? stockTypes = null,Object? monthlyBroadcasts = null,Object? channelName = null,Object? channelIntro = null,Object? category = null,Object? broadcastMode = null,Object? bankCode = null,Object? accountNumber = null,Object? taxInvoiceEmail = null,Object? agreements = null,}) {
  return _then(_SellerApplication(
sellerType: null == sellerType ? _self.sellerType : sellerType // ignore: cast_nullable_to_non_nullable
as SellerType,businessNumber: null == businessNumber ? _self.businessNumber : businessNumber // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,representativeName: null == representativeName ? _self.representativeName : representativeName // ignore: cast_nullable_to_non_nullable
as String,contactPhone: null == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String,mailOrderNumber: freezed == mailOrderNumber ? _self.mailOrderNumber : mailOrderNumber // ignore: cast_nullable_to_non_nullable
as String?,stockTypes: null == stockTypes ? _self._stockTypes : stockTypes // ignore: cast_nullable_to_non_nullable
as Set<StockType>,monthlyBroadcasts: null == monthlyBroadcasts ? _self.monthlyBroadcasts : monthlyBroadcasts // ignore: cast_nullable_to_non_nullable
as MonthlyBroadcasts,channelName: null == channelName ? _self.channelName : channelName // ignore: cast_nullable_to_non_nullable
as String,channelIntro: null == channelIntro ? _self.channelIntro : channelIntro // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ChannelCategory,broadcastMode: null == broadcastMode ? _self.broadcastMode : broadcastMode // ignore: cast_nullable_to_non_nullable
as BroadcastMode,bankCode: null == bankCode ? _self.bankCode : bankCode // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,taxInvoiceEmail: null == taxInvoiceEmail ? _self.taxInvoiceEmail : taxInvoiceEmail // ignore: cast_nullable_to_non_nullable
as String,agreements: null == agreements ? _self._agreements : agreements // ignore: cast_nullable_to_non_nullable
as Set<SellerAgreement>,
  ));
}


}

// dart format on
