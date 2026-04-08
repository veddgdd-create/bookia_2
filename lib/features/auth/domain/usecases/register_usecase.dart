import 'package:dartz/dartz.dart';
import 'package:bookia/core/error/failures.dart';
import 'package:bookia/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';
import '../entities/auth_response_entity.dart';
import '../repositories/auth_repository.dart';

@injectable
class RegisterUseCase implements UseCase<AuthResponseEntity, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, AuthResponseEntity>> call(
    RegisterParams params,
  ) async {
    return await repository.register(
      params.name,
      params.email,
      params.password,
      params.confirmPassword,
    );
  }
}

class RegisterParams {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}
