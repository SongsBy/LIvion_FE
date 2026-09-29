// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LiveProduct {

 String get name; InspectionGrade get grade;/// 현재가 (원, 정수).
 int get priceWon;/// 시작가 대비 배수. 없으면 표시하지 않는다.
 double? get multiplier;/// 에셋 경로 또는 URL.
 String? get thumbnail;
/// Create a copy of LiveProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveProductCopyWith<LiveProduct> get copyWith => _$LiveProductCopyWithImpl<LiveProduct>(this as LiveProduct, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveProduct&&(identical(other.name, name) || other.name == name)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.priceWon, priceWon) || other.priceWon == priceWon)&&(identical(other.multiplier, multiplier) || other.multiplier == multiplier)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail));
}


@override
int get hashCode => Object.hash(runtimeType,name,grade,priceWon,multiplier,thumbnail);

@override
String toString() {
  return 'LiveProduct(name: $name, grade: $grade, priceWon: $priceWon, multiplier: $multiplier, thumbnail: $thumbnail)';
}


}

/// @nodoc
abstract mixin class $LiveProductCopyWith<$Res>  {
  factory $LiveProductCopyWith(LiveProduct value, $Res Function(LiveProduct) _then) = _$LiveProductCopyWithImpl;
@useResult
$Res call({
 String name, InspectionGrade grade, int priceWon, double? multiplier, String? thumbnail
});




}
/// @nodoc
class _$LiveProductCopyWithImpl<$Res>
    implements $LiveProductCopyWith<$Res> {
  _$LiveProductCopyWithImpl(this._self, this._then);

  final LiveProduct _self;
  final $Res Function(LiveProduct) _then;

/// Create a copy of LiveProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? grade = null,Object? priceWon = null,Object? multiplier = freezed,Object? thumbnail = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as InspectionGrade,priceWon: null == priceWon ? _self.priceWon : priceWon // ignore: cast_nullable_to_non_nullable
as int,multiplier: freezed == multiplier ? _self.multiplier : multiplier // ignore: cast_nullable_to_non_nullable
as double?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LiveProduct].
extension LiveProductPatterns on LiveProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveProduct() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveProduct value)  $default,){
final _that = this;
switch (_that) {
case _LiveProduct():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveProduct value)?  $default,){
final _that = this;
switch (_that) {
case _LiveProduct() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  InspectionGrade grade,  int priceWon,  double? multiplier,  String? thumbnail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveProduct() when $default != null:
return $default(_that.name,_that.grade,_that.priceWon,_that.multiplier,_that.thumbnail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  InspectionGrade grade,  int priceWon,  double? multiplier,  String? thumbnail)  $default,) {final _that = this;
switch (_that) {
case _LiveProduct():
return $default(_that.name,_that.grade,_that.priceWon,_that.multiplier,_that.thumbnail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  InspectionGrade grade,  int priceWon,  double? multiplier,  String? thumbnail)?  $default,) {final _that = this;
switch (_that) {
case _LiveProduct() when $default != null:
return $default(_that.name,_that.grade,_that.priceWon,_that.multiplier,_that.thumbnail);case _:
  return null;

}
}

}

/// @nodoc


class _LiveProduct implements LiveProduct {
  const _LiveProduct({required this.name, required this.grade, required this.priceWon, this.multiplier, this.thumbnail});
  

@override final  String name;
@override final  InspectionGrade grade;
/// 현재가 (원, 정수).
@override final  int priceWon;
/// 시작가 대비 배수. 없으면 표시하지 않는다.
@override final  double? multiplier;
/// 에셋 경로 또는 URL.
@override final  String? thumbnail;

/// Create a copy of LiveProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveProductCopyWith<_LiveProduct> get copyWith => __$LiveProductCopyWithImpl<_LiveProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveProduct&&(identical(other.name, name) || other.name == name)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.priceWon, priceWon) || other.priceWon == priceWon)&&(identical(other.multiplier, multiplier) || other.multiplier == multiplier)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail));
}


@override
int get hashCode => Object.hash(runtimeType,name,grade,priceWon,multiplier,thumbnail);

@override
String toString() {
  return 'LiveProduct(name: $name, grade: $grade, priceWon: $priceWon, multiplier: $multiplier, thumbnail: $thumbnail)';
}


}

