import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/features/auth/data/models/auth_params.dart';
import 'package:k_rehab/features/auth/data/repositories/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginCubit({required this.authRepo}) : super(LoginInitial());

  Future<void> login() async {
    emit(LoginLoading());
    final result = await authRepo.login(
      AuthParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    if (isClosed) return;
    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.errorMessage)),
      (_) => emit(LoginSuccess()),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.signInWithGoogle();
    if (isClosed) return;
    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.errorMessage)),
      (_) {
        // Keep loading state for 10 seconds to cover the return from browser.
        // If navigation hasn't happened by then (e.g. user canceled), reset to initial.
        Future.delayed(const Duration(seconds: 10), () {
          if (!isClosed) resetLoading();
        });
      },
    );
  }

  void resetLoading() {
    if (state is LoginLoading) {
      emit(LoginInitial());
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
