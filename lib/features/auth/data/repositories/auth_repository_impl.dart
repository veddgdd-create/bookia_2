import 'package:bookia/core/errors/exceptions.dart';
import 'package:bookia/core/error/failures.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../datasources/remote/auth_remote_data_source.dart';
import '../../domain/entities/auth_response_entity.dart';
import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, AuthResponseEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final remoteUser = await remoteDataSource.login(email, password);
      SharedPref.saveUserData(
        remoteUser.data.toJson() as UserModel?,
      ); // Keep local cache
      return Right(remoteUser.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      final remoteUser = await remoteDataSource.register(
        name,
        email,
        password,
        confirmPassword,
      );
      SharedPref.saveUserData(remoteUser.data.toJson() as UserModel?);
      return Right(remoteUser.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