/// @nodoc
abstract mixin class _$LiveProductCopyWith<$Res> implements $LiveProductCopyWith<$Res> {
  factory _$LiveProductCopyWith(_LiveProduct value, $Res Function(_LiveProduct) _then) = __$LiveProductCopyWithImpl;
@override @useResult
$Res call({
 String name, InspectionGrade grade, int priceWon, double? multiplier, String? thumbnail
});




}
/// @nodoc
class __$LiveProductCopyWithImpl<$Res>
    implements _$LiveProductCopyWith<$Res> {
  __$LiveProductCopyWithImpl(this._self, this._then);

  final _LiveProduct _self;
  final $Res Function(_LiveProduct) _then;

/// Create a copy of LiveProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? grade = null,Object? priceWon = null,Object? multiplier = freezed,Object? thumbnail = freezed,}) {
  return _then(_LiveProduct(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as InspectionGrade,priceWon: null == priceWon ? _self.priceWon : priceWon // ignore: cast_nullable_to_non_nullable
as int,multiplier: freezed == multiplier ? _self.multiplier : multiplier // ignore: cast_nullable_to_non_nullable
as double?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$LiveSummary {

 String get id; String get sellerName; String? get sellerAvatar; String get title; String? get thumbnail; int get viewers;/// 카테고리 칩과 같은 이름 ("푸드", "뷰티" ...).
 String get category;/// 마감까지 남은 일수. null이면 D-day 뱃지를 보이지 않는다.
 int? get dDay; bool get isClosingSoon;/// Livion 공식 방송. 판매자 사진 대신 브랜드 아바타를 그린다.
 bool get isOfficial; bool get isBookmarked; LiveProduct get product;
/// Create a copy of LiveSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveSummaryCopyWith<LiveSummary> get copyWith => _$LiveSummaryCopyWithImpl<LiveSummary>(this as LiveSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.sellerName, sellerName) || other.sellerName == sellerName)&&(identical(other.sellerAvatar, sellerAvatar) || other.sellerAvatar == sellerAvatar)&&(identical(other.title, title) || other.title == title)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.viewers, viewers) || other.viewers == viewers)&&(identical(other.category, category) || other.category == category)&&(identical(other.dDay, dDay) || other.dDay == dDay)&&(identical(other.isClosingSoon, isClosingSoon) || other.isClosingSoon == isClosingSoon)&&(identical(other.isOfficial, isOfficial) || other.isOfficial == isOfficial)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,id,sellerName,sellerAvatar,title,thumbnail,viewers,category,dDay,isClosingSoon,isOfficial,isBookmarked,product);

@override
String toString() {
  return 'LiveSummary(id: $id, sellerName: $sellerName, sellerAvatar: $sellerAvatar, title: $title, thumbnail: $thumbnail, viewers: $viewers, category: $category, dDay: $dDay, isClosingSoon: $isClosingSoon, isOfficial: $isOfficial, isBookmarked: $isBookmarked, product: $product)';
}


}

/// @nodoc
abstract mixin class $LiveSummaryCopyWith<$Res>  {
  factory $LiveSummaryCopyWith(LiveSummary value, $Res Function(LiveSummary) _then) = _$LiveSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String sellerName, String? sellerAvatar, String title, String? thumbnail, int viewers, String category, int? dDay, bool isClosingSoon, bool isOfficial, bool isBookmarked, LiveProduct product
});


$LiveProductCopyWith<$Res> get product;

}
/// @nodoc
class _$LiveSummaryCopyWithImpl<$Res>
    implements $LiveSummaryCopyWith<$Res> {
  _$LiveSummaryCopyWithImpl(this._self, this._then);

  final LiveSummary _self;
  final $Res Function(LiveSummary) _then;

/// Create a copy of LiveSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sellerName = null,Object? sellerAvatar = freezed,Object? title = null,Object? thumbnail = freezed,Object? viewers = null,Object? category = null,Object? dDay = freezed,Object? isClosingSoon = null,Object? isOfficial = null,Object? isBookmarked = null,Object? product = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,sellerAvatar: freezed == sellerAvatar ? _self.sellerAvatar : sellerAvatar // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,viewers: null == viewers ? _self.viewers : viewers // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,dDay: freezed == dDay ? _self.dDay : dDay // ignore: cast_nullable_to_non_nullable
as int?,isClosingSoon: null == isClosingSoon ? _self.isClosingSoon : isClosingSoon // ignore: cast_nullable_to_non_nullable
as bool,isOfficial: null == isOfficial ? _self.isOfficial : isOfficial // ignore: cast_nullable_to_non_nullable
as bool,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as LiveProduct,
  ));
}
/// Create a copy of LiveSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveProductCopyWith<$Res> get product {
  
  return $LiveProductCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [LiveSummary].
extension LiveSummaryPatterns on LiveSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveSummary value)  $default,){
final _that = this;
switch (_that) {
case _LiveSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveSummary value)?  $default,){
final _that = this;
switch (_that) {
case _LiveSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sellerName,  String? sellerAvatar,  String title,  String? thumbnail,  int viewers,  String category,  int? dDay,  bool isClosingSoon,  bool isOfficial,  bool isBookmarked,  LiveProduct product)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveSummary() when $default != null:
return $default(_that.id,_that.sellerName,_that.sellerAvatar,_that.title,_that.thumbnail,_that.viewers,_that.category,_that.dDay,_that.isClosingSoon,_that.isOfficial,_that.isBookmarked,_that.product);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sellerName,  String? sellerAvatar,  String title,  String? thumbnail,  int viewers,  String category,  int? dDay,  bool isClosingSoon,  bool isOfficial,  bool isBookmarked,  LiveProduct product)  $default,) {final _that = this;
switch (_that) {
case _LiveSummary():
return $default(_that.id,_that.sellerName,_that.sellerAvatar,_that.title,_that.thumbnail,_that.viewers,_that.category,_that.dDay,_that.isClosingSoon,_that.isOfficial,_that.isBookmarked,_that.product);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sellerName,  String? sellerAvatar,  String title,  String? thumbnail,  int viewers,  String category,  int? dDay,  bool isClosingSoon,  bool isOfficial,  bool isBookmarked,  LiveProduct product)?  $default,) {final _that = this;
switch (_that) {
case _LiveSummary() when $default != null:
return $default(_that.id,_that.sellerName,_that.sellerAvatar,_that.title,_that.thumbnail,_that.viewers,_that.category,_that.dDay,_that.isClosingSoon,_that.isOfficial,_that.isBookmarked,_that.product);case _:
  return null;

}
}

}

