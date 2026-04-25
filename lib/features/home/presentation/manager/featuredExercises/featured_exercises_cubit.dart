import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';
import 'package:k_rehab/features/home/data/repo/home_repo.dart';

part 'featured_exercises_state.dart';

class FeaturedExercisesCubit extends Cubit<FeaturedExercisesState> {
  final HomeRepo homeRepo;
  FeaturedExercisesCubit(this.homeRepo) : super(FeaturedExercisesInitial());

  Future<void> getFeaturedExercises() async {
    emit(FeaturedExercisesLoading());
    final result = await homeRepo.getFeaturedExercises();
    result.fold(
      (failure) => emit(FeaturedExercisesFailure(failure.errorMessage)),
      (exercises) => emit(FeaturedExercisesSuccess(exercises)),
    );
  }
}
