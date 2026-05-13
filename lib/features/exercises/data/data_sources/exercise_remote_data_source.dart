import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/exercise_model.dart';

abstract class ExerciseRemoteDataSource {
  Future<List<ExerciseModel>> fetchExercises();
  Future<List<ExerciseModel>> fetchFeaturedExercises();
}

class ExerciseRemoteDataSourceImpl implements ExerciseRemoteDataSource {
  final SupabaseClient supabaseClient;

  ExerciseRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<List<ExerciseModel>> fetchExercises() async {
    final response = await supabaseClient.from('exercises').select();
    return response.map((e) => ExerciseModel.fromJson(e)).toList();
  }

  @override
  Future<List<ExerciseModel>> fetchFeaturedExercises() async {
    final response = await supabaseClient
        .from('exercises')
        .select()
        .eq('is_featured', true);
    return response.map((e) => ExerciseModel.fromJson(e)).toList();
  }
}
