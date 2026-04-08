import 'package:dartz/dartz.dart';
import 'package:bookia/core/error/failures.dart';
import '../entities/auth_response_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponseEntity>> login(
    String email,
    String password,
  );
  Future<Either<Failure, AuthResponseEntity>> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  );
}
