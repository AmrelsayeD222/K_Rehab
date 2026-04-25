import 'package:equatable/equatable.dart';
import 'package:k_rehab/features/auth/data/models/user_model.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final UserModel user;
  const ProfileSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}

class ProfileFailure extends ProfileState {
  final String error;
  const ProfileFailure({required this.error});

  @override
  List<Object?> get props => [error];
}

class ProfileImageUploading extends ProfileState {
  final UserModel user; // To keep showing user data while uploading
  const ProfileImageUploading({required this.user});

  @override
  List<Object?> get props => [user];
}

class ProfileLogoutLoading extends ProfileState {}

class ProfileLogoutSuccess extends ProfileState {}
