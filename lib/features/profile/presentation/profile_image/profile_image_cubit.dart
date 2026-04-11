import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  ProfileImageCubit() : super(ProfileImageInitial());
}
