// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auction_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuctionDetail {

/// 상품을 올린 판매자. 이름 옆 "공식" 뱃지는 [LiveSeller.isOfficial]을 따른다.
 LiveSeller get seller; LiveAuctionItem get item;/// 이 상품의 입찰 현황. 아직 입찰이 시작되지 않았으면 null.
 LiveBidStatus? get bidStatus;/// 낙찰 시 결제할 등록 결제수단 표시 ("국민 ****1234"). null이면 안내 문구를 숨긴다.
 String? get paymentMethodLabel;
/// Create a copy of AuctionDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuctionDetailCopyWith<AuctionDetail> get copyWith => _$AuctionDetailCopyWithImpl<AuctionDetail>(this as AuctionDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuctionDetail&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.item, item) || other.item == item)&&(identical(other.bidStatus, bidStatus) || other.bidStatus == bidStatus)&&(identical(other.paymentMethodLabel, paymentMethodLabel) || other.paymentMethodLabel == paymentMethodLabel));
}


@override
int get hashCode => Object.hash(runtimeType,seller,item,bidStatus,paymentMethodLabel);

@override
String toString() {
  return 'AuctionDetail(seller: $seller, item: $item, bidStatus: $bidStatus, paymentMethodLabel: $paymentMethodLabel)';
}


}

