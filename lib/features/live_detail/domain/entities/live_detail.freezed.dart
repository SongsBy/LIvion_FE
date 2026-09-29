// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LiveSeller {

 String get id; String get name;/// 에셋 경로 또는 URL.
 String? get avatar;/// Livion 공식 방송이면 이름 옆에 "공식" 뱃지가 붙는다.
 bool get isOfficial; bool get isFollowing;
/// Create a copy of LiveSeller
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveSellerCopyWith<LiveSeller> get copyWith => _$LiveSellerCopyWithImpl<LiveSeller>(this as LiveSeller, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveSeller&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.isOfficial, isOfficial) || other.isOfficial == isOfficial)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,avatar,isOfficial,isFollowing);

@override
String toString() {
  return 'LiveSeller(id: $id, name: $name, avatar: $avatar, isOfficial: $isOfficial, isFollowing: $isFollowing)';
}


}

/// @nodoc
abstract mixin class $LiveSellerCopyWith<$Res>  {
  factory $LiveSellerCopyWith(LiveSeller value, $Res Function(LiveSeller) _then) = _$LiveSellerCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? avatar, bool isOfficial, bool isFollowing
});




}
/// @nodoc
class _$LiveSellerCopyWithImpl<$Res>
    implements $LiveSellerCopyWith<$Res> {
  _$LiveSellerCopyWithImpl(this._self, this._then);

  final LiveSeller _self;
  final $Res Function(LiveSeller) _then;

/// Create a copy of LiveSeller
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatar = freezed,Object? isOfficial = null,Object? isFollowing = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,isOfficial: null == isOfficial ? _self.isOfficial : isOfficial // ignore: cast_nullable_to_non_nullable
as bool,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LiveSeller].
extension LiveSellerPatterns on LiveSeller {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveSeller value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveSeller() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveSeller value)  $default,){
final _that = this;
switch (_that) {
case _LiveSeller():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveSeller value)?  $default,){
final _that = this;
switch (_that) {
case _LiveSeller() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? avatar,  bool isOfficial,  bool isFollowing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveSeller() when $default != null:
return $default(_that.id,_that.name,_that.avatar,_that.isOfficial,_that.isFollowing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? avatar,  bool isOfficial,  bool isFollowing)  $default,) {final _that = this;
switch (_that) {
case _LiveSeller():
return $default(_that.id,_that.name,_that.avatar,_that.isOfficial,_that.isFollowing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? avatar,  bool isOfficial,  bool isFollowing)?  $default,) {final _that = this;
switch (_that) {
case _LiveSeller() when $default != null:
return $default(_that.id,_that.name,_that.avatar,_that.isOfficial,_that.isFollowing);case _:
  return null;

}
}

}

/// @nodoc


class _LiveSeller implements LiveSeller {
  const _LiveSeller({required this.id, required this.name, this.avatar, this.isOfficial = false, this.isFollowing = false});
  

@override final  String id;
@override final  String name;
/// 에셋 경로 또는 URL.
@override final  String? avatar;
/// Livion 공식 방송이면 이름 옆에 "공식" 뱃지가 붙는다.
@override@JsonKey() final  bool isOfficial;
@override@JsonKey() final  bool isFollowing;

/// Create a copy of LiveSeller
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveSellerCopyWith<_LiveSeller> get copyWith => __$LiveSellerCopyWithImpl<_LiveSeller>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveSeller&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.isOfficial, isOfficial) || other.isOfficial == isOfficial)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,avatar,isOfficial,isFollowing);

@override
String toString() {
  return 'LiveSeller(id: $id, name: $name, avatar: $avatar, isOfficial: $isOfficial, isFollowing: $isFollowing)';
}


}

/// @nodoc
abstract mixin class _$LiveSellerCopyWith<$Res> implements $LiveSellerCopyWith<$Res> {
  factory _$LiveSellerCopyWith(_LiveSeller value, $Res Function(_LiveSeller) _then) = __$LiveSellerCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? avatar, bool isOfficial, bool isFollowing
});




}
/// @nodoc
class __$LiveSellerCopyWithImpl<$Res>
    implements _$LiveSellerCopyWith<$Res> {
  __$LiveSellerCopyWithImpl(this._self, this._then);

  final _LiveSeller _self;
  final $Res Function(_LiveSeller) _then;

/// Create a copy of LiveSeller
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatar = freezed,Object? isOfficial = null,Object? isFollowing = null,}) {
  return _then(_LiveSeller(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,isOfficial: null == isOfficial ? _self.isOfficial : isOfficial // ignore: cast_nullable_to_non_nullable
as bool,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$LiveChatMessage {

 String get id; String get senderName; String? get senderAvatar; String get message;/// 보낸 시각(기기 로컬). 채팅 패널에서 "오후 8:14"로 보이고, null이면 숨긴다.
 DateTime? get sentAt;/// 판매자가 보낸 메시지면 이름 옆에 "판매자" 뱃지가 붙는다.
 bool get isSeller;/// 바로 앞 메시지에 대한 답글이면 꺾쇠를 붙여 들여쓴다.
 bool get isReply;
/// Create a copy of LiveChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveChatMessageCopyWith<LiveChatMessage> get copyWith => _$LiveChatMessageCopyWithImpl<LiveChatMessage>(this as LiveChatMessage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.senderAvatar, senderAvatar) || other.senderAvatar == senderAvatar)&&(identical(other.message, message) || other.message == message)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.isSeller, isSeller) || other.isSeller == isSeller)&&(identical(other.isReply, isReply) || other.isReply == isReply));
}


@override
int get hashCode => Object.hash(runtimeType,id,senderName,senderAvatar,message,sentAt,isSeller,isReply);

@override
String toString() {
  return 'LiveChatMessage(id: $id, senderName: $senderName, senderAvatar: $senderAvatar, message: $message, sentAt: $sentAt, isSeller: $isSeller, isReply: $isReply)';
}


}

/// @nodoc
abstract mixin class $LiveChatMessageCopyWith<$Res>  {
  factory $LiveChatMessageCopyWith(LiveChatMessage value, $Res Function(LiveChatMessage) _then) = _$LiveChatMessageCopyWithImpl;
@useResult
$Res call({
 String id, String senderName, String? senderAvatar, String message, DateTime? sentAt, bool isSeller, bool isReply
});




}
/// @nodoc
class _$LiveChatMessageCopyWithImpl<$Res>
    implements $LiveChatMessageCopyWith<$Res> {
  _$LiveChatMessageCopyWithImpl(this._self, this._then);

  final LiveChatMessage _self;
  final $Res Function(LiveChatMessage) _then;

/// Create a copy of LiveChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? senderName = null,Object? senderAvatar = freezed,Object? message = null,Object? sentAt = freezed,Object? isSeller = null,Object? isReply = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,senderAvatar: freezed == senderAvatar ? _self.senderAvatar : senderAvatar // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,sentAt: freezed == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isSeller: null == isSeller ? _self.isSeller : isSeller // ignore: cast_nullable_to_non_nullable
as bool,isReply: null == isReply ? _self.isReply : isReply // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LiveChatMessage].
extension LiveChatMessagePatterns on LiveChatMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveChatMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveChatMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveChatMessage value)  $default,){
final _that = this;
switch (_that) {
case _LiveChatMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveChatMessage value)?  $default,){
final _that = this;
switch (_that) {
case _LiveChatMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String senderName,  String? senderAvatar,  String message,  DateTime? sentAt,  bool isSeller,  bool isReply)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveChatMessage() when $default != null:
return $default(_that.id,_that.senderName,_that.senderAvatar,_that.message,_that.sentAt,_that.isSeller,_that.isReply);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String senderName,  String? senderAvatar,  String message,  DateTime? sentAt,  bool isSeller,  bool isReply)  $default,) {final _that = this;
switch (_that) {
case _LiveChatMessage():
return $default(_that.id,_that.senderName,_that.senderAvatar,_that.message,_that.sentAt,_that.isSeller,_that.isReply);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String senderName,  String? senderAvatar,  String message,  DateTime? sentAt,  bool isSeller,  bool isReply)?  $default,) {final _that = this;
switch (_that) {
case _LiveChatMessage() when $default != null:
return $default(_that.id,_that.senderName,_that.senderAvatar,_that.message,_that.sentAt,_that.isSeller,_that.isReply);case _:
  return null;

}
}

}

