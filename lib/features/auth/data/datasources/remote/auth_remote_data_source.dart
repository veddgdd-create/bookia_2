import 'package:bookia/core/errors/exceptions.dart';
import 'package:bookia/core/services/dio/api_endpoints.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/features/auth/data/models/auth_response_model.dart';
import 'package:injectable/injectable.dart'; // Assume moved or copy

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(String email, String password);
  Future<AuthResponseModel> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  );
}

@injectable
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<AuthResponseModel> login(String email, String password) async {
    final params = {'email': email, 'password': password};
    final res = await DioProvider.post(
      endpoint: ApiEndpoints.login,
      data: params,
    );
    if (res.statusCode == 200) {
      return AuthResponseModel.fromJson(res.data);
    } else {
      throw ServerException('Login failed');
    }
  }

  @override
  Future<AuthResponseModel> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    final params = {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
    };
    final res = await DioProvider.post(
      endpoint: ApiEndpoints.register,
      data: params,
    );
    if (res.statusCode == 201) {
      return AuthResponseModel.fromJson(res.data);
    } else {
      throw ServerException('Registration failed');
    }
  }
}
