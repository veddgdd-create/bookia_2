import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/best_seller_entity.dart';
import '../entities/slider_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<BestSellerEntity>>> getBestSellers();
  Future<Either<Failure, List<SliderEntity>>> getSliders();
}