/// @nodoc


class _LiveChatMessage implements LiveChatMessage {
  const _LiveChatMessage({required this.id, required this.senderName, this.senderAvatar, required this.message, this.sentAt, this.isSeller = false, this.isReply = false});
  

@override final  String id;
@override final  String senderName;
@override final  String? senderAvatar;
@override final  String message;
/// 보낸 시각(기기 로컬). 채팅 패널에서 "오후 8:14"로 보이고, null이면 숨긴다.
@override final  DateTime? sentAt;
/// 판매자가 보낸 메시지면 이름 옆에 "판매자" 뱃지가 붙는다.
@override@JsonKey() final  bool isSeller;
/// 바로 앞 메시지에 대한 답글이면 꺾쇠를 붙여 들여쓴다.
@override@JsonKey() final  bool isReply;

/// Create a copy of LiveChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveChatMessageCopyWith<_LiveChatMessage> get copyWith => __$LiveChatMessageCopyWithImpl<_LiveChatMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.senderAvatar, senderAvatar) || other.senderAvatar == senderAvatar)&&(identical(other.message, message) || other.message == message)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.isSeller, isSeller) || other.isSeller == isSeller)&&(identical(other.isReply, isReply) || other.isReply == isReply));
}


@override
int get hashCode => Object.hash(runtimeType,id,senderName,senderAvatar,message,sentAt,isSeller,isReply);

@override
String toString() {
  return 'LiveChatMessage(id: $id, senderName: $senderName, senderAvatar: $senderAvatar, message: $message, sentAt: $sentAt, isSeller: $isSeller, isReply: $isReply)';
}


}

/// @nodoc
abstract mixin class _$LiveChatMessageCopyWith<$Res> implements $LiveChatMessageCopyWith<$Res> {
  factory _$LiveChatMessageCopyWith(_LiveChatMessage value, $Res Function(_LiveChatMessage) _then) = __$LiveChatMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, String senderName, String? senderAvatar, String message, DateTime? sentAt, bool isSeller, bool isReply
});




}
/// @nodoc
class __$LiveChatMessageCopyWithImpl<$Res>
    implements _$LiveChatMessageCopyWith<$Res> {
  __$LiveChatMessageCopyWithImpl(this._self, this._then);

  final _LiveChatMessage _self;
  final $Res Function(_LiveChatMessage) _then;

/// Create a copy of LiveChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? senderName = null,Object? senderAvatar = freezed,Object? message = null,Object? sentAt = freezed,Object? isSeller = null,Object? isReply = null,}) {
  return _then(_LiveChatMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,senderAvatar: freezed == senderAvatar ? _self.senderAvatar : senderAvatar // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,sentAt: freezed == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isSeller: null == isSeller ? _self.isSeller : isSeller // ignore: cast_nullable_to_non_nullable
as bool,isReply: null == isReply ? _self.isReply : isReply // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$LiveAuctionItem {

 String get id; String get name; int get quantity; InspectionGrade get grade;/// 시작가 (원, 정수).
 int get startPriceWon;/// 현재 최고 입찰가 (원, 정수).
 int get currentPriceWon;/// 마감까지 남은 일수. null이면 D-day 뱃지를 보이지 않는다.
 int? get dDay;/// 이번 입찰 마감까지 남은 초. 서버 시각 계약을 따르며 데모에서는 고정값이다.
 int get remainingSeconds;/// 에셋 경로 또는 URL.
 String? get thumbnail;/// 경매 상세의 상품 사진들 (에셋 경로 또는 URL). 비어 있으면 [thumbnail]을 쓴다.
 List<String> get images;/// 보관·포장 상태 ("냉동", "미개봉"). 경매 상세에서 " · "로 이어 보인다.
 List<String> get conditions;/// 소비기한 (날짜만 의미 있다). null이면 숨긴다.
 DateTime? get expiryDate;/// 검수 완료일 (날짜만 의미 있다). null이면 "검수완료" 뱃지를 숨긴다.
 DateTime? get inspectedAt;
/// Create a copy of LiveAuctionItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveAuctionItemCopyWith<LiveAuctionItem> get copyWith => _$LiveAuctionItemCopyWithImpl<LiveAuctionItem>(this as LiveAuctionItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveAuctionItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.startPriceWon, startPriceWon) || other.startPriceWon == startPriceWon)&&(identical(other.currentPriceWon, currentPriceWon) || other.currentPriceWon == currentPriceWon)&&(identical(other.dDay, dDay) || other.dDay == dDay)&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.conditions, conditions)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.inspectedAt, inspectedAt) || other.inspectedAt == inspectedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,quantity,grade,startPriceWon,currentPriceWon,dDay,remainingSeconds,thumbnail,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(conditions),expiryDate,inspectedAt);

@override
String toString() {
  return 'LiveAuctionItem(id: $id, name: $name, quantity: $quantity, grade: $grade, startPriceWon: $startPriceWon, currentPriceWon: $currentPriceWon, dDay: $dDay, remainingSeconds: $remainingSeconds, thumbnail: $thumbnail, images: $images, conditions: $conditions, expiryDate: $expiryDate, inspectedAt: $inspectedAt)';
}


}

/// @nodoc
abstract mixin class $LiveAuctionItemCopyWith<$Res>  {
  factory $LiveAuctionItemCopyWith(LiveAuctionItem value, $Res Function(LiveAuctionItem) _then) = _$LiveAuctionItemCopyWithImpl;
@useResult
$Res call({
 String id, String name, int quantity, InspectionGrade grade, int startPriceWon, int currentPriceWon, int? dDay, int remainingSeconds, String? thumbnail, List<String> images, List<String> conditions, DateTime? expiryDate, DateTime? inspectedAt
});




}
/// @nodoc
class _$LiveAuctionItemCopyWithImpl<$Res>
    implements $LiveAuctionItemCopyWith<$Res> {
  _$LiveAuctionItemCopyWithImpl(this._self, this._then);

  final LiveAuctionItem _self;
  final $Res Function(LiveAuctionItem) _then;

/// Create a copy of LiveAuctionItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? quantity = null,Object? grade = null,Object? startPriceWon = null,Object? currentPriceWon = null,Object? dDay = freezed,Object? remainingSeconds = null,Object? thumbnail = freezed,Object? images = null,Object? conditions = null,Object? expiryDate = freezed,Object? inspectedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as InspectionGrade,startPriceWon: null == startPriceWon ? _self.startPriceWon : startPriceWon // ignore: cast_nullable_to_non_nullable
as int,currentPriceWon: null == currentPriceWon ? _self.currentPriceWon : currentPriceWon // ignore: cast_nullable_to_non_nullable
as int,dDay: freezed == dDay ? _self.dDay : dDay // ignore: cast_nullable_to_non_nullable
as int?,remainingSeconds: null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,conditions: null == conditions ? _self.conditions : conditions // ignore: cast_nullable_to_non_nullable
as List<String>,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,inspectedAt: freezed == inspectedAt ? _self.inspectedAt : inspectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [LiveAuctionItem].
extension LiveAuctionItemPatterns on LiveAuctionItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveAuctionItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveAuctionItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveAuctionItem value)  $default,){
final _that = this;
switch (_that) {
case _LiveAuctionItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveAuctionItem value)?  $default,){
final _that = this;
switch (_that) {
case _LiveAuctionItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int quantity,  InspectionGrade grade,  int startPriceWon,  int currentPriceWon,  int? dDay,  int remainingSeconds,  String? thumbnail,  List<String> images,  List<String> conditions,  DateTime? expiryDate,  DateTime? inspectedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveAuctionItem() when $default != null:
return $default(_that.id,_that.name,_that.quantity,_that.grade,_that.startPriceWon,_that.currentPriceWon,_that.dDay,_that.remainingSeconds,_that.thumbnail,_that.images,_that.conditions,_that.expiryDate,_that.inspectedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int quantity,  InspectionGrade grade,  int startPriceWon,  int currentPriceWon,  int? dDay,  int remainingSeconds,  String? thumbnail,  List<String> images,  List<String> conditions,  DateTime? expiryDate,  DateTime? inspectedAt)  $default,) {final _that = this;
switch (_that) {
case _LiveAuctionItem():
return $default(_that.id,_that.name,_that.quantity,_that.grade,_that.startPriceWon,_that.currentPriceWon,_that.dDay,_that.remainingSeconds,_that.thumbnail,_that.images,_that.conditions,_that.expiryDate,_that.inspectedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int quantity,  InspectionGrade grade,  int startPriceWon,  int currentPriceWon,  int? dDay,  int remainingSeconds,  String? thumbnail,  List<String> images,  List<String> conditions,  DateTime? expiryDate,  DateTime? inspectedAt)?  $default,) {final _that = this;
switch (_that) {
case _LiveAuctionItem() when $default != null:
return $default(_that.id,_that.name,_that.quantity,_that.grade,_that.startPriceWon,_that.currentPriceWon,_that.dDay,_that.remainingSeconds,_that.thumbnail,_that.images,_that.conditions,_that.expiryDate,_that.inspectedAt);case _:
  return null;

}
}

}

/// @nodoc


class _LiveAuctionItem extends LiveAuctionItem {
  const _LiveAuctionItem({required this.id, required this.name, required this.quantity, required this.grade, required this.startPriceWon, required this.currentPriceWon, this.dDay, required this.remainingSeconds, this.thumbnail, final  List<String> images = const <String>[], final  List<String> conditions = const <String>[], this.expiryDate, this.inspectedAt}): _images = images,_conditions = conditions,super._();
  

@override final  String id;
@override final  String name;
@override final  int quantity;
@override final  InspectionGrade grade;
/// 시작가 (원, 정수).
@override final  int startPriceWon;
/// 현재 최고 입찰가 (원, 정수).
@override final  int currentPriceWon;
/// 마감까지 남은 일수. null이면 D-day 뱃지를 보이지 않는다.
@override final  int? dDay;
/// 이번 입찰 마감까지 남은 초. 서버 시각 계약을 따르며 데모에서는 고정값이다.
@override final  int remainingSeconds;
/// 에셋 경로 또는 URL.
@override final  String? thumbnail;
/// 경매 상세의 상품 사진들 (에셋 경로 또는 URL). 비어 있으면 [thumbnail]을 쓴다.
 final  List<String> _images;
/// 경매 상세의 상품 사진들 (에셋 경로 또는 URL). 비어 있으면 [thumbnail]을 쓴다.
@override@JsonKey() List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

/// 보관·포장 상태 ("냉동", "미개봉"). 경매 상세에서 " · "로 이어 보인다.
 final  List<String> _conditions;
/// 보관·포장 상태 ("냉동", "미개봉"). 경매 상세에서 " · "로 이어 보인다.
@override@JsonKey() List<String> get conditions {
  if (_conditions is EqualUnmodifiableListView) return _conditions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conditions);
}

/// 소비기한 (날짜만 의미 있다). null이면 숨긴다.
@override final  DateTime? expiryDate;
/// 검수 완료일 (날짜만 의미 있다). null이면 "검수완료" 뱃지를 숨긴다.
@override final  DateTime? inspectedAt;

/// Create a copy of LiveAuctionItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveAuctionItemCopyWith<_LiveAuctionItem> get copyWith => __$LiveAuctionItemCopyWithImpl<_LiveAuctionItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveAuctionItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.startPriceWon, startPriceWon) || other.startPriceWon == startPriceWon)&&(identical(other.currentPriceWon, currentPriceWon) || other.currentPriceWon == currentPriceWon)&&(identical(other.dDay, dDay) || other.dDay == dDay)&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._conditions, _conditions)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.inspectedAt, inspectedAt) || other.inspectedAt == inspectedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,quantity,grade,startPriceWon,currentPriceWon,dDay,remainingSeconds,thumbnail,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_conditions),expiryDate,inspectedAt);

@override
String toString() {
  return 'LiveAuctionItem(id: $id, name: $name, quantity: $quantity, grade: $grade, startPriceWon: $startPriceWon, currentPriceWon: $currentPriceWon, dDay: $dDay, remainingSeconds: $remainingSeconds, thumbnail: $thumbnail, images: $images, conditions: $conditions, expiryDate: $expiryDate, inspectedAt: $inspectedAt)';
}


}

