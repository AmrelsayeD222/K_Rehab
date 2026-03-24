import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/core/services/secure_storage_service.dart';
import 'package:k_rehab/features/auth/data/repositories/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  final SecureStorageService secureStorageService;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginCubit({required this.authRepo, required this.secureStorageService})
    : super(LoginInitial());

  Future<void> login() async {
    emit(LoginLoading());
    final result = await authRepo.login(
      emailController.text,
      passwordController.text,
    );
    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.errorMessage)),
      (token) async {
        await secureStorageService.saveToken(token);
        emit(LoginSuccess(token: token));
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
