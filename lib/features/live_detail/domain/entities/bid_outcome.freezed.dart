// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bid_outcome.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BidOutcome {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BidOutcome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BidOutcome()';
}


}

/// @nodoc
class $BidOutcomeCopyWith<$Res>  {
$BidOutcomeCopyWith(BidOutcome _, $Res Function(BidOutcome) __);
}


/// Adds pattern-matching-related methods to [BidOutcome].
extension BidOutcomePatterns on BidOutcome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BidLeading value)?  leading,TResult Function( BidWon value)?  won,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BidLeading() when leading != null:
return leading(_that);case BidWon() when won != null:
return won(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BidLeading value)  leading,required TResult Function( BidWon value)  won,}){
final _that = this;
switch (_that) {
case BidLeading():
return leading(_that);case BidWon():
return won(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BidLeading value)?  leading,TResult? Function( BidWon value)?  won,}){
final _that = this;
switch (_that) {
case BidLeading() when leading != null:
return leading(_that);case BidWon() when won != null:
return won(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  leading,TResult Function( String orderId)?  won,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BidLeading() when leading != null:
return leading();case BidWon() when won != null:
return won(_that.orderId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  leading,required TResult Function( String orderId)  won,}) {final _that = this;
switch (_that) {
case BidLeading():
return leading();case BidWon():
return won(_that.orderId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  leading,TResult? Function( String orderId)?  won,}) {final _that = this;
switch (_that) {
case BidLeading() when leading != null:
return leading();case BidWon() when won != null:
return won(_that.orderId);case _:
  return null;

}
}

}

/// @nodoc


class BidLeading implements BidOutcome {
  const BidLeading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BidLeading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BidOutcome.leading()';
}


}




/// @nodoc


class BidWon implements BidOutcome {
  const BidWon({required this.orderId});
  

 final  String orderId;

/// Create a copy of BidOutcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BidWonCopyWith<BidWon> get copyWith => _$BidWonCopyWithImpl<BidWon>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BidWon&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,orderId);

@override
String toString() {
  return 'BidOutcome.won(orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class $BidWonCopyWith<$Res> implements $BidOutcomeCopyWith<$Res> {
  factory $BidWonCopyWith(BidWon value, $Res Function(BidWon) _then) = _$BidWonCopyWithImpl;
@useResult
$Res call({
 String orderId
});




}
/// @nodoc
class _$BidWonCopyWithImpl<$Res>
    implements $BidWonCopyWith<$Res> {
  _$BidWonCopyWithImpl(this._self, this._then);

  final BidWon _self;
  final $Res Function(BidWon) _then;

/// Create a copy of BidOutcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,}) {
  return _then(BidWon(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
