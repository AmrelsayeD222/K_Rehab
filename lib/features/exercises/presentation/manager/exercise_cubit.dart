import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/exercise_model.dart';
import '../../data/repo/exercise_repo.dart';

part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  final ExerciseRepo exerciseRepo;
  ExerciseCubit(this.exerciseRepo) : super(ExerciseInitial());

  List<ExerciseModel> _allExercises = [];
  List<String> _filters = ['All'];

  Future<void> getExercises() async {
    if (isClosed) return;
    emit(ExerciseLoading());
    final result = await exerciseRepo.fetchExercises();
    if (isClosed) return;
    result.fold(
      (failure) => emit(ExerciseFailure(error: failure.errorMessage)),
      (exercises) {
        _allExercises = exercises;
        _filters = ['All', ..._extractUniqueTags(exercises)];
        emit(ExerciseSuccess(
          exercises: exercises,
          filteredExercises: exercises,
          filters: _filters,
          filterIndex: 0,
        ));
      },
    );
  }

  void changeFilter(int index) {
    if (state is ExerciseSuccess) {
      final filtered = _applyFilter(_allExercises, index);
      emit(ExerciseSuccess(
        exercises: _allExercises,
        filteredExercises: filtered,
        filters: _filters,
        filterIndex: index,
      ));
    }
  }

  List<String> _extractUniqueTags(List<ExerciseModel> exercises) {
    final tags = exercises.map((e) => e.tag).where((t) => t.isNotEmpty).toSet().toList();
    tags.sort();
    return tags.cast<String>();
  }

  List<ExerciseModel> _applyFilter(List<ExerciseModel> exercises, int index) {
    if (index == 0) return exercises;
    final filter = _filters[index];
    return exercises.where((e) => e.tag.contains(filter)).toList();
  }
}
