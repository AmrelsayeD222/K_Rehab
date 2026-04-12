import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/features/profile/data/repo/profile_repo.dart';
import 'package:k_rehab/features/profile/presentation/maneger/user_info/user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  final ProfileRepo profileRepo;

  UserInfoCubit({required this.profileRepo}) : super(UserInfoInitial());

  Future<void> getUserInfo() async {
    emit(UserInfoLoading());
    final result = await profileRepo.getUserName();
    result.fold(
      (failure) => emit(UserInfoError(errorMessage: failure.errorMessage)),
      (name) => emit(UserInfoLoaded(userName: name)),
    );
  }
}
