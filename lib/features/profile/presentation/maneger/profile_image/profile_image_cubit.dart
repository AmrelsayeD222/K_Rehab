import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/features/profile/data/repo/profile_repo.dart';

part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  final ProfileRepo profileRepo;
  ProfileImageCubit({required this.profileRepo}) : super(ProfileImageInitial());

  Future<void> uploadProfileImage(File image) async {
    emit(ProfileImageLoading());
    final result = await profileRepo.uploadProfileImage(image);
    result.fold(
      (failure) => emit(ProfileImageError(errorMessage: failure.errorMessage)),
      (success) => emit(ProfileImageLoaded(localImage: image)),
    );
  }

  Future<void> getProfileImage() async {
    emit(ProfileImageLoading());
    final result = await profileRepo.getProfileImage();
    result.fold(
      (failure) => emit(ProfileImageError(errorMessage: failure.errorMessage)),
      (success) => emit(ProfileImageLoaded(imageUrl: success)),
    );
  }
}
