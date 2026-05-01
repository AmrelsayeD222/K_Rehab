import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/features/auth/data/models/auth_params.dart';
import 'package:k_rehab/features/auth/data/models/user_model.dart';
import 'package:k_rehab/features/auth/data/repositories/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RegisterCubit({required this.authRepo}) : super(RegisterInitial());

  Future<void> signUp() async {
    emit(RegisterLoading());
    final result = await authRepo.signUp(
      AuthParams(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
      ),
    );
    if (isClosed) return;
    result.fold(
      (failure) => emit(RegisterFailure(errorMessage: failure.errorMessage)),
      (userModel) => emit(RegisterSuccess(userModel: userModel)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(RegisterLoading());
    final result = await authRepo.signInWithGoogle();
    if (isClosed) return;
    result.fold(
      (failure) => emit(RegisterFailure(errorMessage: failure.errorMessage)),
      (_) {
        // Keep loading state for 5 seconds to cover the return from browser.
        // If navigation hasn't happened by then (e.g. user canceled), reset to initial.
        Future.delayed(const Duration(seconds: 10), () {
          if (!isClosed) resetLoading();
        });
      },
    );
  }

  void resetLoading() {
    if (state is RegisterLoading) {
      emit(RegisterInitial());
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
