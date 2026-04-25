import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/features/profile/data/repo/profile_repo.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  Future<void> getUserData() async {
    emit(ProfileLoading());
    final result = await profileRepo.getUserData();
    
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
    
    result.fold(
      (failure) => emit(ProfileFailure(error: failure.errorMessage)),
      (_) => getUserData(),
    );
  }

  Future<void> logout() async {
    emit(ProfileLogoutLoading());
    final result = await profileRepo.logout();
    
    result.fold(
      (failure) => emit(ProfileFailure(error: failure.errorMessage)),
      (_) => emit(ProfileLogoutSuccess()),
    );
  }
}
