// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_application_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SellerApplicationState {

 SellerApplicationStep get step;// ── 1 유형 ──
 SellerType get sellerType;// ── 2 사업자 ──
 String get businessNumber; CheckStatus get businessNumberCheck; String get companyName; String get representativeName; String get contactPhone;/// 인증번호 보내기 요청. passed면 [phoneCodeExpiresAt]까지 번호를 받는다.
 CheckStatus get phoneCodeRequest; DateTime? get phoneCodeExpiresAt; String get phoneCode;/// 인증번호 확인. passed면 휴대폰 인증 완료.
 CheckStatus get phoneCheck; String get mailOrderNumber; Set<StockType> get stockTypes; MonthlyBroadcasts? get monthlyBroadcasts;// ── 3 채널 ──
 String get channelName; CheckStatus get channelNameCheck; String get channelIntro; ChannelCategory? get category; BroadcastMode get broadcastMode;// ── 4 정산·약관 ──
 SettlementBank? get bank; String get accountNumber; CheckStatus get accountCheck; String get taxInvoiceEmail; Set<SellerAgreement> get agreements;/// 심사 신청 요청 중. 성공하면 화면이 닫힐 때까지 true로 둔다.
 bool get isSubmitting;
/// Create a copy of SellerApplicationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerApplicationStateCopyWith<SellerApplicationState> get copyWith => _$SellerApplicationStateCopyWithImpl<SellerApplicationState>(this as SellerApplicationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerApplicationState&&(identical(other.step, step) || other.step == step)&&(identical(other.sellerType, sellerType) || other.sellerType == sellerType)&&(identical(other.businessNumber, businessNumber) || other.businessNumber == businessNumber)&&(identical(other.businessNumberCheck, businessNumberCheck) || other.businessNumberCheck == businessNumberCheck)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.representativeName, representativeName) || other.representativeName == representativeName)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.phoneCodeRequest, phoneCodeRequest) || other.phoneCodeRequest == phoneCodeRequest)&&(identical(other.phoneCodeExpiresAt, phoneCodeExpiresAt) || other.phoneCodeExpiresAt == phoneCodeExpiresAt)&&(identical(other.phoneCode, phoneCode) || other.phoneCode == phoneCode)&&(identical(other.phoneCheck, phoneCheck) || other.phoneCheck == phoneCheck)&&(identical(other.mailOrderNumber, mailOrderNumber) || other.mailOrderNumber == mailOrderNumber)&&const DeepCollectionEquality().equals(other.stockTypes, stockTypes)&&(identical(other.monthlyBroadcasts, monthlyBroadcasts) || other.monthlyBroadcasts == monthlyBroadcasts)&&(identical(other.channelName, channelName) || other.channelName == channelName)&&(identical(other.channelNameCheck, channelNameCheck) || other.channelNameCheck == channelNameCheck)&&(identical(other.channelIntro, channelIntro) || other.channelIntro == channelIntro)&&(identical(other.category, category) || other.category == category)&&(identical(other.broadcastMode, broadcastMode) || other.broadcastMode == broadcastMode)&&(identical(other.bank, bank) || other.bank == bank)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.accountCheck, accountCheck) || other.accountCheck == accountCheck)&&(identical(other.taxInvoiceEmail, taxInvoiceEmail) || other.taxInvoiceEmail == taxInvoiceEmail)&&const DeepCollectionEquality().equals(other.agreements, agreements)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting));
}


@override
int get hashCode => Object.hashAll([runtimeType,step,sellerType,businessNumber,businessNumberCheck,companyName,representativeName,contactPhone,phoneCodeRequest,phoneCodeExpiresAt,phoneCode,phoneCheck,mailOrderNumber,const DeepCollectionEquality().hash(stockTypes),monthlyBroadcasts,channelName,channelNameCheck,channelIntro,category,broadcastMode,bank,accountNumber,accountCheck,taxInvoiceEmail,const DeepCollectionEquality().hash(agreements),isSubmitting]);

