import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import '../models/exercise_model.dart';

abstract class ExerciseRepo {
  Future<Either<Failure, List<ExerciseModel>>> fetchExercises();
}
