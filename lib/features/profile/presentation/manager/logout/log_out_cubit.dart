import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/features/profile/data/repo/profile_repo.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  final ProfileRepo profileRepo;

  LogOutCubit({required this.profileRepo})
    : super(LogOutInitial());

  Future<void> logout() async {
    emit(LogOutLoading());
    final result = await profileRepo.logout();
    if (isClosed) return;

    result.fold(
      (failure) => emit(LogOutFailure(errorMessage: failure.errorMessage)),
      (success) {
        if (isClosed) return;
        emit(LogOutSuccess());
      },
    );
  }
}