@override
String toString() {
  return 'SellerApplicationState(step: $step, sellerType: $sellerType, businessNumber: $businessNumber, businessNumberCheck: $businessNumberCheck, companyName: $companyName, representativeName: $representativeName, contactPhone: $contactPhone, phoneCodeRequest: $phoneCodeRequest, phoneCodeExpiresAt: $phoneCodeExpiresAt, phoneCode: $phoneCode, phoneCheck: $phoneCheck, mailOrderNumber: $mailOrderNumber, stockTypes: $stockTypes, monthlyBroadcasts: $monthlyBroadcasts, channelName: $channelName, channelNameCheck: $channelNameCheck, channelIntro: $channelIntro, category: $category, broadcastMode: $broadcastMode, bank: $bank, accountNumber: $accountNumber, accountCheck: $accountCheck, taxInvoiceEmail: $taxInvoiceEmail, agreements: $agreements, isSubmitting: $isSubmitting)';
}


}

/// @nodoc
abstract mixin class $SellerApplicationStateCopyWith<$Res>  {
  factory $SellerApplicationStateCopyWith(SellerApplicationState value, $Res Function(SellerApplicationState) _then) = _$SellerApplicationStateCopyWithImpl;
@useResult
$Res call({
 SellerApplicationStep step, SellerType sellerType, String businessNumber, CheckStatus businessNumberCheck, String companyName, String representativeName, String contactPhone, CheckStatus phoneCodeRequest, DateTime? phoneCodeExpiresAt, String phoneCode, CheckStatus phoneCheck, String mailOrderNumber, Set<StockType> stockTypes, MonthlyBroadcasts? monthlyBroadcasts, String channelName, CheckStatus channelNameCheck, String channelIntro, ChannelCategory? category, BroadcastMode broadcastMode, SettlementBank? bank, String accountNumber, CheckStatus accountCheck, String taxInvoiceEmail, Set<SellerAgreement> agreements, bool isSubmitting
});


$SettlementBankCopyWith<$Res>? get bank;

}
/// @nodoc
class _$SellerApplicationStateCopyWithImpl<$Res>
    implements $SellerApplicationStateCopyWith<$Res> {
  _$SellerApplicationStateCopyWithImpl(this._self, this._then);

  final SellerApplicationState _self;
  final $Res Function(SellerApplicationState) _then;

/// Create a copy of SellerApplicationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? sellerType = null,Object? businessNumber = null,Object? businessNumberCheck = null,Object? companyName = null,Object? representativeName = null,Object? contactPhone = null,Object? phoneCodeRequest = null,Object? phoneCodeExpiresAt = freezed,Object? phoneCode = null,Object? phoneCheck = null,Object? mailOrderNumber = null,Object? stockTypes = null,Object? monthlyBroadcasts = freezed,Object? channelName = null,Object? channelNameCheck = null,Object? channelIntro = null,Object? category = freezed,Object? broadcastMode = null,Object? bank = freezed,Object? accountNumber = null,Object? accountCheck = null,Object? taxInvoiceEmail = null,Object? agreements = null,Object? isSubmitting = null,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as SellerApplicationStep,sellerType: null == sellerType ? _self.sellerType : sellerType // ignore: cast_nullable_to_non_nullable
as SellerType,businessNumber: null == businessNumber ? _self.businessNumber : businessNumber // ignore: cast_nullable_to_non_nullable
as String,businessNumberCheck: null == businessNumberCheck ? _self.businessNumberCheck : businessNumberCheck // ignore: cast_nullable_to_non_nullable
as CheckStatus,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,representativeName: null == representativeName ? _self.representativeName : representativeName // ignore: cast_nullable_to_non_nullable
as String,contactPhone: null == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String,phoneCodeRequest: null == phoneCodeRequest ? _self.phoneCodeRequest : phoneCodeRequest // ignore: cast_nullable_to_non_nullable
as CheckStatus,phoneCodeExpiresAt: freezed == phoneCodeExpiresAt ? _self.phoneCodeExpiresAt : phoneCodeExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,phoneCode: null == phoneCode ? _self.phoneCode : phoneCode // ignore: cast_nullable_to_non_nullable
as String,phoneCheck: null == phoneCheck ? _self.phoneCheck : phoneCheck // ignore: cast_nullable_to_non_nullable
as CheckStatus,mailOrderNumber: null == mailOrderNumber ? _self.mailOrderNumber : mailOrderNumber // ignore: cast_nullable_to_non_nullable
as String,stockTypes: null == stockTypes ? _self.stockTypes : stockTypes // ignore: cast_nullable_to_non_nullable
as Set<StockType>,monthlyBroadcasts: freezed == monthlyBroadcasts ? _self.monthlyBroadcasts : monthlyBroadcasts // ignore: cast_nullable_to_non_nullable
as MonthlyBroadcasts?,channelName: null == channelName ? _self.channelName : channelName // ignore: cast_nullable_to_non_nullable
as String,channelNameCheck: null == channelNameCheck ? _self.channelNameCheck : channelNameCheck // ignore: cast_nullable_to_non_nullable
as CheckStatus,channelIntro: null == channelIntro ? _self.channelIntro : channelIntro // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ChannelCategory?,broadcastMode: null == broadcastMode ? _self.broadcastMode : broadcastMode // ignore: cast_nullable_to_non_nullable
as BroadcastMode,bank: freezed == bank ? _self.bank : bank // ignore: cast_nullable_to_non_nullable
as SettlementBank?,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,accountCheck: null == accountCheck ? _self.accountCheck : accountCheck // ignore: cast_nullable_to_non_nullable
as CheckStatus,taxInvoiceEmail: null == taxInvoiceEmail ? _self.taxInvoiceEmail : taxInvoiceEmail // ignore: cast_nullable_to_non_nullable
as String,agreements: null == agreements ? _self.agreements : agreements // ignore: cast_nullable_to_non_nullable
as Set<SellerAgreement>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of SellerApplicationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettlementBankCopyWith<$Res>? get bank {
    if (_self.bank == null) {
    return null;
  }

  return $SettlementBankCopyWith<$Res>(_self.bank!, (value) {
    return _then(_self.copyWith(bank: value));
  });
}
}


