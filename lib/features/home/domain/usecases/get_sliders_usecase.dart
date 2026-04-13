import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/usecases/no_params.dart';
import '../entities/slider_entity.dart';
import '../repositories/home_repository.dart';

class GetSlidersUseCase implements UseCase<List<SliderEntity>, NoParams> {
  final HomeRepository repository;

  GetSlidersUseCase(this.repository);

  @override
  Future<Either<Failure, List<SliderEntity>>> call(NoParams params) async {
    return await repository.getSliders();
  }
}
