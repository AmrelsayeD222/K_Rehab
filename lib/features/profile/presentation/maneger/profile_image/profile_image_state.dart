part of 'profile_image_cubit.dart';

sealed class ProfileImageState extends Equatable {
  const ProfileImageState();

  @override
  List<Object> get props => [];
}

final class ProfileImageInitial extends ProfileImageState {}

final class ProfileImageLoading extends ProfileImageState {}

final class ProfileImageLoaded extends ProfileImageState {
  final File? localImage;
  final String? imageUrl;

  const ProfileImageLoaded({this.localImage, this.imageUrl});

  @override
  List<Object> get props => [localImage ?? '', imageUrl ?? ''];
}

final class ProfileImageError extends ProfileImageState {
  final String errorMessage;

  const ProfileImageError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
