import 'package:equatable/equatable.dart';

sealed class ProfileImageState extends Equatable {
  const ProfileImageState();

  @override
  List<Object> get props => [];
}

final class ProfileImageInitial extends ProfileImageState {}
