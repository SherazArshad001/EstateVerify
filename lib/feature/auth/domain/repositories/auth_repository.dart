import 'package:fpdart/fpdart.dart';
import 'package:real_estate_app/core/error/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> logInWithEmailPassword({
    required String email,
    required String password,
  });
}
