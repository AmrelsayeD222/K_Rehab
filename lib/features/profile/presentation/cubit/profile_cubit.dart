import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/core/services/secure_storage_service.dart';
import 'package:k_rehab/features/profile/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  final SecureStorageService secureStorageService;

  ProfileCubit({required this.profileRepo, required this.secureStorageService})
    : super(ProfileInitial());

  Future<void> logout() async {
    emit(ProfileLogoutLoading());
    final result = await profileRepo.logout();

    result.fold(
      (failure) =>
          emit(ProfileLogoutFailure(errorMessage: failure.errorMessage)),
      (success) async {
        await secureStorageService.deleteToken();
        emit(ProfileLogoutSuccess());
      },
    );
  }
}
