part of 'exercise_cubit.dart';

abstract class ExerciseState extends Equatable {
  const ExerciseState();

  @override
  List<Object> get props => [];
}

class ExerciseInitial extends ExerciseState {}

class ExerciseLoading extends ExerciseState {}

class ExerciseSuccess extends ExerciseState {
  final List<ExerciseModel> exercises;
  final int filterIndex;
  const ExerciseSuccess({required this.exercises, this.filterIndex = 0});

  @override
  List<Object> get props => [exercises, filterIndex];
}

class ExerciseFailure extends ExerciseState {
  final String error;
  const ExerciseFailure({required this.error});

  @override
  List<Object> get props => [error];
}
