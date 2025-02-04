import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<SignupEvent>(_onSignup);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      await Future.delayed(Duration(seconds: 2));
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        emit(AuthSuccess());
      } else {
        emit(
          AuthFailure(error: 'Email and password must not be empty'),
        );
      }
    } catch (e) {
      emit(
        AuthFailure(error: 'An unexpected error occurs: $e'),
      );
    }
  }

  Future<void> _onSignup(SignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (event.name.isNotEmpty &&
          event.email.isNotEmpty &&
          event.password.isNotEmpty) {
        emit(AuthSuccess());
      } else {
        emit(
          AuthFailure(error: 'Please fill all fields'),
        );
      }
    } catch (e) {
      emit(
        AuthFailure(error: 'An unexpected error occurs: $e'),
      );
    }
  }
}

Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
  emit(AuthLoading());
  try {
    await Future.delayed(const Duration(seconds: 2));
    return emit(AuthInitial());
  } catch (e) {
    emit(
      AuthFailure(error: 'An unexpected error occurs: $e'),
    );
  }
}