/// @nodoc
abstract mixin class _$LiveAuctionItemCopyWith<$Res> implements $LiveAuctionItemCopyWith<$Res> {
  factory _$LiveAuctionItemCopyWith(_LiveAuctionItem value, $Res Function(_LiveAuctionItem) _then) = __$LiveAuctionItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int quantity, InspectionGrade grade, int startPriceWon, int currentPriceWon, int? dDay, int remainingSeconds, String? thumbnail, List<String> images, List<String> conditions, DateTime? expiryDate, DateTime? inspectedAt
});




}
/// @nodoc
class __$LiveAuctionItemCopyWithImpl<$Res>
    implements _$LiveAuctionItemCopyWith<$Res> {
  __$LiveAuctionItemCopyWithImpl(this._self, this._then);

  final _LiveAuctionItem _self;
  final $Res Function(_LiveAuctionItem) _then;

/// Create a copy of LiveAuctionItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? quantity = null,Object? grade = null,Object? startPriceWon = null,Object? currentPriceWon = null,Object? dDay = freezed,Object? remainingSeconds = null,Object? thumbnail = freezed,Object? images = null,Object? conditions = null,Object? expiryDate = freezed,Object? inspectedAt = freezed,}) {
  return _then(_LiveAuctionItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as InspectionGrade,startPriceWon: null == startPriceWon ? _self.startPriceWon : startPriceWon // ignore: cast_nullable_to_non_nullable
as int,currentPriceWon: null == currentPriceWon ? _self.currentPriceWon : currentPriceWon // ignore: cast_nullable_to_non_nullable
as int,dDay: freezed == dDay ? _self.dDay : dDay // ignore: cast_nullable_to_non_nullable
as int?,remainingSeconds: null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,conditions: null == conditions ? _self._conditions : conditions // ignore: cast_nullable_to_non_nullable
as List<String>,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,inspectedAt: freezed == inspectedAt ? _self.inspectedAt : inspectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$LiveBidPoint {

 int get elapsedSeconds; int get priceWon;
/// Create a copy of LiveBidPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveBidPointCopyWith<LiveBidPoint> get copyWith => _$LiveBidPointCopyWithImpl<LiveBidPoint>(this as LiveBidPoint, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveBidPoint&&(identical(other.elapsedSeconds, elapsedSeconds) || other.elapsedSeconds == elapsedSeconds)&&(identical(other.priceWon, priceWon) || other.priceWon == priceWon));
}


@override
int get hashCode => Object.hash(runtimeType,elapsedSeconds,priceWon);

@override
String toString() {
  return 'LiveBidPoint(elapsedSeconds: $elapsedSeconds, priceWon: $priceWon)';
}


}

/// @nodoc
abstract mixin class $LiveBidPointCopyWith<$Res>  {
  factory $LiveBidPointCopyWith(LiveBidPoint value, $Res Function(LiveBidPoint) _then) = _$LiveBidPointCopyWithImpl;
@useResult
$Res call({
 int elapsedSeconds, int priceWon
});




}
/// @nodoc
class _$LiveBidPointCopyWithImpl<$Res>
    implements $LiveBidPointCopyWith<$Res> {
  _$LiveBidPointCopyWithImpl(this._self, this._then);

  final LiveBidPoint _self;
  final $Res Function(LiveBidPoint) _then;

/// Create a copy of LiveBidPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? elapsedSeconds = null,Object? priceWon = null,}) {
  return _then(_self.copyWith(
elapsedSeconds: null == elapsedSeconds ? _self.elapsedSeconds : elapsedSeconds // ignore: cast_nullable_to_non_nullable
as int,priceWon: null == priceWon ? _self.priceWon : priceWon // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LiveBidPoint].
extension LiveBidPointPatterns on LiveBidPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveBidPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveBidPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveBidPoint value)  $default,){
final _that = this;
switch (_that) {
case _LiveBidPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveBidPoint value)?  $default,){
final _that = this;
switch (_that) {
case _LiveBidPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int elapsedSeconds,  int priceWon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveBidPoint() when $default != null:
return $default(_that.elapsedSeconds,_that.priceWon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int elapsedSeconds,  int priceWon)  $default,) {final _that = this;
switch (_that) {
case _LiveBidPoint():
return $default(_that.elapsedSeconds,_that.priceWon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int elapsedSeconds,  int priceWon)?  $default,) {final _that = this;
switch (_that) {
case _LiveBidPoint() when $default != null:
return $default(_that.elapsedSeconds,_that.priceWon);case _:
  return null;

}
}

}

/// @nodoc


class _LiveBidPoint implements LiveBidPoint {
  const _LiveBidPoint({required this.elapsedSeconds, required this.priceWon});
  

@override final  int elapsedSeconds;
@override final  int priceWon;

/// Create a copy of LiveBidPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveBidPointCopyWith<_LiveBidPoint> get copyWith => __$LiveBidPointCopyWithImpl<_LiveBidPoint>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveBidPoint&&(identical(other.elapsedSeconds, elapsedSeconds) || other.elapsedSeconds == elapsedSeconds)&&(identical(other.priceWon, priceWon) || other.priceWon == priceWon));
}


@override
int get hashCode => Object.hash(runtimeType,elapsedSeconds,priceWon);

@override
String toString() {
  return 'LiveBidPoint(elapsedSeconds: $elapsedSeconds, priceWon: $priceWon)';
}


}

/// @nodoc
abstract mixin class _$LiveBidPointCopyWith<$Res> implements $LiveBidPointCopyWith<$Res> {
  factory _$LiveBidPointCopyWith(_LiveBidPoint value, $Res Function(_LiveBidPoint) _then) = __$LiveBidPointCopyWithImpl;
@override @useResult
$Res call({
 int elapsedSeconds, int priceWon
});




}
/// @nodoc
class __$LiveBidPointCopyWithImpl<$Res>
    implements _$LiveBidPointCopyWith<$Res> {
  __$LiveBidPointCopyWithImpl(this._self, this._then);

  final _LiveBidPoint _self;
  final $Res Function(_LiveBidPoint) _then;

/// Create a copy of LiveBidPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? elapsedSeconds = null,Object? priceWon = null,}) {
  return _then(_LiveBidPoint(
elapsedSeconds: null == elapsedSeconds ? _self.elapsedSeconds : elapsedSeconds // ignore: cast_nullable_to_non_nullable
as int,priceWon: null == priceWon ? _self.priceWon : priceWon // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$LiveBidEntry {

 int get rank;/// 서버가 마스킹해 내려주는 표시용 이름.
 String get bidderName; int get priceWon; DateTime get placedAt;
/// Create a copy of LiveBidEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveBidEntryCopyWith<LiveBidEntry> get copyWith => _$LiveBidEntryCopyWithImpl<LiveBidEntry>(this as LiveBidEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveBidEntry&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.bidderName, bidderName) || other.bidderName == bidderName)&&(identical(other.priceWon, priceWon) || other.priceWon == priceWon)&&(identical(other.placedAt, placedAt) || other.placedAt == placedAt));
}


@override
int get hashCode => Object.hash(runtimeType,rank,bidderName,priceWon,placedAt);

@override
String toString() {
  return 'LiveBidEntry(rank: $rank, bidderName: $bidderName, priceWon: $priceWon, placedAt: $placedAt)';
}


}

/// @nodoc
abstract mixin class $LiveBidEntryCopyWith<$Res>  {
  factory $LiveBidEntryCopyWith(LiveBidEntry value, $Res Function(LiveBidEntry) _then) = _$LiveBidEntryCopyWithImpl;
@useResult
$Res call({
 int rank, String bidderName, int priceWon, DateTime placedAt
});




}
/// @nodoc
class _$LiveBidEntryCopyWithImpl<$Res>
    implements $LiveBidEntryCopyWith<$Res> {
  _$LiveBidEntryCopyWithImpl(this._self, this._then);

  final LiveBidEntry _self;
  final $Res Function(LiveBidEntry) _then;

/// Create a copy of LiveBidEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rank = null,Object? bidderName = null,Object? priceWon = null,Object? placedAt = null,}) {
  return _then(_self.copyWith(
rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,bidderName: null == bidderName ? _self.bidderName : bidderName // ignore: cast_nullable_to_non_nullable
as String,priceWon: null == priceWon ? _self.priceWon : priceWon // ignore: cast_nullable_to_non_nullable
as int,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [LiveBidEntry].
extension LiveBidEntryPatterns on LiveBidEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveBidEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveBidEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveBidEntry value)  $default,){
final _that = this;
switch (_that) {
case _LiveBidEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveBidEntry value)?  $default,){
final _that = this;
switch (_that) {
case _LiveBidEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int rank,  String bidderName,  int priceWon,  DateTime placedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveBidEntry() when $default != null:
return $default(_that.rank,_that.bidderName,_that.priceWon,_that.placedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int rank,  String bidderName,  int priceWon,  DateTime placedAt)  $default,) {final _that = this;
switch (_that) {
case _LiveBidEntry():
return $default(_that.rank,_that.bidderName,_that.priceWon,_that.placedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int rank,  String bidderName,  int priceWon,  DateTime placedAt)?  $default,) {final _that = this;
switch (_that) {
case _LiveBidEntry() when $default != null:
return $default(_that.rank,_that.bidderName,_that.priceWon,_that.placedAt);case _:
  return null;

}
}

}

/// @nodoc


class _LiveBidEntry implements LiveBidEntry {
  const _LiveBidEntry({required this.rank, required this.bidderName, required this.priceWon, required this.placedAt});
  

@override final  int rank;
/// 서버가 마스킹해 내려주는 표시용 이름.
@override final  String bidderName;
@override final  int priceWon;
@override final  DateTime placedAt;

/// Create a copy of LiveBidEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveBidEntryCopyWith<_LiveBidEntry> get copyWith => __$LiveBidEntryCopyWithImpl<_LiveBidEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveBidEntry&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.bidderName, bidderName) || other.bidderName == bidderName)&&(identical(other.priceWon, priceWon) || other.priceWon == priceWon)&&(identical(other.placedAt, placedAt) || other.placedAt == placedAt));
}


@override
int get hashCode => Object.hash(runtimeType,rank,bidderName,priceWon,placedAt);

@override
String toString() {
  return 'LiveBidEntry(rank: $rank, bidderName: $bidderName, priceWon: $priceWon, placedAt: $placedAt)';
}


}

/// @nodoc
abstract mixin class _$LiveBidEntryCopyWith<$Res> implements $LiveBidEntryCopyWith<$Res> {
  factory _$LiveBidEntryCopyWith(_LiveBidEntry value, $Res Function(_LiveBidEntry) _then) = __$LiveBidEntryCopyWithImpl;
@override @useResult
$Res call({
 int rank, String bidderName, int priceWon, DateTime placedAt
});




}
/// @nodoc
class __$LiveBidEntryCopyWithImpl<$Res>
    implements _$LiveBidEntryCopyWith<$Res> {
  __$LiveBidEntryCopyWithImpl(this._self, this._then);

  final _LiveBidEntry _self;
  final $Res Function(_LiveBidEntry) _then;

/// Create a copy of LiveBidEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rank = null,Object? bidderName = null,Object? priceWon = null,Object? placedAt = null,}) {
  return _then(_LiveBidEntry(
rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,bidderName: null == bidderName ? _self.bidderName : bidderName // ignore: cast_nullable_to_non_nullable
as String,priceWon: null == priceWon ? _self.priceWon : priceWon // ignore: cast_nullable_to_non_nullable
as int,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$LiveBidStatus {

 int get startPriceWon; int get currentPriceWon; int get participantCount; int get totalBidCount;/// 경매 시작 후 경과 초. 추이 차트의 오른쪽 끝(지금)이다.
 int get elapsedSeconds;/// 입찰가 추이. 경과 초 오름차순.
 List<LiveBidPoint> get priceHistory;/// 마감 직전 입찰로 연장이 시작된 경과 초. null이면 연장이 없었다.
 int? get extensionStartSeconds;/// 한 번 연장될 때 늘어나는 초. [extensionStartSeconds]가 있을 때만 의미 있다.
 int? get extensionSeconds;/// 내가 넣은 입찰. 없으면 null.
 LiveBidEntry? get myBid;/// 자동입찰 최대가. 설정하지 않았으면 null.
 int? get maxAutoBidWon;/// 순위 목록. rank 오름차순.
 List<LiveBidEntry> get ranking;/// 유사 품목의 평균 낙찰 배수 (시작가 대비). 경매 상세의 추이 참고 문구에 쓴다.
 double? get similarAverageMultiplier;/// 유사 품목의 최근 낙찰가 (원, 정수).
 int? get recentWinningPriceWon;
/// Create a copy of LiveBidStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveBidStatusCopyWith<LiveBidStatus> get copyWith => _$LiveBidStatusCopyWithImpl<LiveBidStatus>(this as LiveBidStatus, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveBidStatus&&(identical(other.startPriceWon, startPriceWon) || other.startPriceWon == startPriceWon)&&(identical(other.currentPriceWon, currentPriceWon) || other.currentPriceWon == currentPriceWon)&&(identical(other.participantCount, participantCount) || other.participantCount == participantCount)&&(identical(other.totalBidCount, totalBidCount) || other.totalBidCount == totalBidCount)&&(identical(other.elapsedSeconds, elapsedSeconds) || other.elapsedSeconds == elapsedSeconds)&&const DeepCollectionEquality().equals(other.priceHistory, priceHistory)&&(identical(other.extensionStartSeconds, extensionStartSeconds) || other.extensionStartSeconds == extensionStartSeconds)&&(identical(other.extensionSeconds, extensionSeconds) || other.extensionSeconds == extensionSeconds)&&(identical(other.myBid, myBid) || other.myBid == myBid)&&(identical(other.maxAutoBidWon, maxAutoBidWon) || other.maxAutoBidWon == maxAutoBidWon)&&const DeepCollectionEquality().equals(other.ranking, ranking)&&(identical(other.similarAverageMultiplier, similarAverageMultiplier) || other.similarAverageMultiplier == similarAverageMultiplier)&&(identical(other.recentWinningPriceWon, recentWinningPriceWon) || other.recentWinningPriceWon == recentWinningPriceWon));
}


@override
int get hashCode => Object.hash(runtimeType,startPriceWon,currentPriceWon,participantCount,totalBidCount,elapsedSeconds,const DeepCollectionEquality().hash(priceHistory),extensionStartSeconds,extensionSeconds,myBid,maxAutoBidWon,const DeepCollectionEquality().hash(ranking),similarAverageMultiplier,recentWinningPriceWon);

@override
String toString() {
  return 'LiveBidStatus(startPriceWon: $startPriceWon, currentPriceWon: $currentPriceWon, participantCount: $participantCount, totalBidCount: $totalBidCount, elapsedSeconds: $elapsedSeconds, priceHistory: $priceHistory, extensionStartSeconds: $extensionStartSeconds, extensionSeconds: $extensionSeconds, myBid: $myBid, maxAutoBidWon: $maxAutoBidWon, ranking: $ranking, similarAverageMultiplier: $similarAverageMultiplier, recentWinningPriceWon: $recentWinningPriceWon)';
}


}

/// @nodoc
abstract mixin class $LiveBidStatusCopyWith<$Res>  {
  factory $LiveBidStatusCopyWith(LiveBidStatus value, $Res Function(LiveBidStatus) _then) = _$LiveBidStatusCopyWithImpl;
@useResult
$Res call({
 int startPriceWon, int currentPriceWon, int participantCount, int totalBidCount, int elapsedSeconds, List<LiveBidPoint> priceHistory, int? extensionStartSeconds, int? extensionSeconds, LiveBidEntry? myBid, int? maxAutoBidWon, List<LiveBidEntry> ranking, double? similarAverageMultiplier, int? recentWinningPriceWon
});


$LiveBidEntryCopyWith<$Res>? get myBid;

}
/// @nodoc
class _$LiveBidStatusCopyWithImpl<$Res>
    implements $LiveBidStatusCopyWith<$Res> {
  _$LiveBidStatusCopyWithImpl(this._self, this._then);

  final LiveBidStatus _self;
  final $Res Function(LiveBidStatus) _then;

/// Create a copy of LiveBidStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startPriceWon = null,Object? currentPriceWon = null,Object? participantCount = null,Object? totalBidCount = null,Object? elapsedSeconds = null,Object? priceHistory = null,Object? extensionStartSeconds = freezed,Object? extensionSeconds = freezed,Object? myBid = freezed,Object? maxAutoBidWon = freezed,Object? ranking = null,Object? similarAverageMultiplier = freezed,Object? recentWinningPriceWon = freezed,}) {
  return _then(_self.copyWith(
startPriceWon: null == startPriceWon ? _self.startPriceWon : startPriceWon // ignore: cast_nullable_to_non_nullable
as int,currentPriceWon: null == currentPriceWon ? _self.currentPriceWon : currentPriceWon // ignore: cast_nullable_to_non_nullable
as int,participantCount: null == participantCount ? _self.participantCount : participantCount // ignore: cast_nullable_to_non_nullable
as int,totalBidCount: null == totalBidCount ? _self.totalBidCount : totalBidCount // ignore: cast_nullable_to_non_nullable
as int,elapsedSeconds: null == elapsedSeconds ? _self.elapsedSeconds : elapsedSeconds // ignore: cast_nullable_to_non_nullable
as int,priceHistory: null == priceHistory ? _self.priceHistory : priceHistory // ignore: cast_nullable_to_non_nullable
as List<LiveBidPoint>,extensionStartSeconds: freezed == extensionStartSeconds ? _self.extensionStartSeconds : extensionStartSeconds // ignore: cast_nullable_to_non_nullable
as int?,extensionSeconds: freezed == extensionSeconds ? _self.extensionSeconds : extensionSeconds // ignore: cast_nullable_to_non_nullable
as int?,myBid: freezed == myBid ? _self.myBid : myBid // ignore: cast_nullable_to_non_nullable
as LiveBidEntry?,maxAutoBidWon: freezed == maxAutoBidWon ? _self.maxAutoBidWon : maxAutoBidWon // ignore: cast_nullable_to_non_nullable
as int?,ranking: null == ranking ? _self.ranking : ranking // ignore: cast_nullable_to_non_nullable
as List<LiveBidEntry>,similarAverageMultiplier: freezed == similarAverageMultiplier ? _self.similarAverageMultiplier : similarAverageMultiplier // ignore: cast_nullable_to_non_nullable
as double?,recentWinningPriceWon: freezed == recentWinningPriceWon ? _self.recentWinningPriceWon : recentWinningPriceWon // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of LiveBidStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveBidEntryCopyWith<$Res>? get myBid {
    if (_self.myBid == null) {
    return null;
  }

  return $LiveBidEntryCopyWith<$Res>(_self.myBid!, (value) {
    return _then(_self.copyWith(myBid: value));
  });
}
}


/// Adds pattern-matching-related methods to [LiveBidStatus].
extension LiveBidStatusPatterns on LiveBidStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveBidStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveBidStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveBidStatus value)  $default,){
final _that = this;
switch (_that) {
case _LiveBidStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveBidStatus value)?  $default,){
final _that = this;
switch (_that) {
case _LiveBidStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int startPriceWon,  int currentPriceWon,  int participantCount,  int totalBidCount,  int elapsedSeconds,  List<LiveBidPoint> priceHistory,  int? extensionStartSeconds,  int? extensionSeconds,  LiveBidEntry? myBid,  int? maxAutoBidWon,  List<LiveBidEntry> ranking,  double? similarAverageMultiplier,  int? recentWinningPriceWon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveBidStatus() when $default != null:
return $default(_that.startPriceWon,_that.currentPriceWon,_that.participantCount,_that.totalBidCount,_that.elapsedSeconds,_that.priceHistory,_that.extensionStartSeconds,_that.extensionSeconds,_that.myBid,_that.maxAutoBidWon,_that.ranking,_that.similarAverageMultiplier,_that.recentWinningPriceWon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int startPriceWon,  int currentPriceWon,  int participantCount,  int totalBidCount,  int elapsedSeconds,  List<LiveBidPoint> priceHistory,  int? extensionStartSeconds,  int? extensionSeconds,  LiveBidEntry? myBid,  int? maxAutoBidWon,  List<LiveBidEntry> ranking,  double? similarAverageMultiplier,  int? recentWinningPriceWon)  $default,) {final _that = this;
switch (_that) {
case _LiveBidStatus():
return $default(_that.startPriceWon,_that.currentPriceWon,_that.participantCount,_that.totalBidCount,_that.elapsedSeconds,_that.priceHistory,_that.extensionStartSeconds,_that.extensionSeconds,_that.myBid,_that.maxAutoBidWon,_that.ranking,_that.similarAverageMultiplier,_that.recentWinningPriceWon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int startPriceWon,  int currentPriceWon,  int participantCount,  int totalBidCount,  int elapsedSeconds,  List<LiveBidPoint> priceHistory,  int? extensionStartSeconds,  int? extensionSeconds,  LiveBidEntry? myBid,  int? maxAutoBidWon,  List<LiveBidEntry> ranking,  double? similarAverageMultiplier,  int? recentWinningPriceWon)?  $default,) {final _that = this;
switch (_that) {
case _LiveBidStatus() when $default != null:
return $default(_that.startPriceWon,_that.currentPriceWon,_that.participantCount,_that.totalBidCount,_that.elapsedSeconds,_that.priceHistory,_that.extensionStartSeconds,_that.extensionSeconds,_that.myBid,_that.maxAutoBidWon,_that.ranking,_that.similarAverageMultiplier,_that.recentWinningPriceWon);case _:
  return null;

}
}

}

/// @nodoc


class _LiveBidStatus extends LiveBidStatus {
  const _LiveBidStatus({required this.startPriceWon, required this.currentPriceWon, required this.participantCount, required this.totalBidCount, required this.elapsedSeconds, final  List<LiveBidPoint> priceHistory = const <LiveBidPoint>[], this.extensionStartSeconds, this.extensionSeconds, this.myBid, this.maxAutoBidWon, final  List<LiveBidEntry> ranking = const <LiveBidEntry>[], this.similarAverageMultiplier, this.recentWinningPriceWon}): _priceHistory = priceHistory,_ranking = ranking,super._();
  

@override final  int startPriceWon;
@override final  int currentPriceWon;
@override final  int participantCount;
@override final  int totalBidCount;
/// 경매 시작 후 경과 초. 추이 차트의 오른쪽 끝(지금)이다.
@override final  int elapsedSeconds;
/// 입찰가 추이. 경과 초 오름차순.
 final  List<LiveBidPoint> _priceHistory;
/// 입찰가 추이. 경과 초 오름차순.
@override@JsonKey() List<LiveBidPoint> get priceHistory {
  if (_priceHistory is EqualUnmodifiableListView) return _priceHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_priceHistory);
}

/// 마감 직전 입찰로 연장이 시작된 경과 초. null이면 연장이 없었다.
@override final  int? extensionStartSeconds;
/// 한 번 연장될 때 늘어나는 초. [extensionStartSeconds]가 있을 때만 의미 있다.
@override final  int? extensionSeconds;
/// 내가 넣은 입찰. 없으면 null.
@override final  LiveBidEntry? myBid;
/// 자동입찰 최대가. 설정하지 않았으면 null.
@override final  int? maxAutoBidWon;
/// 순위 목록. rank 오름차순.
 final  List<LiveBidEntry> _ranking;
/// 순위 목록. rank 오름차순.
@override@JsonKey() List<LiveBidEntry> get ranking {
  if (_ranking is EqualUnmodifiableListView) return _ranking;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ranking);
}

/// 유사 품목의 평균 낙찰 배수 (시작가 대비). 경매 상세의 추이 참고 문구에 쓴다.
@override final  double? similarAverageMultiplier;
/// 유사 품목의 최근 낙찰가 (원, 정수).
@override final  int? recentWinningPriceWon;

/// Create a copy of LiveBidStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveBidStatusCopyWith<_LiveBidStatus> get copyWith => __$LiveBidStatusCopyWithImpl<_LiveBidStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveBidStatus&&(identical(other.startPriceWon, startPriceWon) || other.startPriceWon == startPriceWon)&&(identical(other.currentPriceWon, currentPriceWon) || other.currentPriceWon == currentPriceWon)&&(identical(other.participantCount, participantCount) || other.participantCount == participantCount)&&(identical(other.totalBidCount, totalBidCount) || other.totalBidCount == totalBidCount)&&(identical(other.elapsedSeconds, elapsedSeconds) || other.elapsedSeconds == elapsedSeconds)&&const DeepCollectionEquality().equals(other._priceHistory, _priceHistory)&&(identical(other.extensionStartSeconds, extensionStartSeconds) || other.extensionStartSeconds == extensionStartSeconds)&&(identical(other.extensionSeconds, extensionSeconds) || other.extensionSeconds == extensionSeconds)&&(identical(other.myBid, myBid) || other.myBid == myBid)&&(identical(other.maxAutoBidWon, maxAutoBidWon) || other.maxAutoBidWon == maxAutoBidWon)&&const DeepCollectionEquality().equals(other._ranking, _ranking)&&(identical(other.similarAverageMultiplier, similarAverageMultiplier) || other.similarAverageMultiplier == similarAverageMultiplier)&&(identical(other.recentWinningPriceWon, recentWinningPriceWon) || other.recentWinningPriceWon == recentWinningPriceWon));
}


@override
int get hashCode => Object.hash(runtimeType,startPriceWon,currentPriceWon,participantCount,totalBidCount,elapsedSeconds,const DeepCollectionEquality().hash(_priceHistory),extensionStartSeconds,extensionSeconds,myBid,maxAutoBidWon,const DeepCollectionEquality().hash(_ranking),similarAverageMultiplier,recentWinningPriceWon);

@override
String toString() {
  return 'LiveBidStatus(startPriceWon: $startPriceWon, currentPriceWon: $currentPriceWon, participantCount: $participantCount, totalBidCount: $totalBidCount, elapsedSeconds: $elapsedSeconds, priceHistory: $priceHistory, extensionStartSeconds: $extensionStartSeconds, extensionSeconds: $extensionSeconds, myBid: $myBid, maxAutoBidWon: $maxAutoBidWon, ranking: $ranking, similarAverageMultiplier: $similarAverageMultiplier, recentWinningPriceWon: $recentWinningPriceWon)';
}


}

/// @nodoc
abstract mixin class _$LiveBidStatusCopyWith<$Res> implements $LiveBidStatusCopyWith<$Res> {
  factory _$LiveBidStatusCopyWith(_LiveBidStatus value, $Res Function(_LiveBidStatus) _then) = __$LiveBidStatusCopyWithImpl;
@override @useResult
$Res call({
 int startPriceWon, int currentPriceWon, int participantCount, int totalBidCount, int elapsedSeconds, List<LiveBidPoint> priceHistory, int? extensionStartSeconds, int? extensionSeconds, LiveBidEntry? myBid, int? maxAutoBidWon, List<LiveBidEntry> ranking, double? similarAverageMultiplier, int? recentWinningPriceWon
});


@override $LiveBidEntryCopyWith<$Res>? get myBid;

}
/// @nodoc
class __$LiveBidStatusCopyWithImpl<$Res>
    implements _$LiveBidStatusCopyWith<$Res> {
  __$LiveBidStatusCopyWithImpl(this._self, this._then);

  final _LiveBidStatus _self;
  final $Res Function(_LiveBidStatus) _then;

/// Create a copy of LiveBidStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startPriceWon = null,Object? currentPriceWon = null,Object? participantCount = null,Object? totalBidCount = null,Object? elapsedSeconds = null,Object? priceHistory = null,Object? extensionStartSeconds = freezed,Object? extensionSeconds = freezed,Object? myBid = freezed,Object? maxAutoBidWon = freezed,Object? ranking = null,Object? similarAverageMultiplier = freezed,Object? recentWinningPriceWon = freezed,}) {
  return _then(_LiveBidStatus(
startPriceWon: null == startPriceWon ? _self.startPriceWon : startPriceWon // ignore: cast_nullable_to_non_nullable
as int,currentPriceWon: null == currentPriceWon ? _self.currentPriceWon : currentPriceWon // ignore: cast_nullable_to_non_nullable
as int,participantCount: null == participantCount ? _self.participantCount : participantCount // ignore: cast_nullable_to_non_nullable
as int,totalBidCount: null == totalBidCount ? _self.totalBidCount : totalBidCount // ignore: cast_nullable_to_non_nullable
as int,elapsedSeconds: null == elapsedSeconds ? _self.elapsedSeconds : elapsedSeconds // ignore: cast_nullable_to_non_nullable
as int,priceHistory: null == priceHistory ? _self._priceHistory : priceHistory // ignore: cast_nullable_to_non_nullable
as List<LiveBidPoint>,extensionStartSeconds: freezed == extensionStartSeconds ? _self.extensionStartSeconds : extensionStartSeconds // ignore: cast_nullable_to_non_nullable
as int?,extensionSeconds: freezed == extensionSeconds ? _self.extensionSeconds : extensionSeconds // ignore: cast_nullable_to_non_nullable
as int?,myBid: freezed == myBid ? _self.myBid : myBid // ignore: cast_nullable_to_non_nullable
as LiveBidEntry?,maxAutoBidWon: freezed == maxAutoBidWon ? _self.maxAutoBidWon : maxAutoBidWon // ignore: cast_nullable_to_non_nullable
as int?,ranking: null == ranking ? _self._ranking : ranking // ignore: cast_nullable_to_non_nullable
as List<LiveBidEntry>,similarAverageMultiplier: freezed == similarAverageMultiplier ? _self.similarAverageMultiplier : similarAverageMultiplier // ignore: cast_nullable_to_non_nullable
as double?,recentWinningPriceWon: freezed == recentWinningPriceWon ? _self.recentWinningPriceWon : recentWinningPriceWon // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of LiveBidStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveBidEntryCopyWith<$Res>? get myBid {
    if (_self.myBid == null) {
    return null;
  }

  return $LiveBidEntryCopyWith<$Res>(_self.myBid!, (value) {
    return _then(_self.copyWith(myBid: value));
  });
}
}

/// @nodoc
mixin _$LiveDetail {

 String get id; LiveSeller get seller; String get title;/// 방송 화면. 데모 단계에서는 사진 에셋이고, 영상이 붙으면 스트림 URL로 바뀐다.
 String? get broadcastImage; int get viewers; int get chatCount; int get bidCount;/// 영상 위·채팅 패널에 보이는 최근 채팅. 오래된 것이 앞이다.
 List<LiveChatMessage> get recentChats;/// 경매 상품. 첫 항목이 지금 입찰을 받는 상품이다.
 List<LiveAuctionItem> get auctionItems;/// 지금 입찰을 받는 상품의 입찰 현황. 진행 중인 경매가 없으면 null.
 LiveBidStatus? get bidStatus;/// 낙찰 시 결제할 등록 결제수단 표시 ("국민 ****1234"). null이면 안내 문구를 숨긴다.
 String? get paymentMethodLabel;
/// Create a copy of LiveDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveDetailCopyWith<LiveDetail> get copyWith => _$LiveDetailCopyWithImpl<LiveDetail>(this as LiveDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.title, title) || other.title == title)&&(identical(other.broadcastImage, broadcastImage) || other.broadcastImage == broadcastImage)&&(identical(other.viewers, viewers) || other.viewers == viewers)&&(identical(other.chatCount, chatCount) || other.chatCount == chatCount)&&(identical(other.bidCount, bidCount) || other.bidCount == bidCount)&&const DeepCollectionEquality().equals(other.recentChats, recentChats)&&const DeepCollectionEquality().equals(other.auctionItems, auctionItems)&&(identical(other.bidStatus, bidStatus) || other.bidStatus == bidStatus)&&(identical(other.paymentMethodLabel, paymentMethodLabel) || other.paymentMethodLabel == paymentMethodLabel));
}


@override
int get hashCode => Object.hash(runtimeType,id,seller,title,broadcastImage,viewers,chatCount,bidCount,const DeepCollectionEquality().hash(recentChats),const DeepCollectionEquality().hash(auctionItems),bidStatus,paymentMethodLabel);

@override
String toString() {
  return 'LiveDetail(id: $id, seller: $seller, title: $title, broadcastImage: $broadcastImage, viewers: $viewers, chatCount: $chatCount, bidCount: $bidCount, recentChats: $recentChats, auctionItems: $auctionItems, bidStatus: $bidStatus, paymentMethodLabel: $paymentMethodLabel)';
}


}

/// @nodoc
abstract mixin class $LiveDetailCopyWith<$Res>  {
  factory $LiveDetailCopyWith(LiveDetail value, $Res Function(LiveDetail) _then) = _$LiveDetailCopyWithImpl;
@useResult
$Res call({
 String id, LiveSeller seller, String title, String? broadcastImage, int viewers, int chatCount, int bidCount, List<LiveChatMessage> recentChats, List<LiveAuctionItem> auctionItems, LiveBidStatus? bidStatus, String? paymentMethodLabel
});


$LiveSellerCopyWith<$Res> get seller;$LiveBidStatusCopyWith<$Res>? get bidStatus;

}
/// @nodoc
class _$LiveDetailCopyWithImpl<$Res>
    implements $LiveDetailCopyWith<$Res> {
  _$LiveDetailCopyWithImpl(this._self, this._then);

  final LiveDetail _self;
  final $Res Function(LiveDetail) _then;

/// Create a copy of LiveDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? seller = null,Object? title = null,Object? broadcastImage = freezed,Object? viewers = null,Object? chatCount = null,Object? bidCount = null,Object? recentChats = null,Object? auctionItems = null,Object? bidStatus = freezed,Object? paymentMethodLabel = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,seller: null == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as LiveSeller,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,broadcastImage: freezed == broadcastImage ? _self.broadcastImage : broadcastImage // ignore: cast_nullable_to_non_nullable
as String?,viewers: null == viewers ? _self.viewers : viewers // ignore: cast_nullable_to_non_nullable
as int,chatCount: null == chatCount ? _self.chatCount : chatCount // ignore: cast_nullable_to_non_nullable
as int,bidCount: null == bidCount ? _self.bidCount : bidCount // ignore: cast_nullable_to_non_nullable
as int,recentChats: null == recentChats ? _self.recentChats : recentChats // ignore: cast_nullable_to_non_nullable
as List<LiveChatMessage>,auctionItems: null == auctionItems ? _self.auctionItems : auctionItems // ignore: cast_nullable_to_non_nullable
as List<LiveAuctionItem>,bidStatus: freezed == bidStatus ? _self.bidStatus : bidStatus // ignore: cast_nullable_to_non_nullable
as LiveBidStatus?,paymentMethodLabel: freezed == paymentMethodLabel ? _self.paymentMethodLabel : paymentMethodLabel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of LiveDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveSellerCopyWith<$Res> get seller {
  
  return $LiveSellerCopyWith<$Res>(_self.seller, (value) {
    return _then(_self.copyWith(seller: value));
  });
}/// Create a copy of LiveDetail
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


/// Adds pattern-matching-related methods to [LiveDetail].
extension LiveDetailPatterns on LiveDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveDetail value)  $default,){
final _that = this;
switch (_that) {
case _LiveDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveDetail value)?  $default,){
final _that = this;
switch (_that) {
case _LiveDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LiveSeller seller,  String title,  String? broadcastImage,  int viewers,  int chatCount,  int bidCount,  List<LiveChatMessage> recentChats,  List<LiveAuctionItem> auctionItems,  LiveBidStatus? bidStatus,  String? paymentMethodLabel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveDetail() when $default != null:
return $default(_that.id,_that.seller,_that.title,_that.broadcastImage,_that.viewers,_that.chatCount,_that.bidCount,_that.recentChats,_that.auctionItems,_that.bidStatus,_that.paymentMethodLabel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LiveSeller seller,  String title,  String? broadcastImage,  int viewers,  int chatCount,  int bidCount,  List<LiveChatMessage> recentChats,  List<LiveAuctionItem> auctionItems,  LiveBidStatus? bidStatus,  String? paymentMethodLabel)  $default,) {final _that = this;
switch (_that) {
case _LiveDetail():
return $default(_that.id,_that.seller,_that.title,_that.broadcastImage,_that.viewers,_that.chatCount,_that.bidCount,_that.recentChats,_that.auctionItems,_that.bidStatus,_that.paymentMethodLabel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LiveSeller seller,  String title,  String? broadcastImage,  int viewers,  int chatCount,  int bidCount,  List<LiveChatMessage> recentChats,  List<LiveAuctionItem> auctionItems,  LiveBidStatus? bidStatus,  String? paymentMethodLabel)?  $default,) {final _that = this;
switch (_that) {
case _LiveDetail() when $default != null:
return $default(_that.id,_that.seller,_that.title,_that.broadcastImage,_that.viewers,_that.chatCount,_that.bidCount,_that.recentChats,_that.auctionItems,_that.bidStatus,_that.paymentMethodLabel);case _:
  return null;

}
}

}

/// @nodoc


class _LiveDetail implements LiveDetail {
  const _LiveDetail({required this.id, required this.seller, required this.title, this.broadcastImage, required this.viewers, required this.chatCount, required this.bidCount, final  List<LiveChatMessage> recentChats = const <LiveChatMessage>[], final  List<LiveAuctionItem> auctionItems = const <LiveAuctionItem>[], this.bidStatus, this.paymentMethodLabel}): _recentChats = recentChats,_auctionItems = auctionItems;
  

@override final  String id;
@override final  LiveSeller seller;
@override final  String title;
/// 방송 화면. 데모 단계에서는 사진 에셋이고, 영상이 붙으면 스트림 URL로 바뀐다.
@override final  String? broadcastImage;
@override final  int viewers;
@override final  int chatCount;
@override final  int bidCount;
/// 영상 위·채팅 패널에 보이는 최근 채팅. 오래된 것이 앞이다.
 final  List<LiveChatMessage> _recentChats;
/// 영상 위·채팅 패널에 보이는 최근 채팅. 오래된 것이 앞이다.
@override@JsonKey() List<LiveChatMessage> get recentChats {
  if (_recentChats is EqualUnmodifiableListView) return _recentChats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentChats);
}

/// 경매 상품. 첫 항목이 지금 입찰을 받는 상품이다.
 final  List<LiveAuctionItem> _auctionItems;
/// 경매 상품. 첫 항목이 지금 입찰을 받는 상품이다.
@override@JsonKey() List<LiveAuctionItem> get auctionItems {
  if (_auctionItems is EqualUnmodifiableListView) return _auctionItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_auctionItems);
}

/// 지금 입찰을 받는 상품의 입찰 현황. 진행 중인 경매가 없으면 null.
@override final  LiveBidStatus? bidStatus;
/// 낙찰 시 결제할 등록 결제수단 표시 ("국민 ****1234"). null이면 안내 문구를 숨긴다.
@override final  String? paymentMethodLabel;

/// Create a copy of LiveDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveDetailCopyWith<_LiveDetail> get copyWith => __$LiveDetailCopyWithImpl<_LiveDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.title, title) || other.title == title)&&(identical(other.broadcastImage, broadcastImage) || other.broadcastImage == broadcastImage)&&(identical(other.viewers, viewers) || other.viewers == viewers)&&(identical(other.chatCount, chatCount) || other.chatCount == chatCount)&&(identical(other.bidCount, bidCount) || other.bidCount == bidCount)&&const DeepCollectionEquality().equals(other._recentChats, _recentChats)&&const DeepCollectionEquality().equals(other._auctionItems, _auctionItems)&&(identical(other.bidStatus, bidStatus) || other.bidStatus == bidStatus)&&(identical(other.paymentMethodLabel, paymentMethodLabel) || other.paymentMethodLabel == paymentMethodLabel));
}


@override
int get hashCode => Object.hash(runtimeType,id,seller,title,broadcastImage,viewers,chatCount,bidCount,const DeepCollectionEquality().hash(_recentChats),const DeepCollectionEquality().hash(_auctionItems),bidStatus,paymentMethodLabel);

@override
String toString() {
  return 'LiveDetail(id: $id, seller: $seller, title: $title, broadcastImage: $broadcastImage, viewers: $viewers, chatCount: $chatCount, bidCount: $bidCount, recentChats: $recentChats, auctionItems: $auctionItems, bidStatus: $bidStatus, paymentMethodLabel: $paymentMethodLabel)';
}


}

