import 'dart:math' as developer;
import 'package:bookia/features/auth/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/features/auth/data/models/auth_params.dart';
import 'package:bookia/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:bookia/core/errors/exceptions.dart';
import 'package:bookia/core/errors/failures.dart';
import 'package:bookia/core/services/dio/api_endpoints.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';

class AuthRepo {
  static Future<Either<Failure, AuthResponse>> register(
    AuthParams params,
  ) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.register,
        data: params.toJson(),
      );
      if (res.statusCode == 201) {
        var body = res.data;
        var userObj = AuthResponse.fromJson(body);
        SharedPref.saveUserData(userObj.data as UserModel?);
        return Right(userObj);
      } else {
        return Left(
          ServerFailure('Registration failed with status: ${res.statusCode}'),
        );
      }
    } on ServerException catch (e) {
      developer.log('Server error in register: ${e.message}' as num);
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      developer.log('Network error in register: ${e.message}' as num);
      return Left(NetworkFailure(e.message));
    } on AuthException catch (e) {
      developer.log('Auth error in register: ${e.message}' as num);
      return Left(AuthFailure(e.message));
    } catch (e) {
      developer.log('Unexpected error in register: $e' as num);
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }

  static Future<Either<Failure, AuthResponse>> login(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.login,
        data: params.toJson(),
      );
      if (res.statusCode == 200) {
        var body = res.data;
        var userObj = AuthResponse.fromJson(body);
        SharedPref.saveUserData(userObj.data as UserModel?);
        return Right(userObj);
      } else {
        return Left(
          ServerFailure('Login failed with status: ${res.statusCode}'),
        );
      }
    } on ServerException catch (e) {
      developer.log('Server error in login: ${e.message}' as num);
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      developer.log('Network error in login: ${e.message}' as num);
      return Left(NetworkFailure(e.message));
    } on AuthException catch (e) {
      developer.log('Auth error in login: ${e.message}' as num);
      return Left(AuthFailure(e.message));
    } catch (e) {
      developer.log('Unexpected error in login: $e' as num);
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }
}