/// Adds pattern-matching-related methods to [SellerApplicationState].
extension SellerApplicationStatePatterns on SellerApplicationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerApplicationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerApplicationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerApplicationState value)  $default,){
final _that = this;
switch (_that) {
case _SellerApplicationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerApplicationState value)?  $default,){
final _that = this;
switch (_that) {
case _SellerApplicationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SellerApplicationStep step,  SellerType sellerType,  String businessNumber,  CheckStatus businessNumberCheck,  String companyName,  String representativeName,  String contactPhone,  CheckStatus phoneCodeRequest,  DateTime? phoneCodeExpiresAt,  String phoneCode,  CheckStatus phoneCheck,  String mailOrderNumber,  Set<StockType> stockTypes,  MonthlyBroadcasts? monthlyBroadcasts,  String channelName,  CheckStatus channelNameCheck,  String channelIntro,  ChannelCategory? category,  BroadcastMode broadcastMode,  SettlementBank? bank,  String accountNumber,  CheckStatus accountCheck,  String taxInvoiceEmail,  Set<SellerAgreement> agreements,  bool isSubmitting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerApplicationState() when $default != null:
return $default(_that.step,_that.sellerType,_that.businessNumber,_that.businessNumberCheck,_that.companyName,_that.representativeName,_that.contactPhone,_that.phoneCodeRequest,_that.phoneCodeExpiresAt,_that.phoneCode,_that.phoneCheck,_that.mailOrderNumber,_that.stockTypes,_that.monthlyBroadcasts,_that.channelName,_that.channelNameCheck,_that.channelIntro,_that.category,_that.broadcastMode,_that.bank,_that.accountNumber,_that.accountCheck,_that.taxInvoiceEmail,_that.agreements,_that.isSubmitting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SellerApplicationStep step,  SellerType sellerType,  String businessNumber,  CheckStatus businessNumberCheck,  String companyName,  String representativeName,  String contactPhone,  CheckStatus phoneCodeRequest,  DateTime? phoneCodeExpiresAt,  String phoneCode,  CheckStatus phoneCheck,  String mailOrderNumber,  Set<StockType> stockTypes,  MonthlyBroadcasts? monthlyBroadcasts,  String channelName,  CheckStatus channelNameCheck,  String channelIntro,  ChannelCategory? category,  BroadcastMode broadcastMode,  SettlementBank? bank,  String accountNumber,  CheckStatus accountCheck,  String taxInvoiceEmail,  Set<SellerAgreement> agreements,  bool isSubmitting)  $default,) {final _that = this;
switch (_that) {
case _SellerApplicationState():
return $default(_that.step,_that.sellerType,_that.businessNumber,_that.businessNumberCheck,_that.companyName,_that.representativeName,_that.contactPhone,_that.phoneCodeRequest,_that.phoneCodeExpiresAt,_that.phoneCode,_that.phoneCheck,_that.mailOrderNumber,_that.stockTypes,_that.monthlyBroadcasts,_that.channelName,_that.channelNameCheck,_that.channelIntro,_that.category,_that.broadcastMode,_that.bank,_that.accountNumber,_that.accountCheck,_that.taxInvoiceEmail,_that.agreements,_that.isSubmitting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SellerApplicationStep step,  SellerType sellerType,  String businessNumber,  CheckStatus businessNumberCheck,  String companyName,  String representativeName,  String contactPhone,  CheckStatus phoneCodeRequest,  DateTime? phoneCodeExpiresAt,  String phoneCode,  CheckStatus phoneCheck,  String mailOrderNumber,  Set<StockType> stockTypes,  MonthlyBroadcasts? monthlyBroadcasts,  String channelName,  CheckStatus channelNameCheck,  String channelIntro,  ChannelCategory? category,  BroadcastMode broadcastMode,  SettlementBank? bank,  String accountNumber,  CheckStatus accountCheck,  String taxInvoiceEmail,  Set<SellerAgreement> agreements,  bool isSubmitting)?  $default,) {final _that = this;
switch (_that) {
case _SellerApplicationState() when $default != null:
return $default(_that.step,_that.sellerType,_that.businessNumber,_that.businessNumberCheck,_that.companyName,_that.representativeName,_that.contactPhone,_that.phoneCodeRequest,_that.phoneCodeExpiresAt,_that.phoneCode,_that.phoneCheck,_that.mailOrderNumber,_that.stockTypes,_that.monthlyBroadcasts,_that.channelName,_that.channelNameCheck,_that.channelIntro,_that.category,_that.broadcastMode,_that.bank,_that.accountNumber,_that.accountCheck,_that.taxInvoiceEmail,_that.agreements,_that.isSubmitting);case _:
  return null;

}
}

}

/// @nodoc


class _SellerApplicationState extends SellerApplicationState {
  const _SellerApplicationState({this.step = SellerApplicationStep.type, this.sellerType = SellerType.business, this.businessNumber = '', this.businessNumberCheck = CheckStatus.idle, this.companyName = '', this.representativeName = '', this.contactPhone = '', this.phoneCodeRequest = CheckStatus.idle, this.phoneCodeExpiresAt, this.phoneCode = '', this.phoneCheck = CheckStatus.idle, this.mailOrderNumber = '', final  Set<StockType> stockTypes = const <StockType>{}, this.monthlyBroadcasts, this.channelName = '', this.channelNameCheck = CheckStatus.idle, this.channelIntro = '', this.category, this.broadcastMode = BroadcastMode.official, this.bank, this.accountNumber = '', this.accountCheck = CheckStatus.idle, this.taxInvoiceEmail = '', final  Set<SellerAgreement> agreements = const <SellerAgreement>{}, this.isSubmitting = false}): _stockTypes = stockTypes,_agreements = agreements,super._();
  

@override@JsonKey() final  SellerApplicationStep step;
// ── 1 유형 ──
@override@JsonKey() final  SellerType sellerType;
// ── 2 사업자 ──
@override@JsonKey() final  String businessNumber;
@override@JsonKey() final  CheckStatus businessNumberCheck;
@override@JsonKey() final  String companyName;
@override@JsonKey() final  String representativeName;
@override@JsonKey() final  String contactPhone;
/// 인증번호 보내기 요청. passed면 [phoneCodeExpiresAt]까지 번호를 받는다.
@override@JsonKey() final  CheckStatus phoneCodeRequest;
@override final  DateTime? phoneCodeExpiresAt;
@override@JsonKey() final  String phoneCode;
/// 인증번호 확인. passed면 휴대폰 인증 완료.
@override@JsonKey() final  CheckStatus phoneCheck;
@override@JsonKey() final  String mailOrderNumber;
 final  Set<StockType> _stockTypes;
@override@JsonKey() Set<StockType> get stockTypes {
  if (_stockTypes is EqualUnmodifiableSetView) return _stockTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_stockTypes);
}

@override final  MonthlyBroadcasts? monthlyBroadcasts;
// ── 3 채널 ──
@override@JsonKey() final  String channelName;
@override@JsonKey() final  CheckStatus channelNameCheck;
@override@JsonKey() final  String channelIntro;
@override final  ChannelCategory? category;
@override@JsonKey() final  BroadcastMode broadcastMode;
// ── 4 정산·약관 ──
@override final  SettlementBank? bank;
@override@JsonKey() final  String accountNumber;
@override@JsonKey() final  CheckStatus accountCheck;
@override@JsonKey() final  String taxInvoiceEmail;
 final  Set<SellerAgreement> _agreements;
@override@JsonKey() Set<SellerAgreement> get agreements {
  if (_agreements is EqualUnmodifiableSetView) return _agreements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_agreements);
}

