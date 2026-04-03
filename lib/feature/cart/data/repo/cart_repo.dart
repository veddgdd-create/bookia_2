import 'dart:developer' as developer;

import 'package:dartz/dartz.dart';
import 'package:bookia/core/errors/exceptions.dart';
import 'package:bookia/core/errors/failures.dart';
import 'package:bookia/core/services/dio/api_endpoints.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/feature/cart/data/models/cart_response/cart_response.dart';
import 'package:bookia/feature/cart/data/models/place_order_params.dart';

class CartRepo {
  static Future<Either<Failure, CartResponse>> getCart() async {
    try {
      var res = await DioProvider.get(
        endpoint: ApiEndpoints.cart,
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = CartResponse.fromJson(res.data);
        return Right(data);
      } else {
        return Left(
          ServerFailure('Failed to get cart with status: ${res.statusCode}'),
        );
      }
    } on ServerException catch (e) {
      developer.log('Server error in getCart: ${e.message}');
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      developer.log('Network error in getCart: ${e.message}');
      return Left(NetworkFailure(e.message));
    } on AuthException catch (e) {
      developer.log('Auth error in getCart: ${e.message}');
      return Left(AuthFailure(e.message));
    } catch (e) {
      developer.log('Unexpected error in getCart: $e');
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }

  static Future<Either<Failure, CartResponse>> addToCart({
    required int productId,
  }) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.addToCart,
        data: {"product_id": productId},
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 201) {
        var data = CartResponse.fromJson(res.data);
        return Right(data);
      } else {
        return Left(
          ServerFailure('Failed to add to cart with status: ${res.statusCode}'),
        );
      }
    } on ServerException catch (e) {
      developer.log('Server error in addToCart: ${e.message}');
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      developer.log('Network error in addToCart: ${e.message}');
      return Left(NetworkFailure(e.message));
    } on AuthException catch (e) {
      developer.log('Auth error in addToCart: ${e.message}');
      return Left(AuthFailure(e.message));
    } catch (e) {
      developer.log('Unexpected error in addToCart: $e');
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }

  static Future<Either<Failure, CartResponse>> removeToCart({
    required int cartItemId,
  }) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.removeFromCart,
        data: {"cart_item_id": cartItemId},
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = CartResponse.fromJson(res.data);
        return Right(data);
      } else {
        return Left(
          ServerFailure(
            'Failed to remove from cart with status: ${res.statusCode}',
          ),
        );
      }
    } on ServerException catch (e) {
      developer.log('Server error in removeToCart: ${e.message}');
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      developer.log('Network error in removeToCart: ${e.message}');
      return Left(NetworkFailure(e.message));
    } on AuthException catch (e) {
      developer.log('Auth error in removeToCart: ${e.message}');
      return Left(AuthFailure(e.message));
    } catch (e) {
      developer.log('Unexpected error in removeToCart: $e');
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }

  static Future<Either<Failure, CartResponse>> updateCart({
    required int cartItemId,
    required int quantity,
  }) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.updateCart,
        data: {"cart_item_id": cartItemId, "quantity": quantity},
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 201) {
        var data = CartResponse.fromJson(res.data);
        return Right(data);
      } else {
        return Left(
          ServerFailure('Failed to update cart with status: ${res.statusCode}'),
        );
      }
    } on ServerException catch (e) {
      developer.log('Server error in updateCart: ${e.message}');
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      developer.log('Network error in updateCart: ${e.message}');
      return Left(NetworkFailure(e.message));
    } on AuthException catch (e) {
      developer.log('Auth error in updateCart: ${e.message}');
      return Left(AuthFailure(e.message));
    } catch (e) {
      developer.log('Unexpected error in updateCart: $e');
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }

  static Future<Either<Failure, bool>> placeOrder(
    PlaceOrderParams params,
  ) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.placeOrder,
        data: params.toJson(),
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          ServerFailure('Failed to place order with status: ${res.statusCode}'),
        );
      }
    } on ServerException catch (e) {
      developer.log('Server error in placeOrder: ${e.message}');
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      developer.log('Network error in placeOrder: ${e.message}');
      return Left(NetworkFailure(e.message));
    } on AuthException catch (e) {
      developer.log('Auth error in placeOrder: ${e.message}');
      return Left(AuthFailure(e.message));
    } catch (e) {
      developer.log('Unexpected error in placeOrder: $e');
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }

  // static saveCartToLocal(List<CartProduct> wishlistIds) {
  //   if (wishlistIds.isEmpty) {
  //     SharedPref.saveCart([]);
  //   } else {
  //     List<int> bookIds = [];

  //     for (var id in wishlistIds) {
  //       bookIds.add(id.id ?? 0);
  //     }
  //     SharedPref.saveCart(bookIds);
  //   }
  // }
}
