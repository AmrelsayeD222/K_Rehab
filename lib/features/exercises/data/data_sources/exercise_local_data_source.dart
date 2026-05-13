import 'package:hive_flutter/hive_flutter.dart';
import 'package:k_rehab/core/storage/hive_manager.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';

abstract class ExerciseLocalDataSource {
  Future<void> cacheExercises(List<ExerciseModel> exercises);
  Future<List<ExerciseModel>> getCachedExercises();
}

class ExerciseLocalDataSourceImpl implements ExerciseLocalDataSource {
  final Box<ExerciseModel> box = Hive.box<ExerciseModel>(HiveManager.exercisesBox);

  @override
  Future<void> cacheExercises(List<ExerciseModel> exercises) async {
    // Clear old data and put new list or use a map
    // For simplicity, we store as a list with a single key
    await box.clear();
    for (var exercise in exercises) {
      await box.put(exercise.id, exercise);
    }
  }

  @override
  Future<List<ExerciseModel>> getCachedExercises() async {
    return box.values.toList();
  }
}