/// 심사 신청 요청 중. 성공하면 화면이 닫힐 때까지 true로 둔다.
@override@JsonKey() final  bool isSubmitting;

/// Create a copy of SellerApplicationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerApplicationStateCopyWith<_SellerApplicationState> get copyWith => __$SellerApplicationStateCopyWithImpl<_SellerApplicationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerApplicationState&&(identical(other.step, step) || other.step == step)&&(identical(other.sellerType, sellerType) || other.sellerType == sellerType)&&(identical(other.businessNumber, businessNumber) || other.businessNumber == businessNumber)&&(identical(other.businessNumberCheck, businessNumberCheck) || other.businessNumberCheck == businessNumberCheck)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.representativeName, representativeName) || other.representativeName == representativeName)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.phoneCodeRequest, phoneCodeRequest) || other.phoneCodeRequest == phoneCodeRequest)&&(identical(other.phoneCodeExpiresAt, phoneCodeExpiresAt) || other.phoneCodeExpiresAt == phoneCodeExpiresAt)&&(identical(other.phoneCode, phoneCode) || other.phoneCode == phoneCode)&&(identical(other.phoneCheck, phoneCheck) || other.phoneCheck == phoneCheck)&&(identical(other.mailOrderNumber, mailOrderNumber) || other.mailOrderNumber == mailOrderNumber)&&const DeepCollectionEquality().equals(other._stockTypes, _stockTypes)&&(identical(other.monthlyBroadcasts, monthlyBroadcasts) || other.monthlyBroadcasts == monthlyBroadcasts)&&(identical(other.channelName, channelName) || other.channelName == channelName)&&(identical(other.channelNameCheck, channelNameCheck) || other.channelNameCheck == channelNameCheck)&&(identical(other.channelIntro, channelIntro) || other.channelIntro == channelIntro)&&(identical(other.category, category) || other.category == category)&&(identical(other.broadcastMode, broadcastMode) || other.broadcastMode == broadcastMode)&&(identical(other.bank, bank) || other.bank == bank)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.accountCheck, accountCheck) || other.accountCheck == accountCheck)&&(identical(other.taxInvoiceEmail, taxInvoiceEmail) || other.taxInvoiceEmail == taxInvoiceEmail)&&const DeepCollectionEquality().equals(other._agreements, _agreements)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting));
}


