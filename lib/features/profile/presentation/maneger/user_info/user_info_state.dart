import 'package:equatable/equatable.dart';

sealed class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

final class UserInfoInitial extends UserInfoState {}

final class UserInfoLoading extends UserInfoState {}

final class UserInfoLoaded extends UserInfoState {
  final String userName;

  const UserInfoLoaded({required this.userName});

  @override
  List<Object> get props => [userName];
}

final class UserInfoError extends UserInfoState {
  final String errorMessage;

  const UserInfoError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
