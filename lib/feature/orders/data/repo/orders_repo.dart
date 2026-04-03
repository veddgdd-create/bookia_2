import 'dart:developer' as developer;
import 'package:dartz/dartz.dart';
import 'package:bookia/core/errors/exceptions.dart';
import 'package:bookia/core/errors/failures.dart';
import 'package:bookia/core/services/dio/api_endpoints.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';

class OrdersRepo {
  static Future<Either<Failure, List<Order>>> getOrders() async {
    try {
      var user = SharedPref.getUserData();
      var token = user?.token ?? '';
      var headers = {'Authorization': 'Bearer $token'};
      var res = await DioProvider.get(
        endpoint: ApiEndpoints.orders,
        headers: headers,
      );
      var body = res.data as List;
      var orders = body.map((e) => Order.fromjson(e)).toList();
      return Right(orders);
    } on ServerException catch (e) {
      developer.log('Server error in getOrders: ${e.message}');
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      developer.log('Network error in getOrders: ${e.message}');
      return Left(NetworkFailure(e.message));
    } on AuthException catch (e) {
      developer.log('Auth error in getOrders: ${e.message}');
      return Left(AuthFailure(e.message));
    } catch (e) {
      developer.log('Unexpected error in getOrders: $e');
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }
}
