part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLogoutLoading extends ProfileState {}

class ProfileLogoutSuccess extends ProfileState {}

class ProfileLogoutFailure extends ProfileState {
  final String errorMessage;

  const ProfileLogoutFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
