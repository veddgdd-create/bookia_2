import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/usecases/no_params.dart';
import '../entities/best_seller_entity.dart';
import '../repositories/home_repository.dart';

class GetBestSellersUseCase
    implements UseCase<List<BestSellerEntity>, NoParams> {
  final HomeRepository repository;

  GetBestSellersUseCase(this.repository);

  @override
  Future<Either<Failure, List<BestSellerEntity>>> call(NoParams params) async {
    return await repository.getBestSellers();
  }
}
