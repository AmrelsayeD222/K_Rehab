import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';

import 'package:k_rehab/features/home/data/models/featured_exercises_model.dart';

abstract class FeaturedExercisesRepo {
  Future<Either<Failure, List<FeaturedExercisesModel>>> getFeaturedExercises();
}
