import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';

abstract class FeaturedExercisesRepo {
  Future<Either<Failure, List<ExerciseModel>>> getFeaturedExercises();
}
