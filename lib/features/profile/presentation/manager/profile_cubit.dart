import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/features/auth/data/repositories/auth_repo.dart';
import 'package:k_rehab/features/profile/data/repo/profile_repo.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  final AuthRepo authRepo;

  ProfileCubit({required this.profileRepo, required this.authRepo})
    : super(ProfileInitial());

  Future<void> getUserData() async {
    emit(ProfileLoading());
    final result = await profileRepo.getUserData();
    if (isClosed) return;
    result.fold(
      (failure) => emit(ProfileFailure(error: failure.errorMessage)),
      (user) => emit(ProfileSuccess(user: user)),
    );
  }

  Future<void> uploadProfileImage(File image) async {
    final currentState = state;
    if (currentState is ProfileSuccess) {
      emit(ProfileImageUploading(user: currentState.user));
    }

    final result = await profileRepo.uploadProfileImage(image);
    if (isClosed) return;
    result.fold(
      (failure) => emit(ProfileFailure(error: failure.errorMessage)),
      (_) => getUserData(),
    );
  }

  Future<void> logout() async {
    emit(ProfileLogoutLoading());
    final result = await authRepo.logout();
    if (isClosed) return;
    result.fold(
      (failure) => emit(ProfileFailure(error: failure.errorMessage)),
      (_) => emit(ProfileLogoutSuccess()),
    );
  }
}
