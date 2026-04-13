// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthResponseEntity {

 UserEntity get data; String get token;
/// Create a copy of AuthResponseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResponseEntityCopyWith<AuthResponseEntity> get copyWith => _$AuthResponseEntityCopyWithImpl<AuthResponseEntity>(this as AuthResponseEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResponseEntity&&(identical(other.data, data) || other.data == data)&&(identical(other.token, token) || other.token == token));
}


@override
int get hashCode => Object.hash(runtimeType,data,token);

@override
String toString() {
  return 'AuthResponseEntity(data: $data, token: $token)';
}


}

/// @nodoc
abstract mixin class $AuthResponseEntityCopyWith<$Res>  {
  factory $AuthResponseEntityCopyWith(AuthResponseEntity value, $Res Function(AuthResponseEntity) _then) = _$AuthResponseEntityCopyWithImpl;
@useResult
$Res call({
 UserEntity data, String token
});


$UserEntityCopyWith<$Res> get data;

}
/// @nodoc
class _$AuthResponseEntityCopyWithImpl<$Res>
    implements $AuthResponseEntityCopyWith<$Res> {
  _$AuthResponseEntityCopyWithImpl(this._self, this._then);

  final AuthResponseEntity _self;
  final $Res Function(AuthResponseEntity) _then;

/// Create a copy of AuthResponseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? token = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserEntity,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of AuthResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get data {
  
  return $UserEntityCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthResponseEntity].
extension AuthResponseEntityPatterns on AuthResponseEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthResponseEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthResponseEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthResponseEntity value)  $default,){
final _that = this;
switch (_that) {
case _AuthResponseEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthResponseEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AuthResponseEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserEntity data,  String token)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthResponseEntity() when $default != null:
return $default(_that.data,_that.token);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserEntity data,  String token)  $default,) {final _that = this;
switch (_that) {
case _AuthResponseEntity():
return $default(_that.data,_that.token);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserEntity data,  String token)?  $default,) {final _that = this;
switch (_that) {
case _AuthResponseEntity() when $default != null:
return $default(_that.data,_that.token);case _:
  return null;

}
}

}

/// @nodoc


class _AuthResponseEntity implements AuthResponseEntity {
  const _AuthResponseEntity({required this.data, this.token = ''});
  

@override final  UserEntity data;
@override@JsonKey() final  String token;

/// Create a copy of AuthResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResponseEntityCopyWith<_AuthResponseEntity> get copyWith => __$AuthResponseEntityCopyWithImpl<_AuthResponseEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResponseEntity&&(identical(other.data, data) || other.data == data)&&(identical(other.token, token) || other.token == token));
}


@override
int get hashCode => Object.hash(runtimeType,data,token);

@override
String toString() {
  return 'AuthResponseEntity(data: $data, token: $token)';
}


}

/// @nodoc
abstract mixin class _$AuthResponseEntityCopyWith<$Res> implements $AuthResponseEntityCopyWith<$Res> {
  factory _$AuthResponseEntityCopyWith(_AuthResponseEntity value, $Res Function(_AuthResponseEntity) _then) = __$AuthResponseEntityCopyWithImpl;
@override @useResult
$Res call({
 UserEntity data, String token
});


@override $UserEntityCopyWith<$Res> get data;

}
/// @nodoc
class __$AuthResponseEntityCopyWithImpl<$Res>
    implements _$AuthResponseEntityCopyWith<$Res> {
  __$AuthResponseEntityCopyWithImpl(this._self, this._then);

  final _AuthResponseEntity _self;
  final $Res Function(_AuthResponseEntity) _then;

/// Create a copy of AuthResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? token = null,}) {
  return _then(_AuthResponseEntity(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserEntity,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AuthResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res> get data {
  
  return $UserEntityCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
