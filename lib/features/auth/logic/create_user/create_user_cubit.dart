import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/features/auth/data/models/user_model.dart';
import 'package:k_rehab/features/auth/data/repositories/auth_repo.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  final AuthRepo authRepo;
  CreateUserCubit({required this.authRepo}) : super(CreateUserInitial());

  Future<void> createUser(UserModel userModel) async {
    final result = await authRepo.createProfile(userModel);
    result.fold(
      (failure) => emit(CreateUserFailure(errorMessage: failure.errorMessage)),
      (_) => emit(CreateUserSuccess()),
    );
  }
}
