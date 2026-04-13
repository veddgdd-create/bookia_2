// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'best_seller_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BestSellerEntity {

 int get id; String get title; String get description; String get image; double get price; double get rating;
/// Create a copy of BestSellerEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BestSellerEntityCopyWith<BestSellerEntity> get copyWith => _$BestSellerEntityCopyWithImpl<BestSellerEntity>(this as BestSellerEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BestSellerEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.price, price) || other.price == price)&&(identical(other.rating, rating) || other.rating == rating));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,image,price,rating);

@override
String toString() {
  return 'BestSellerEntity(id: $id, title: $title, description: $description, image: $image, price: $price, rating: $rating)';
}


}

/// @nodoc
abstract mixin class $BestSellerEntityCopyWith<$Res>  {
  factory $BestSellerEntityCopyWith(BestSellerEntity value, $Res Function(BestSellerEntity) _then) = _$BestSellerEntityCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, String image, double price, double rating
});




}
/// @nodoc
class _$BestSellerEntityCopyWithImpl<$Res>
    implements $BestSellerEntityCopyWith<$Res> {
  _$BestSellerEntityCopyWithImpl(this._self, this._then);

  final BestSellerEntity _self;
  final $Res Function(BestSellerEntity) _then;

/// Create a copy of BestSellerEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? image = null,Object? price = null,Object? rating = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BestSellerEntity].
extension BestSellerEntityPatterns on BestSellerEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BestSellerEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BestSellerEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BestSellerEntity value)  $default,){
final _that = this;
switch (_that) {
case _BestSellerEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BestSellerEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BestSellerEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String description,  String image,  double price,  double rating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BestSellerEntity() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.image,_that.price,_that.rating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String description,  String image,  double price,  double rating)  $default,) {final _that = this;
switch (_that) {
case _BestSellerEntity():
return $default(_that.id,_that.title,_that.description,_that.image,_that.price,_that.rating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String description,  String image,  double price,  double rating)?  $default,) {final _that = this;
switch (_that) {
case _BestSellerEntity() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.image,_that.price,_that.rating);case _:
  return null;

}
}

}

/// @nodoc


class _BestSellerEntity implements BestSellerEntity {
  const _BestSellerEntity({required this.id, required this.title, required this.description, required this.image, required this.price, required this.rating});
  

@override final  int id;
@override final  String title;
@override final  String description;
@override final  String image;
@override final  double price;
@override final  double rating;

/// Create a copy of BestSellerEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BestSellerEntityCopyWith<_BestSellerEntity> get copyWith => __$BestSellerEntityCopyWithImpl<_BestSellerEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BestSellerEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.price, price) || other.price == price)&&(identical(other.rating, rating) || other.rating == rating));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,image,price,rating);

@override
String toString() {
  return 'BestSellerEntity(id: $id, title: $title, description: $description, image: $image, price: $price, rating: $rating)';
}


}

/// @nodoc
abstract mixin class _$BestSellerEntityCopyWith<$Res> implements $BestSellerEntityCopyWith<$Res> {
  factory _$BestSellerEntityCopyWith(_BestSellerEntity value, $Res Function(_BestSellerEntity) _then) = __$BestSellerEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, String image, double price, double rating
});




}
/// @nodoc
class __$BestSellerEntityCopyWithImpl<$Res>
    implements _$BestSellerEntityCopyWith<$Res> {
  __$BestSellerEntityCopyWithImpl(this._self, this._then);

  final _BestSellerEntity _self;
  final $Res Function(_BestSellerEntity) _then;

/// Create a copy of BestSellerEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? image = null,Object? price = null,Object? rating = null,}) {
  return _then(_BestSellerEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
