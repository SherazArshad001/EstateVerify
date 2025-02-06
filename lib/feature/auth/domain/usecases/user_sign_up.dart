import 'package:fpdart/fpdart.dart';
import 'package:real_estate_app/core/error/failure.dart';
import 'package:real_estate_app/feature/auth/domain/entity/user_entity.dart';
import 'package:real_estate_app/feature/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository authRepository;

  SignUpUseCase({required this.authRepository});

  Future<Either<Failure, UserEntity>> execute({
    required String name,
    required String email,
    required String password,
  }) {
    return authRepository.signUpWithEmailPassword(
      name: name,
      email: email,
      password: password,
    );
  }
}

class LogInUseCase {
  final AuthRepository authRepository;

  LogInUseCase({required this.authRepository});

  Future<Either<Failure, UserEntity>> execute({
    required String email,
    required String password,
  }) {
    return authRepository.logInWithEmailPassword(
      email: email,
      password: password,
    );
  }
}
