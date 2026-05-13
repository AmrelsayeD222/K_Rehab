import 'package:hive_flutter/hive_flutter.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_details_model.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';
import 'package:k_rehab/features/auth/data/models/user_model.dart';

class HiveManager {
  // Box Names
  static const String protocolsBox = 'protocols_box';
  static const String exercisesBox = 'exercises_box';
  static const String userBox = 'user_box';

  static Future<void> init() async {
    await Hive.initFlutter();
    
    // Register Adapters
    Hive.registerAdapter(ProtocolDetailsModelAdapter());
    Hive.registerAdapter(ProtocolPhaseModelAdapter());
    Hive.registerAdapter(ProtocolInterventionModelAdapter());
    Hive.registerAdapter(ExerciseModelAdapter());
    Hive.registerAdapter(ExerciseStepModelAdapter());
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(ProtocolModelAdapter());

    await openBoxes();
  }

  static Future<void> openBoxes() async {
    await Hive.openBox(protocolsBox);
    await Hive.openBox<ExerciseModel>(exercisesBox);
    await Hive.openBox<UserModel>(userBox);
  }

  static Future<void> clearAll() async {
    await Hive.box(protocolsBox).clear();
    await Hive.box(exercisesBox).clear();
    await Hive.box(userBox).clear();
  }
}
