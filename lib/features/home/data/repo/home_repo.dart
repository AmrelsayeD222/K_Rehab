import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProtocolModel>>> getFeaturedProtocols();
  Future<Either<Failure, List<ExerciseModel>>> getFeaturedExercises();
}
