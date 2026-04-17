import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';
import 'package:k_rehab/features/home/data/repo/featured_exercises_repo.dart';

part 'featured_exercises_state.dart';

class FeaturedExercisesCubit extends Cubit<FeaturedExercisesState> {
  final FeaturedExercisesRepo featuredExercisesRepo;
  FeaturedExercisesCubit(this.featuredExercisesRepo)
    : super(FeaturedExercisesInitial());

  Future<void> getFeaturedExercises() async {
    if (isClosed) return;
    emit(FeaturedExercisesLoading());
    final result = await featuredExercisesRepo.getFeaturedExercises();
    if (isClosed) return;
    result.fold(
      (failure) => emit(FeaturedExercisesFailure(error: failure.errorMessage)),

      (featuredExercises) =>
          emit(FeaturedExercisesSuccess(featuredExercises: featuredExercises)),
    );
  }
}
