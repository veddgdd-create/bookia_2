import 'dart:developer' as developer;

import 'package:dartz/dartz.dart';
import 'package:bookia/core/errors/exceptions.dart';
import 'package:bookia/core/errors/failures.dart';
import 'package:bookia/core/services/dio/api_endpoints.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/feature/wishlist/data/models/wishlist_response/datum.dart';
import 'package:bookia/feature/wishlist/data/models/wishlist_response/wishlist_response.dart';

class WishlistRepo {
  static Future<Either<Failure, WishlistResponse>> getWishlist() async {
    try {
      developer.log(SharedPref.getUserData()?.token.toString() ?? "No token");
      var res = await DioProvider.get(
        endpoint: ApiEndpoints.wishlist,
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = WishlistResponse.fromJson(res.data);
        saveWishlistToLocal(data.data?.data ?? []);
        return Right(data);
      } else {
        return Left(
          ServerFailure(
            'Failed to get wishlist with status: ${res.statusCode}',
          ),
        );
      }
    } on ServerException catch (e) {
      developer.log('Server error in getWishlist: ${e.message}');
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      developer.log('Network error in getWishlist: ${e.message}');
      return Left(NetworkFailure(e.message));
    } on AuthException catch (e) {
      developer.log('Auth error in getWishlist: ${e.message}');
      return Left(AuthFailure(e.message));
    } catch (e) {
      developer.log('Unexpected error in getWishlist: $e');
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }

  static Future<Either<Failure, WishlistResponse>> addToWishlist({
    required int productId,
  }) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.addToWishlist,
        data: {"product_id": productId},
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = WishlistResponse.fromJson(res.data);
        saveWishlistToLocal(data.data?.data ?? []);
        return Right(data);
      } else {
        return Left(
          ServerFailure(
            'Failed to add to wishlist with status: ${res.statusCode}',
          ),
        );
      }
    } on ServerException catch (e) {
      developer.log('Server error in addToWishlist: ${e.message}');
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      developer.log('Network error in addToWishlist: ${e.message}');
      return Left(NetworkFailure(e.message));
    } on AuthException catch (e) {
      developer.log('Auth error in addToWishlist: ${e.message}');
      return Left(AuthFailure(e.message));
    } catch (e) {
      developer.log('Unexpected error in addToWishlist: $e');
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }

  static Future<Either<Failure, WishlistResponse>> removeToWishlist({
    required int productId,
  }) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.removeFromWishlist,
        data: {"product_id": productId},
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = WishlistResponse.fromJson(res.data);
        saveWishlistToLocal(data.data?.data ?? []);
        return Right(data);
      } else {
        return Left(
          ServerFailure(
            'Failed to remove from wishlist with status: ${res.statusCode}',
          ),
        );
      }
    } on ServerException catch (e) {
      developer.log('Server error in removeToWishlist: ${e.message}');
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      developer.log('Network error in removeToWishlist: ${e.message}');
      return Left(NetworkFailure(e.message));
    } on AuthException catch (e) {
      developer.log('Auth error in removeToWishlist: ${e.message}');
      return Left(AuthFailure(e.message));
    } catch (e) {
      developer.log('Unexpected error in removeToWishlist: $e');
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }

  static void saveWishlistToLocal(List<WishlistProduct> wishlistIds) {
    if (wishlistIds.isEmpty) {
      SharedPref.saveWishlist([]);
    } else {
      List<int> bookIds = [];

      for (var id in wishlistIds) {
        bookIds.add(id.id ?? 0);
      }
      SharedPref.saveWishlist(bookIds);
    }
  }
}
