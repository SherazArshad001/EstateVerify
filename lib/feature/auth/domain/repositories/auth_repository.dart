import 'package:fpdart/fpdart.dart';
import 'package:real_estate_app/core/error/failure.dart';
import 'package:real_estate_app/feature/auth/domain/entity/user_entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserEntity>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> logInWithEmailPassword({
    required String email,
    required String password,
  });
}
