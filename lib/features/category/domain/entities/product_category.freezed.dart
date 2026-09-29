// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductCategory {

 String get id; String get name;/// 원형 아이콘 그림. 에셋 경로 또는 URL. null이면 [mark] 글자를 쓴다.
 String? get icon;/// 그림이 없을 때 원 안에 쓰는 글자 ("ALL").
 String? get mark;/// 하위 분류 칩. 첫 항목이 "전체"다.
 List<String> get subcategories;
/// Create a copy of ProductCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCategoryCopyWith<ProductCategory> get copyWith => _$ProductCategoryCopyWithImpl<ProductCategory>(this as ProductCategory, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.mark, mark) || other.mark == mark)&&const DeepCollectionEquality().equals(other.subcategories, subcategories));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,icon,mark,const DeepCollectionEquality().hash(subcategories));

@override
String toString() {
  return 'ProductCategory(id: $id, name: $name, icon: $icon, mark: $mark, subcategories: $subcategories)';
}


}

/// @nodoc
abstract mixin class $ProductCategoryCopyWith<$Res>  {
  factory $ProductCategoryCopyWith(ProductCategory value, $Res Function(ProductCategory) _then) = _$ProductCategoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? icon, String? mark, List<String> subcategories
});




}
/// @nodoc
class _$ProductCategoryCopyWithImpl<$Res>
    implements $ProductCategoryCopyWith<$Res> {
  _$ProductCategoryCopyWithImpl(this._self, this._then);

  final ProductCategory _self;
  final $Res Function(ProductCategory) _then;

/// Create a copy of ProductCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? icon = freezed,Object? mark = freezed,Object? subcategories = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,mark: freezed == mark ? _self.mark : mark // ignore: cast_nullable_to_non_nullable
as String?,subcategories: null == subcategories ? _self.subcategories : subcategories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductCategory].
extension ProductCategoryPatterns on ProductCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductCategory value)  $default,){
final _that = this;
switch (_that) {
case _ProductCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductCategory value)?  $default,){
final _that = this;
switch (_that) {
case _ProductCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? icon,  String? mark,  List<String> subcategories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductCategory() when $default != null:
return $default(_that.id,_that.name,_that.icon,_that.mark,_that.subcategories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? icon,  String? mark,  List<String> subcategories)  $default,) {final _that = this;
switch (_that) {
case _ProductCategory():
return $default(_that.id,_that.name,_that.icon,_that.mark,_that.subcategories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? icon,  String? mark,  List<String> subcategories)?  $default,) {final _that = this;
switch (_that) {
case _ProductCategory() when $default != null:
return $default(_that.id,_that.name,_that.icon,_that.mark,_that.subcategories);case _:
  return null;

}
}

}

/// @nodoc


class _ProductCategory implements ProductCategory {
  const _ProductCategory({required this.id, required this.name, this.icon, this.mark, final  List<String> subcategories = const <String>['전체']}): _subcategories = subcategories;
  

@override final  String id;
@override final  String name;
/// 원형 아이콘 그림. 에셋 경로 또는 URL. null이면 [mark] 글자를 쓴다.
@override final  String? icon;
/// 그림이 없을 때 원 안에 쓰는 글자 ("ALL").
@override final  String? mark;
/// 하위 분류 칩. 첫 항목이 "전체"다.
 final  List<String> _subcategories;
/// 하위 분류 칩. 첫 항목이 "전체"다.
@override@JsonKey() List<String> get subcategories {
  if (_subcategories is EqualUnmodifiableListView) return _subcategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subcategories);
}


/// Create a copy of ProductCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCategoryCopyWith<_ProductCategory> get copyWith => __$ProductCategoryCopyWithImpl<_ProductCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.mark, mark) || other.mark == mark)&&const DeepCollectionEquality().equals(other._subcategories, _subcategories));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,icon,mark,const DeepCollectionEquality().hash(_subcategories));

@override
String toString() {
  return 'ProductCategory(id: $id, name: $name, icon: $icon, mark: $mark, subcategories: $subcategories)';
}


}

