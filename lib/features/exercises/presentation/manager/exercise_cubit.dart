import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/exercise_model.dart';
import '../../data/repo/exercise_repo.dart';

part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  final ExerciseRepo exerciseRepo;
  ExerciseCubit(this.exerciseRepo) : super(ExerciseInitial());

  List<ExerciseModel> _allExercises = [];

  Future<void> getExercises() async {
    emit(ExerciseLoading());
    final result = await exerciseRepo.fetchExercises();
    if (isClosed) return;
    result.fold(
      (failure) => emit(ExerciseFailure(error: failure.errorMessage)),
      (exercises) {
        _allExercises = exercises;
        emit(ExerciseSuccess(exercises: exercises, filterIndex: 0));
      },
    );
  }

  void changeFilter(int index) {
    if (state is ExerciseSuccess) {
      emit(ExerciseSuccess(exercises: _allExercises, filterIndex: index));
    }
  }
}
