// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignUpState {

 String get username; CheckStatus get usernameCheck; String get password; String get passwordConfirm;/// 이메일 "@" 앞부분.
 String get emailLocal; String? get emailDomain;/// 숫자만 ("01012345678").
 String get phone;/// 인증번호 보내기 요청. passed면 [phoneCodeExpiresAt]까지 번호를 받는다.
 CheckStatus get phoneCodeRequest; DateTime? get phoneCodeExpiresAt; String get phoneCode;/// 인증번호 확인. passed면 휴대폰 인증 완료.
 CheckStatus get phoneCheck; Set<SignUpAgreement> get agreements;/// 가입 요청 중. 성공하면 화면이 닫힐 때까지 true로 둔다.
 bool get isSubmitting;
/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpStateCopyWith<SignUpState> get copyWith => _$SignUpStateCopyWithImpl<SignUpState>(this as SignUpState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpState&&(identical(other.username, username) || other.username == username)&&(identical(other.usernameCheck, usernameCheck) || other.usernameCheck == usernameCheck)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirm, passwordConfirm) || other.passwordConfirm == passwordConfirm)&&(identical(other.emailLocal, emailLocal) || other.emailLocal == emailLocal)&&(identical(other.emailDomain, emailDomain) || other.emailDomain == emailDomain)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phoneCodeRequest, phoneCodeRequest) || other.phoneCodeRequest == phoneCodeRequest)&&(identical(other.phoneCodeExpiresAt, phoneCodeExpiresAt) || other.phoneCodeExpiresAt == phoneCodeExpiresAt)&&(identical(other.phoneCode, phoneCode) || other.phoneCode == phoneCode)&&(identical(other.phoneCheck, phoneCheck) || other.phoneCheck == phoneCheck)&&const DeepCollectionEquality().equals(other.agreements, agreements)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting));
}


@override
int get hashCode => Object.hash(runtimeType,username,usernameCheck,password,passwordConfirm,emailLocal,emailDomain,phone,phoneCodeRequest,phoneCodeExpiresAt,phoneCode,phoneCheck,const DeepCollectionEquality().hash(agreements),isSubmitting);



}

/// @nodoc
abstract mixin class $SignUpStateCopyWith<$Res>  {
  factory $SignUpStateCopyWith(SignUpState value, $Res Function(SignUpState) _then) = _$SignUpStateCopyWithImpl;
@useResult
$Res call({
 String username, CheckStatus usernameCheck, String password, String passwordConfirm, String emailLocal, String? emailDomain, String phone, CheckStatus phoneCodeRequest, DateTime? phoneCodeExpiresAt, String phoneCode, CheckStatus phoneCheck, Set<SignUpAgreement> agreements, bool isSubmitting
});




}
/// @nodoc
class _$SignUpStateCopyWithImpl<$Res>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._self, this._then);

  final SignUpState _self;
  final $Res Function(SignUpState) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? usernameCheck = null,Object? password = null,Object? passwordConfirm = null,Object? emailLocal = null,Object? emailDomain = freezed,Object? phone = null,Object? phoneCodeRequest = null,Object? phoneCodeExpiresAt = freezed,Object? phoneCode = null,Object? phoneCheck = null,Object? agreements = null,Object? isSubmitting = null,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,usernameCheck: null == usernameCheck ? _self.usernameCheck : usernameCheck // ignore: cast_nullable_to_non_nullable