/// @nodoc
abstract mixin class _$ProductCategoryCopyWith<$Res> implements $ProductCategoryCopyWith<$Res> {
  factory _$ProductCategoryCopyWith(_ProductCategory value, $Res Function(_ProductCategory) _then) = __$ProductCategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? icon, String? mark, List<String> subcategories
});




}
/// @nodoc
class __$ProductCategoryCopyWithImpl<$Res>
    implements _$ProductCategoryCopyWith<$Res> {
  __$ProductCategoryCopyWithImpl(this._self, this._then);

  final _ProductCategory _self;
  final $Res Function(_ProductCategory) _then;

/// Create a copy of ProductCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? icon = freezed,Object? mark = freezed,Object? subcategories = null,}) {
  return _then(_ProductCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,mark: freezed == mark ? _self.mark : mark // ignore: cast_nullable_to_non_nullable
as String?,subcategories: null == subcategories ? _self._subcategories : subcategories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
mixin _$CategoryCatalog {

 List<ProductCategory> get categories;/// 처음 선택된 대분류 id. 목록에 없으면 첫 항목을 쓴다.
 String get initialCategoryId;
/// Create a copy of CategoryCatalog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCatalogCopyWith<CategoryCatalog> get copyWith => _$CategoryCatalogCopyWithImpl<CategoryCatalog>(this as CategoryCatalog, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryCatalog&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.initialCategoryId, initialCategoryId) || other.initialCategoryId == initialCategoryId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),initialCategoryId);

@override
String toString() {
  return 'CategoryCatalog(categories: $categories, initialCategoryId: $initialCategoryId)';
}


}

/// @nodoc
abstract mixin class $CategoryCatalogCopyWith<$Res>  {
  factory $CategoryCatalogCopyWith(CategoryCatalog value, $Res Function(CategoryCatalog) _then) = _$CategoryCatalogCopyWithImpl;
@useResult
$Res call({
 List<ProductCategory> categories, String initialCategoryId
});




}
/// @nodoc
class _$CategoryCatalogCopyWithImpl<$Res>
    implements $CategoryCatalogCopyWith<$Res> {
  _$CategoryCatalogCopyWithImpl(this._self, this._then);

  final CategoryCatalog _self;
  final $Res Function(CategoryCatalog) _then;

/// Create a copy of CategoryCatalog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? initialCategoryId = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ProductCategory>,initialCategoryId: null == initialCategoryId ? _self.initialCategoryId : initialCategoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryCatalog].
extension CategoryCatalogPatterns on CategoryCatalog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryCatalog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryCatalog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryCatalog value)  $default,){
final _that = this;
switch (_that) {
case _CategoryCatalog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryCatalog value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryCatalog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProductCategory> categories,  String initialCategoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryCatalog() when $default != null:
return $default(_that.categories,_that.initialCategoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProductCategory> categories,  String initialCategoryId)  $default,) {final _that = this;
switch (_that) {
case _CategoryCatalog():
return $default(_that.categories,_that.initialCategoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProductCategory> categories,  String initialCategoryId)?  $default,) {final _that = this;
switch (_that) {
case _CategoryCatalog() when $default != null:
return $default(_that.categories,_that.initialCategoryId);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryCatalog implements CategoryCatalog {
  const _CategoryCatalog({required final  List<ProductCategory> categories, required this.initialCategoryId}): _categories = categories;
  

 final  List<ProductCategory> _categories;
@override List<ProductCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

/// 처음 선택된 대분류 id. 목록에 없으면 첫 항목을 쓴다.
@override final  String initialCategoryId;

/// Create a copy of CategoryCatalog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCatalogCopyWith<_CategoryCatalog> get copyWith => __$CategoryCatalogCopyWithImpl<_CategoryCatalog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryCatalog&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.initialCategoryId, initialCategoryId) || other.initialCategoryId == initialCategoryId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),initialCategoryId);

@override
String toString() {
  return 'CategoryCatalog(categories: $categories, initialCategoryId: $initialCategoryId)';
}


}

/// @nodoc
abstract mixin class _$CategoryCatalogCopyWith<$Res> implements $CategoryCatalogCopyWith<$Res> {
  factory _$CategoryCatalogCopyWith(_CategoryCatalog value, $Res Function(_CategoryCatalog) _then) = __$CategoryCatalogCopyWithImpl;
@override @useResult
$Res call({
 List<ProductCategory> categories, String initialCategoryId
});




}
/// @nodoc
class __$CategoryCatalogCopyWithImpl<$Res>
    implements _$CategoryCatalogCopyWith<$Res> {
  __$CategoryCatalogCopyWithImpl(this._self, this._then);

  final _CategoryCatalog _self;
  final $Res Function(_CategoryCatalog) _then;

/// Create a copy of CategoryCatalog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? initialCategoryId = null,}) {
  return _then(_CategoryCatalog(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ProductCategory>,initialCategoryId: null == initialCategoryId ? _self.initialCategoryId : initialCategoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