/// @nodoc


class _LiveSummary implements LiveSummary {
  const _LiveSummary({required this.id, required this.sellerName, this.sellerAvatar, required this.title, this.thumbnail, required this.viewers, required this.category, this.dDay, this.isClosingSoon = false, this.isOfficial = false, this.isBookmarked = false, required this.product});
  

@override final  String id;
@override final  String sellerName;
@override final  String? sellerAvatar;
@override final  String title;
@override final  String? thumbnail;
@override final  int viewers;
/// 카테고리 칩과 같은 이름 ("푸드", "뷰티" ...).
@override final  String category;
/// 마감까지 남은 일수. null이면 D-day 뱃지를 보이지 않는다.
@override final  int? dDay;
@override@JsonKey() final  bool isClosingSoon;
/// Livion 공식 방송. 판매자 사진 대신 브랜드 아바타를 그린다.
@override@JsonKey() final  bool isOfficial;
@override@JsonKey() final  bool isBookmarked;
@override final  LiveProduct product;

/// Create a copy of LiveSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveSummaryCopyWith<_LiveSummary> get copyWith => __$LiveSummaryCopyWithImpl<_LiveSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.sellerName, sellerName) || other.sellerName == sellerName)&&(identical(other.sellerAvatar, sellerAvatar) || other.sellerAvatar == sellerAvatar)&&(identical(other.title, title) || other.title == title)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.viewers, viewers) || other.viewers == viewers)&&(identical(other.category, category) || other.category == category)&&(identical(other.dDay, dDay) || other.dDay == dDay)&&(identical(other.isClosingSoon, isClosingSoon) || other.isClosingSoon == isClosingSoon)&&(identical(other.isOfficial, isOfficial) || other.isOfficial == isOfficial)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,id,sellerName,sellerAvatar,title,thumbnail,viewers,category,dDay,isClosingSoon,isOfficial,isBookmarked,product);

@override
String toString() {
  return 'LiveSummary(id: $id, sellerName: $sellerName, sellerAvatar: $sellerAvatar, title: $title, thumbnail: $thumbnail, viewers: $viewers, category: $category, dDay: $dDay, isClosingSoon: $isClosingSoon, isOfficial: $isOfficial, isBookmarked: $isBookmarked, product: $product)';
}


}

/// @nodoc
abstract mixin class _$LiveSummaryCopyWith<$Res> implements $LiveSummaryCopyWith<$Res> {
  factory _$LiveSummaryCopyWith(_LiveSummary value, $Res Function(_LiveSummary) _then) = __$LiveSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String sellerName, String? sellerAvatar, String title, String? thumbnail, int viewers, String category, int? dDay, bool isClosingSoon, bool isOfficial, bool isBookmarked, LiveProduct product
});


@override $LiveProductCopyWith<$Res> get product;

}
/// @nodoc
class __$LiveSummaryCopyWithImpl<$Res>
    implements _$LiveSummaryCopyWith<$Res> {
  __$LiveSummaryCopyWithImpl(this._self, this._then);

  final _LiveSummary _self;
  final $Res Function(_LiveSummary) _then;

/// Create a copy of LiveSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sellerName = null,Object? sellerAvatar = freezed,Object? title = null,Object? thumbnail = freezed,Object? viewers = null,Object? category = null,Object? dDay = freezed,Object? isClosingSoon = null,Object? isOfficial = null,Object? isBookmarked = null,Object? product = null,}) {
  return _then(_LiveSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,sellerAvatar: freezed == sellerAvatar ? _self.sellerAvatar : sellerAvatar // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,viewers: null == viewers ? _self.viewers : viewers // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,dDay: freezed == dDay ? _self.dDay : dDay // ignore: cast_nullable_to_non_nullable
as int?,isClosingSoon: null == isClosingSoon ? _self.isClosingSoon : isClosingSoon // ignore: cast_nullable_to_non_nullable
as bool,isOfficial: null == isOfficial ? _self.isOfficial : isOfficial // ignore: cast_nullable_to_non_nullable
as bool,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as LiveProduct,
  ));
}

/// Create a copy of LiveSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveProductCopyWith<$Res> get product {
  
  return $LiveProductCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

// dart format on
