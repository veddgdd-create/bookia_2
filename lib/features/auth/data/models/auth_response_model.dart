import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';
import '../../domain/entities/auth_response_entity.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    required UserModel data,
    @JsonKey(name: 'token') @Default('') String token,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  const AuthResponseModel._();

  AuthResponseEntity toEntity() =>
      AuthResponseEntity(data: data.toEntity(), token: token);

  @override
  // TODO: implement data
  UserModel get data => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement token
  String get token => throw UnimplementedError();
}
