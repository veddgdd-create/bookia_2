import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/failures.dart';
import 'user_entity.dart';

part 'auth_response_entity.freezed.dart';

@freezed
class AuthResponseEntity with _$AuthResponseEntity {
  const factory AuthResponseEntity({
    required UserEntity data,
    @Default('') String token,
  }) = _AuthResponseEntity;
}