as CheckStatus,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirm: null == passwordConfirm ? _self.passwordConfirm : passwordConfirm // ignore: cast_nullable_to_non_nullable
as String,emailLocal: null == emailLocal ? _self.emailLocal : emailLocal // ignore: cast_nullable_to_non_nullable
as String,emailDomain: freezed == emailDomain ? _self.emailDomain : emailDomain // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneCodeRequest: null == phoneCodeRequest ? _self.phoneCodeRequest : phoneCodeRequest // ignore: cast_nullable_to_non_nullable
as CheckStatus,phoneCodeExpiresAt: freezed == phoneCodeExpiresAt ? _self.phoneCodeExpiresAt : phoneCodeExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,phoneCode: null == phoneCode ? _self.phoneCode : phoneCode // ignore: cast_nullable_to_non_nullable
as String,phoneCheck: null == phoneCheck ? _self.phoneCheck : phoneCheck // ignore: cast_nullable_to_non_nullable
as CheckStatus,agreements: null == agreements ? _self.agreements : agreements // ignore: cast_nullable_to_non_nullable
as Set<SignUpAgreement>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SignUpState].
extension SignUpStatePatterns on SignUpState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpState value)  $default,){
final _that = this;
switch (_that) {
case _SignUpState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpState value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username,  CheckStatus usernameCheck,  String password,  String passwordConfirm,  String emailLocal,  String? emailDomain,  String phone,  CheckStatus phoneCodeRequest,  DateTime? phoneCodeExpiresAt,  String phoneCode,  CheckStatus phoneCheck,  Set<SignUpAgreement> agreements,  bool isSubmitting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpState() when $default != null:
return $default(_that.username,_that.usernameCheck,_that.password,_that.passwordConfirm,_that.emailLocal,_that.emailDomain,_that.phone,_that.phoneCodeRequest,_that.phoneCodeExpiresAt,_that.phoneCode,_that.phoneCheck,_that.agreements,_that.isSubmitting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username,  CheckStatus usernameCheck,  String password,  String passwordConfirm,  String emailLocal,  String? emailDomain,  String phone,  CheckStatus phoneCodeRequest,  DateTime? phoneCodeExpiresAt,  String phoneCode,  CheckStatus phoneCheck,  Set<SignUpAgreement> agreements,  bool isSubmitting)  $default,) {final _that = this;
switch (_that) {
case _SignUpState():
return $default(_that.username,_that.usernameCheck,_that.password,_that.passwordConfirm,_that.emailLocal,_that.emailDomain,_that.phone,_that.phoneCodeRequest,_that.phoneCodeExpiresAt,_that.phoneCode,_that.phoneCheck,_that.agreements,_that.isSubmitting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username,  CheckStatus usernameCheck,  String password,  String passwordConfirm,  String emailLocal,  String? emailDomain,  String phone,  CheckStatus phoneCodeRequest,  DateTime? phoneCodeExpiresAt,  String phoneCode,  CheckStatus phoneCheck,  Set<SignUpAgreement> agreements,  bool isSubmitting)?  $default,) {final _that = this;
switch (_that) {
case _SignUpState() when $default != null:
return $default(_that.username,_that.usernameCheck,_that.password,_that.passwordConfirm,_that.emailLocal,_that.emailDomain,_that.phone,_that.phoneCodeRequest,_that.phoneCodeExpiresAt,_that.phoneCode,_that.phoneCheck,_that.agreements,_that.isSubmitting);case _:
  return null;

}
}

}

/// @nodoc


class _SignUpState extends SignUpState {
  const _SignUpState({this.username = '', this.usernameCheck = CheckStatus.idle, this.password = '', this.passwordConfirm = '', this.emailLocal = '', this.emailDomain, this.phone = '', this.phoneCodeRequest = CheckStatus.idle, this.phoneCodeExpiresAt, this.phoneCode = '', this.phoneCheck = CheckStatus.idle, final  Set<SignUpAgreement> agreements = const <SignUpAgreement>{}, this.isSubmitting = false}): _agreements = agreements,super._();
  

@override@JsonKey() final  String username;
@override@JsonKey() final  CheckStatus usernameCheck;
@override@JsonKey() final  String password;
@override@JsonKey() final  String passwordConfirm;
/// 이메일 "@" 앞부분.
@override@JsonKey() final  String emailLocal;
@override final  String? emailDomain;
/// 숫자만 ("01012345678").
@override@JsonKey() final  String phone;
/// 인증번호 보내기 요청. passed면 [phoneCodeExpiresAt]까지 번호를 받는다.
@override@JsonKey() final  CheckStatus phoneCodeRequest;
@override final  DateTime? phoneCodeExpiresAt;
@override@JsonKey() final  String phoneCode;
/// 인증번호 확인. passed면 휴대폰 인증 완료.
@override@JsonKey() final  CheckStatus phoneCheck;
 final  Set<SignUpAgreement> _agreements;
@override@JsonKey() Set<SignUpAgreement> get agreements {
  if (_agreements is EqualUnmodifiableSetView) return _agreements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_agreements);
}

/// 가입 요청 중. 성공하면 화면이 닫힐 때까지 true로 둔다.
@override@JsonKey() final  bool isSubmitting;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpStateCopyWith<_SignUpState> get copyWith => __$SignUpStateCopyWithImpl<_SignUpState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpState&&(identical(other.username, username) || other.username == username)&&(identical(other.usernameCheck, usernameCheck) || other.usernameCheck == usernameCheck)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordConfirm, passwordConfirm) || other.passwordConfirm == passwordConfirm)&&(identical(other.emailLocal, emailLocal) || other.emailLocal == emailLocal)&&(identical(other.emailDomain, emailDomain) || other.emailDomain == emailDomain)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phoneCodeRequest, phoneCodeRequest) || other.phoneCodeRequest == phoneCodeRequest)&&(identical(other.phoneCodeExpiresAt, phoneCodeExpiresAt) || other.phoneCodeExpiresAt == phoneCodeExpiresAt)&&(identical(other.phoneCode, phoneCode) || other.phoneCode == phoneCode)&&(identical(other.phoneCheck, phoneCheck) || other.phoneCheck == phoneCheck)&&const DeepCollectionEquality().equals(other._agreements, _agreements)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting));
}


