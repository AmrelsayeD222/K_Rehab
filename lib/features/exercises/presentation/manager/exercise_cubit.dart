import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/exercise_model.dart';
import '../../data/repo/exercise_repo.dart';

part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  final ExerciseRepo exerciseRepo;
  ExerciseCubit(this.exerciseRepo) : super(ExerciseInitial());

  static const List<String> filters = [
    'All',
    'Knee',
    'Back',
    'Shoulder',
    'Hip',
    'Ankle',
  ];

  List<ExerciseModel> _allExercises = [];

  Future<void> getExercises() async {
    if (isClosed) return;
    emit(ExerciseLoading());
    final result = await exerciseRepo.fetchExercises();
    if (isClosed) return;
    result.fold(
      (failure) => emit(ExerciseFailure(error: failure.errorMessage)),
      (exercises) {
        _allExercises = exercises;
        emit(ExerciseSuccess(
          exercises: exercises,
          filteredExercises: exercises,
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
        filterIndex: index,
      ));
    }
  }

  List<ExerciseModel> _applyFilter(List<ExerciseModel> exercises, int index) {
    if (index == 0) return exercises;
    final filter = filters[index];
    return exercises.where((e) => e.tag.contains(filter)).toList();
  }
}
