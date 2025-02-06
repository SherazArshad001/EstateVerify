import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_app/feature/auth/domain/entity/user_entity.dart';
import 'package:real_estate_app/feature/auth/domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LogInUseCase logInUseCase;
  final SignUpUseCase signUpUseCase;

  AuthBloc({
    required this.logInUseCase,
    required this.signUpUseCase,
  }) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<SignupEvent>(_onSignup);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await logInUseCase.execute(
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) => emit(AuthFailure(error: failure.massage)),
      (user) => emit(AuthSuccess(user: user)),
    );
  }

  Future<void> _onSignup(SignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await signUpUseCase.execute(
      name: event.name,
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) => emit(AuthFailure(error: failure.massage)),
      (user) => emit(AuthSuccess(user: user)),
    );
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    await Future.delayed(Duration(seconds: 1));
    emit(AuthInitial());
  }
}
