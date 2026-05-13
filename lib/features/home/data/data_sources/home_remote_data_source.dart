import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProtocolModel>> fetchFeaturedProtocols();
  Future<List<ExerciseModel>> fetchFeaturedExercises();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final SupabaseClient supabaseClient;

  HomeRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<List<ProtocolModel>> fetchFeaturedProtocols() async {
    final response =
        await supabaseClient.from('protocols').select().eq('is_featured', true);

    return response.map((e) => ProtocolModel.fromJson(e)).toList();
  }

  @override
  Future<List<ExerciseModel>> fetchFeaturedExercises() async {
    final response =
        await supabaseClient.from('exercises').select().eq('is_featured', true);

    return response.map((e) => ExerciseModel.fromJson(e)).toList();
  }
}