/// @nodoc
abstract mixin class _$LiveDetailCopyWith<$Res> implements $LiveDetailCopyWith<$Res> {
  factory _$LiveDetailCopyWith(_LiveDetail value, $Res Function(_LiveDetail) _then) = __$LiveDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, LiveSeller seller, String title, String? broadcastImage, int viewers, int chatCount, int bidCount, List<LiveChatMessage> recentChats, List<LiveAuctionItem> auctionItems, LiveBidStatus? bidStatus, String? paymentMethodLabel
});


@override $LiveSellerCopyWith<$Res> get seller;@override $LiveBidStatusCopyWith<$Res>? get bidStatus;

}
/// @nodoc
class __$LiveDetailCopyWithImpl<$Res>
    implements _$LiveDetailCopyWith<$Res> {
  __$LiveDetailCopyWithImpl(this._self, this._then);

  final _LiveDetail _self;
  final $Res Function(_LiveDetail) _then;

/// Create a copy of LiveDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? seller = null,Object? title = null,Object? broadcastImage = freezed,Object? viewers = null,Object? chatCount = null,Object? bidCount = null,Object? recentChats = null,Object? auctionItems = null,Object? bidStatus = freezed,Object? paymentMethodLabel = freezed,}) {
  return _then(_LiveDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,seller: null == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as LiveSeller,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,broadcastImage: freezed == broadcastImage ? _self.broadcastImage : broadcastImage // ignore: cast_nullable_to_non_nullable
as String?,viewers: null == viewers ? _self.viewers : viewers // ignore: cast_nullable_to_non_nullable
as int,chatCount: null == chatCount ? _self.chatCount : chatCount // ignore: cast_nullable_to_non_nullable
as int,bidCount: null == bidCount ? _self.bidCount : bidCount // ignore: cast_nullable_to_non_nullable
as int,recentChats: null == recentChats ? _self._recentChats : recentChats // ignore: cast_nullable_to_non_nullable
as List<LiveChatMessage>,auctionItems: null == auctionItems ? _self._auctionItems : auctionItems // ignore: cast_nullable_to_non_nullable
as List<LiveAuctionItem>,bidStatus: freezed == bidStatus ? _self.bidStatus : bidStatus // ignore: cast_nullable_to_non_nullable
as LiveBidStatus?,paymentMethodLabel: freezed == paymentMethodLabel ? _self.paymentMethodLabel : paymentMethodLabel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of LiveDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveSellerCopyWith<$Res> get seller {
  
  return $LiveSellerCopyWith<$Res>(_self.seller, (value) {
    return _then(_self.copyWith(seller: value));
  });
}/// Create a copy of LiveDetail
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
