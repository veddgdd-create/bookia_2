import 'dart:developer' as developer;

import 'package:dartz/dartz.dart';
import 'package:bookia/core/errors/exceptions.dart';
import 'package:bookia/core/errors/failures.dart';
import 'package:bookia/core/services/dio/api_endpoints.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/feature/auth/data/models/auth_response/data.dart';

class ProfileRepo {
  static Future<Either<Failure, UserModel>> getProfile() async {
    try {
      var user = SharedPref.getUserData();
      var token = user?.token ?? '';
      var headers = {'Authorization': 'Bearer $token'};
      var res = await DioProvider.get(
        endpoint: ApiEndpoints.profile,
        headers: headers,
      );
      var body = res.data;
      var userModel = UserModel.fromJson(body);
      return Right(userModel);
    } on ServerException catch (e) {
      developer.log('Server error in getProfile: ${e.message}');
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      developer.log('Network error in getProfile: ${e.message}');
      return Left(NetworkFailure(e.message));
    } on AuthException catch (e) {
      developer.log('Auth error in getProfile: ${e.message}');
      return Left(AuthFailure(e.message));
    } catch (e) {
      developer.log('Unexpected error in getProfile: $e');
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }

  static Future<Either<Failure, UserModel>> updateProfile({
    required String name,
    required String email,
    required String phone,
    String? address,
  }) async {
    try {
      var user = SharedPref.getUserData();
      var token = user?.token ?? '';
      var headers = {'Authorization': 'Bearer $token'};
      var body = {
        'name': name,
        'email': email,
        'phone': phone,
        'address': address ?? '',
      };
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.updateProfile,
        data: body,
        headers: headers,
      );
      if (res.statusCode == 200) {
        var updatedUser = UserModel.fromJson(res.data);
        SharedPref.saveUserData(updatedUser);
        return Right(updatedUser);
      } else {
        return Left(
          ServerFailure(
            'Failed to update profile with status: ${res.statusCode}',
          ),
        );
      }
    } on ServerException catch (e) {
      developer.log('Server error in updateProfile: ${e.message}');
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      developer.log('Network error in updateProfile: ${e.message}');
      return Left(NetworkFailure(e.message));
    } on AuthException catch (e) {
      developer.log('Auth error in updateProfile: ${e.message}');
      return Left(AuthFailure(e.message));
    } catch (e) {
      developer.log('Unexpected error in updateProfile: $e');
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }
}