@override
int get hashCode => Object.hashAll([runtimeType,step,sellerType,businessNumber,businessNumberCheck,companyName,representativeName,contactPhone,phoneCodeRequest,phoneCodeExpiresAt,phoneCode,phoneCheck,mailOrderNumber,const DeepCollectionEquality().hash(_stockTypes),monthlyBroadcasts,channelName,channelNameCheck,channelIntro,category,broadcastMode,bank,accountNumber,accountCheck,taxInvoiceEmail,const DeepCollectionEquality().hash(_agreements),isSubmitting]);

@override
String toString() {
  return 'SellerApplicationState(step: $step, sellerType: $sellerType, businessNumber: $businessNumber, businessNumberCheck: $businessNumberCheck, companyName: $companyName, representativeName: $representativeName, contactPhone: $contactPhone, phoneCodeRequest: $phoneCodeRequest, phoneCodeExpiresAt: $phoneCodeExpiresAt, phoneCode: $phoneCode, phoneCheck: $phoneCheck, mailOrderNumber: $mailOrderNumber, stockTypes: $stockTypes, monthlyBroadcasts: $monthlyBroadcasts, channelName: $channelName, channelNameCheck: $channelNameCheck, channelIntro: $channelIntro, category: $category, broadcastMode: $broadcastMode, bank: $bank, accountNumber: $accountNumber, accountCheck: $accountCheck, taxInvoiceEmail: $taxInvoiceEmail, agreements: $agreements, isSubmitting: $isSubmitting)';
}


}

