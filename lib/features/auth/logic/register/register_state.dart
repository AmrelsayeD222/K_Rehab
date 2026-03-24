part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final UserModel userModel;
  const RegisterSuccess({required this.userModel});
  @override
  List<Object> get props => [userModel];
}

final class RegisterFailure extends RegisterState {
  final String errorMessage;
  const RegisterFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