/// @nodoc
abstract mixin class $AuctionDetailCopyWith<$Res>  {
  factory $AuctionDetailCopyWith(AuctionDetail value, $Res Function(AuctionDetail) _then) = _$AuctionDetailCopyWithImpl;
@useResult
$Res call({
 LiveSeller seller, LiveAuctionItem item, LiveBidStatus? bidStatus, String? paymentMethodLabel
});


$LiveSellerCopyWith<$Res> get seller;$LiveAuctionItemCopyWith<$Res> get item;$LiveBidStatusCopyWith<$Res>? get bidStatus;

}
/// @nodoc
class _$AuctionDetailCopyWithImpl<$Res>
    implements $AuctionDetailCopyWith<$Res> {
  _$AuctionDetailCopyWithImpl(this._self, this._then);

  final AuctionDetail _self;
  final $Res Function(AuctionDetail) _then;

/// Create a copy of AuctionDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seller = null,Object? item = null,Object? bidStatus = freezed,Object? paymentMethodLabel = freezed,}) {
  return _then(_self.copyWith(
seller: null == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as LiveSeller,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as LiveAuctionItem,bidStatus: freezed == bidStatus ? _self.bidStatus : bidStatus // ignore: cast_nullable_to_non_nullable
as LiveBidStatus?,paymentMethodLabel: freezed == paymentMethodLabel ? _self.paymentMethodLabel : paymentMethodLabel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AuctionDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveSellerCopyWith<$Res> get seller {
  
  return $LiveSellerCopyWith<$Res>(_self.seller, (value) {
    return _then(_self.copyWith(seller: value));
  });
}/// Create a copy of AuctionDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveAuctionItemCopyWith<$Res> get item {
  
  return $LiveAuctionItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of AuctionDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveBidStatusCopyWith<$Res>? get bidStatus {
    if (_self.bidStatus == null) {
    return null;
  }

  return $LiveBidStatusCopyWith<$Res>(_self.bidStatus!, (value) {
    return _then(_self.copyWith(bidStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuctionDetail].
extension AuctionDetailPatterns on AuctionDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuctionDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuctionDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuctionDetail value)  $default,){
final _that = this;
switch (_that) {
case _AuctionDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuctionDetail value)?  $default,){
final _that = this;
switch (_that) {
case _AuctionDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LiveSeller seller,  LiveAuctionItem item,  LiveBidStatus? bidStatus,  String? paymentMethodLabel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuctionDetail() when $default != null:
return $default(_that.seller,_that.item,_that.bidStatus,_that.paymentMethodLabel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LiveSeller seller,  LiveAuctionItem item,  LiveBidStatus? bidStatus,  String? paymentMethodLabel)  $default,) {final _that = this;
switch (_that) {
case _AuctionDetail():
return $default(_that.seller,_that.item,_that.bidStatus,_that.paymentMethodLabel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LiveSeller seller,  LiveAuctionItem item,  LiveBidStatus? bidStatus,  String? paymentMethodLabel)?  $default,) {final _that = this;
switch (_that) {
case _AuctionDetail() when $default != null:
return $default(_that.seller,_that.item,_that.bidStatus,_that.paymentMethodLabel);case _:
  return null;

}
}

}

/// @nodoc


class _AuctionDetail implements AuctionDetail {
  const _AuctionDetail({required this.seller, required this.item, this.bidStatus, this.paymentMethodLabel});
  

/// 상품을 올린 판매자. 이름 옆 "공식" 뱃지는 [LiveSeller.isOfficial]을 따른다.
@override final  LiveSeller seller;
@override final  LiveAuctionItem item;
/// 이 상품의 입찰 현황. 아직 입찰이 시작되지 않았으면 null.
@override final  LiveBidStatus? bidStatus;
/// 낙찰 시 결제할 등록 결제수단 표시 ("국민 ****1234"). null이면 안내 문구를 숨긴다.
@override final  String? paymentMethodLabel;

/// Create a copy of AuctionDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuctionDetailCopyWith<_AuctionDetail> get copyWith => __$AuctionDetailCopyWithImpl<_AuctionDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuctionDetail&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.item, item) || other.item == item)&&(identical(other.bidStatus, bidStatus) || other.bidStatus == bidStatus)&&(identical(other.paymentMethodLabel, paymentMethodLabel) || other.paymentMethodLabel == paymentMethodLabel));
}


@override
int get hashCode => Object.hash(runtimeType,seller,item,bidStatus,paymentMethodLabel);

@override
String toString() {
  return 'AuctionDetail(seller: $seller, item: $item, bidStatus: $bidStatus, paymentMethodLabel: $paymentMethodLabel)';
}


}

/// @nodoc
abstract mixin class _$AuctionDetailCopyWith<$Res> implements $AuctionDetailCopyWith<$Res> {
  factory _$AuctionDetailCopyWith(_AuctionDetail value, $Res Function(_AuctionDetail) _then) = __$AuctionDetailCopyWithImpl;
@override @useResult
$Res call({
 LiveSeller seller, LiveAuctionItem item, LiveBidStatus? bidStatus, String? paymentMethodLabel
});


@override $LiveSellerCopyWith<$Res> get seller;@override $LiveAuctionItemCopyWith<$Res> get item;@override $LiveBidStatusCopyWith<$Res>? get bidStatus;

}
/// @nodoc
class __$AuctionDetailCopyWithImpl<$Res>
    implements _$AuctionDetailCopyWith<$Res> {
  __$AuctionDetailCopyWithImpl(this._self, this._then);

  final _AuctionDetail _self;
  final $Res Function(_AuctionDetail) _then;

/// Create a copy of AuctionDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seller = null,Object? item = null,Object? bidStatus = freezed,Object? paymentMethodLabel = freezed,}) {
  return _then(_AuctionDetail(
seller: null == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as LiveSeller,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as LiveAuctionItem,bidStatus: freezed == bidStatus ? _self.bidStatus : bidStatus // ignore: cast_nullable_to_non_nullable
as LiveBidStatus?,paymentMethodLabel: freezed == paymentMethodLabel ? _self.paymentMethodLabel : paymentMethodLabel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AuctionDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveSellerCopyWith<$Res> get seller {
  
  return $LiveSellerCopyWith<$Res>(_self.seller, (value) {
    return _then(_self.copyWith(seller: value));
  });
}/// Create a copy of AuctionDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveAuctionItemCopyWith<$Res> get item {
  
  return $LiveAuctionItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of AuctionDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveBidStatusCopyWith<$Res>? get bidStatus {
    if (_self.bidStatus == null) {
    return null;
  }

  return $LiveBidStatusCopyWith<$Res>(_self.bidStatus!, (value) {
    return _then(_self.copyWith(bidStatus: value));
  });
}
}

// dart format on
