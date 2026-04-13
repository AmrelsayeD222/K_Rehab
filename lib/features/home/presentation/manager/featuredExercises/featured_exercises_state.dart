part of 'featured_exercises_cubit.dart';

sealed class FeaturedExercisesState extends Equatable {
  const FeaturedExercisesState();

  @override
  List<Object> get props => [];
}

final class FeaturedExercisesInitial extends FeaturedExercisesState {}

final class FeaturedExercisesLoading extends FeaturedExercisesState {}

final class FeaturedExercisesSuccess extends FeaturedExercisesState {
  final List<FeaturedExercisesModel> featuredExercises;
  const FeaturedExercisesSuccess({required this.featuredExercises});
}

final class FeaturedExercisesFailure extends FeaturedExercisesState {
  final String error;
  const FeaturedExercisesFailure({required this.error});
}
