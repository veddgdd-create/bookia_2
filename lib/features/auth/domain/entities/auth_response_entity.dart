import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_entity.dart';

part 'auth_response_entity.freezed.dart';

@freezed
class AuthResponseEntity with _$AuthResponseEntity {
  const factory AuthResponseEntity({
    required UserEntity data,
    @Default('') String token,
  }) = _AuthResponseEntity;

  @override
  // TODO: implement data
  UserEntity get data => throw UnimplementedError();

  @override
  // TODO: implement token
  String get token => throw UnimplementedError();
}
