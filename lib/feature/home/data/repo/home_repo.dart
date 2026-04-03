import 'dart:developer' as developer;

import 'package:dartz/dartz.dart';
import 'package:bookia/core/errors/exceptions.dart';
import 'package:bookia/core/errors/failures.dart';
import 'package:bookia/core/services/dio/api_endpoints.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/feature/home/data/models/best_seller_response/best_seller_response.dart';
import 'package:bookia/feature/home/data/models/slider_response/slider_response.dart';

class HomeRepo {
  static Future<Either<Failure, BestSellerResponse>> getBestSeller() async {
    try {
      var res = await DioProvider.get(
        endpoint: ApiEndpoints.productsBestSeller,
      );

      if (res.statusCode == 200) {
        return Right(BestSellerResponse.fromJson(res.data));
      } else {
        return Left(
          ServerFailure(
            'Failed to get best sellers with status: ${res.statusCode}',
          ),
        );
      }
    } on ServerException catch (e) {
      developer.log('Server error in getBestSeller: ${e.message}');
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      developer.log('Network error in getBestSeller: ${e.message}');
      return Left(NetworkFailure(e.message));
    } catch (e) {
      developer.log('Unexpected error in getBestSeller: $e');
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }

  static Future<Either<Failure, SliderResponse>> getSliders() async {
    try {
      var res = await DioProvider.get(endpoint: ApiEndpoints.sliders);

      if (res.statusCode == 200) {
        return Right(SliderResponse.fromJson(res.data));
      } else {
        return Left(
          ServerFailure('Failed to get sliders with status: ${res.statusCode}'),
        );
      }
    } on ServerException catch (e) {
      developer.log('Server error in getSliders: ${e.message}');
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      developer.log('Network error in getSliders: ${e.message}');
      return Left(NetworkFailure(e.message));
    } catch (e) {
      developer.log('Unexpected error in getSliders: $e');
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }
}
