import 'package:hive_flutter/hive_flutter.dart';
import 'package:k_rehab/core/storage/hive_manager.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';

abstract class HomeLocalDataSource {
  Future<void> cacheFeaturedProtocols(List<ProtocolModel> protocols);
  Future<List<ProtocolModel>> getCachedFeaturedProtocols();
  Future<void> cacheFeaturedExercises(List<ExerciseModel> exercises);
  Future<List<ExerciseModel>> getCachedFeaturedExercises();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  // We can use a dedicated home box
  final Box box = Hive.box(HiveManager.protocolsBox); // Or create a new one in HiveManager

  @override
  Future<void> cacheFeaturedProtocols(List<ProtocolModel> protocols) async {
    await box.put('featured_protocols', protocols);
  }

  @override
  Future<List<ProtocolModel>> getCachedFeaturedProtocols() async {
    final List<dynamic>? protocols = box.get('featured_protocols');
    if (protocols != null) {
      return protocols.cast<ProtocolModel>();
    }
    return [];
  }

  @override
  Future<void> cacheFeaturedExercises(List<ExerciseModel> exercises) async {
    await box.put('featured_exercises', exercises);
  }

  @override
  Future<List<ExerciseModel>> getCachedFeaturedExercises() async {
    final List<dynamic>? exercises = box.get('featured_exercises');
    if (exercises != null) {
      return exercises.cast<ExerciseModel>();
    }
    return [];
  }
}
