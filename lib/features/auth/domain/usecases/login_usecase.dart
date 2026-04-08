import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:bookia/core/error/failures.dart';
import 'package:bookia/core/usecases/usecase.dart';
import '../entities/auth_response_entity.dart';
import '../repositories/auth_repository.dart';

@injectable
class LoginUseCase implements UseCase<AuthResponseEntity, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, AuthResponseEntity>> call(LoginParams params) async {
    return await repository.login(params.email, params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