/// @nodoc
abstract mixin class _$SellerApplicationStateCopyWith<$Res> implements $SellerApplicationStateCopyWith<$Res> {
  factory _$SellerApplicationStateCopyWith(_SellerApplicationState value, $Res Function(_SellerApplicationState) _then) = __$SellerApplicationStateCopyWithImpl;
@override @useResult
$Res call({
 SellerApplicationStep step, SellerType sellerType, String businessNumber, CheckStatus businessNumberCheck, String companyName, String representativeName, String contactPhone, CheckStatus phoneCodeRequest, DateTime? phoneCodeExpiresAt, String phoneCode, CheckStatus phoneCheck, String mailOrderNumber, Set<StockType> stockTypes, MonthlyBroadcasts? monthlyBroadcasts, String channelName, CheckStatus channelNameCheck, String channelIntro, ChannelCategory? category, BroadcastMode broadcastMode, SettlementBank? bank, String accountNumber, CheckStatus accountCheck, String taxInvoiceEmail, Set<SellerAgreement> agreements, bool isSubmitting
});


@override $SettlementBankCopyWith<$Res>? get bank;

}
/// @nodoc
class __$SellerApplicationStateCopyWithImpl<$Res>
    implements _$SellerApplicationStateCopyWith<$Res> {
  __$SellerApplicationStateCopyWithImpl(this._self, this._then);

  final _SellerApplicationState _self;
  final $Res Function(_SellerApplicationState) _then;

/// Create a copy of SellerApplicationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? sellerType = null,Object? businessNumber = null,Object? businessNumberCheck = null,Object? companyName = null,Object? representativeName = null,Object? contactPhone = null,Object? phoneCodeRequest = null,Object? phoneCodeExpiresAt = freezed,Object? phoneCode = null,Object? phoneCheck = null,Object? mailOrderNumber = null,Object? stockTypes = null,Object? monthlyBroadcasts = freezed,Object? channelName = null,Object? channelNameCheck = null,Object? channelIntro = null,Object? category = freezed,Object? broadcastMode = null,Object? bank = freezed,Object? accountNumber = null,Object? accountCheck = null,Object? taxInvoiceEmail = null,Object? agreements = null,Object? isSubmitting = null,}) {
  return _then(_SellerApplicationState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as SellerApplicationStep,sellerType: null == sellerType ? _self.sellerType : sellerType // ignore: cast_nullable_to_non_nullable
as SellerType,businessNumber: null == businessNumber ? _self.businessNumber : businessNumber // ignore: cast_nullable_to_non_nullable
as String,businessNumberCheck: null == businessNumberCheck ? _self.businessNumberCheck : businessNumberCheck // ignore: cast_nullable_to_non_nullable
as CheckStatus,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,representativeName: null == representativeName ? _self.representativeName : representativeName // ignore: cast_nullable_to_non_nullable
as String,contactPhone: null == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String,phoneCodeRequest: null == phoneCodeRequest ? _self.phoneCodeRequest : phoneCodeRequest // ignore: cast_nullable_to_non_nullable
as CheckStatus,phoneCodeExpiresAt: freezed == phoneCodeExpiresAt ? _self.phoneCodeExpiresAt : phoneCodeExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,phoneCode: null == phoneCode ? _self.phoneCode : phoneCode // ignore: cast_nullable_to_non_nullable
as String,phoneCheck: null == phoneCheck ? _self.phoneCheck : phoneCheck // ignore: cast_nullable_to_non_nullable
as CheckStatus,mailOrderNumber: null == mailOrderNumber ? _self.mailOrderNumber : mailOrderNumber // ignore: cast_nullable_to_non_nullable
as String,stockTypes: null == stockTypes ? _self._stockTypes : stockTypes // ignore: cast_nullable_to_non_nullable
as Set<StockType>,monthlyBroadcasts: freezed == monthlyBroadcasts ? _self.monthlyBroadcasts : monthlyBroadcasts // ignore: cast_nullable_to_non_nullable
as MonthlyBroadcasts?,channelName: null == channelName ? _self.channelName : channelName // ignore: cast_nullable_to_non_nullable
as String,channelNameCheck: null == channelNameCheck ? _self.channelNameCheck : channelNameCheck // ignore: cast_nullable_to_non_nullable
as CheckStatus,channelIntro: null == channelIntro ? _self.channelIntro : channelIntro // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ChannelCategory?,broadcastMode: null == broadcastMode ? _self.broadcastMode : broadcastMode // ignore: cast_nullable_to_non_nullable
as BroadcastMode,bank: freezed == bank ? _self.bank : bank // ignore: cast_nullable_to_non_nullable
as SettlementBank?,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,accountCheck: null == accountCheck ? _self.accountCheck : accountCheck // ignore: cast_nullable_to_non_nullable
as CheckStatus,taxInvoiceEmail: null == taxInvoiceEmail ? _self.taxInvoiceEmail : taxInvoiceEmail // ignore: cast_nullable_to_non_nullable
as String,agreements: null == agreements ? _self._agreements : agreements // ignore: cast_nullable_to_non_nullable
as Set<SellerAgreement>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SellerApplicationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettlementBankCopyWith<$Res>? get bank {
    if (_self.bank == null) {
    return null;
  }

  return $SettlementBankCopyWith<$Res>(_self.bank!, (value) {
    return _then(_self.copyWith(bank: value));
  });
}
}

// dart format on
