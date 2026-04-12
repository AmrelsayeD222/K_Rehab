import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/core/services/secure_storage_service.dart';
import 'package:k_rehab/features/profile/data/repo/profile_repo.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  final ProfileRepo profileRepo;
  final SecureStorageService secureStorageService;

  LogOutCubit({required this.profileRepo, required this.secureStorageService})
    : super(LogOutInitial());

  Future<void> logout() async {
    emit(LogOutLoading());
    final result = await profileRepo.logout();

    result.fold(
      (failure) => emit(LogOutFailure(errorMessage: failure.errorMessage)),
      (success) async {
        await secureStorageService.deleteToken();
        emit(LogOutSuccess());
      },
    );
  }
}
