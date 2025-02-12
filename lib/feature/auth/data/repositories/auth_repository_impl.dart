import 'package:fpdart/fpdart.dart';
import 'package:real_estate_app/core/error/failure.dart';
import 'package:real_estate_app/core/error/server_failure.dart';
import 'package:real_estate_app/feature/auth/data/datasource/auth_remote_data_source.dart';
import 'package:real_estate_app/feature/auth/domain/entity/user_entity.dart';
import 'package:real_estate_app/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> logInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await authRemoteDataSource.logInWithEmailPassword(
        email: email,
        password: password,
      );
      return Right(UserEntity(
        id: result.id,
        name: result.name,
        email: result.email,
      ));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final result = await authRemoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return Right(UserEntity(
        id: result.id,
        name: result.name,
        email: result.email,
      ));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