@override
int get hashCode => Object.hash(runtimeType,username,usernameCheck,password,passwordConfirm,emailLocal,emailDomain,phone,phoneCodeRequest,phoneCodeExpiresAt,phoneCode,phoneCheck,const DeepCollectionEquality().hash(_agreements),isSubmitting);



}

/// @nodoc
abstract mixin class _$SignUpStateCopyWith<$Res> implements $SignUpStateCopyWith<$Res> {
  factory _$SignUpStateCopyWith(_SignUpState value, $Res Function(_SignUpState) _then) = __$SignUpStateCopyWithImpl;
@override @useResult
$Res call({
 String username, CheckStatus usernameCheck, String password, String passwordConfirm, String emailLocal, String? emailDomain, String phone, CheckStatus phoneCodeRequest, DateTime? phoneCodeExpiresAt, String phoneCode, CheckStatus phoneCheck, Set<SignUpAgreement> agreements, bool isSubmitting
});




}
/// @nodoc
class __$SignUpStateCopyWithImpl<$Res>
    implements _$SignUpStateCopyWith<$Res> {
  __$SignUpStateCopyWithImpl(this._self, this._then);

  final _SignUpState _self;
  final $Res Function(_SignUpState) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? usernameCheck = null,Object? password = null,Object? passwordConfirm = null,Object? emailLocal = null,Object? emailDomain = freezed,Object? phone = null,Object? phoneCodeRequest = null,Object? phoneCodeExpiresAt = freezed,Object? phoneCode = null,Object? phoneCheck = null,Object? agreements = null,Object? isSubmitting = null,}) {
  return _then(_SignUpState(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,usernameCheck: null == usernameCheck ? _self.usernameCheck : usernameCheck // ignore: cast_nullable_to_non_nullable
as CheckStatus,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordConfirm: null == passwordConfirm ? _self.passwordConfirm : passwordConfirm // ignore: cast_nullable_to_non_nullable
as String,emailLocal: null == emailLocal ? _self.emailLocal : emailLocal // ignore: cast_nullable_to_non_nullable
as String,emailDomain: freezed == emailDomain ? _self.emailDomain : emailDomain // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneCodeRequest: null == phoneCodeRequest ? _self.phoneCodeRequest : phoneCodeRequest // ignore: cast_nullable_to_non_nullable
as CheckStatus,phoneCodeExpiresAt: freezed == phoneCodeExpiresAt ? _self.phoneCodeExpiresAt : phoneCodeExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,phoneCode: null == phoneCode ? _self.phoneCode : phoneCode // ignore: cast_nullable_to_non_nullable
as String,phoneCheck: null == phoneCheck ? _self.phoneCheck : phoneCheck // ignore: cast_nullable_to_non_nullable
as CheckStatus,agreements: null == agreements ? _self._agreements : agreements // ignore: cast_nullable_to_non_nullable
as Set<SignUpAgreement>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
