import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/core/error/network_failure.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';
import 'package:k_rehab/features/home/data/repo/featured_exercises_repo.dart';
import 'package:k_rehab/core/error/supabase_database_failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FeaturedExercisesRepoImpl implements FeaturedExercisesRepo {
  final SupabaseClient supabaseClient;
  FeaturedExercisesRepoImpl({required this.supabaseClient});
  @override
  Future<Either<Failure, List<ExerciseModel>>>
  getFeaturedExercises() async {
    try {
      final response = await supabaseClient.from('exercises').select().eq('is_featured', true);
      final List<ExerciseModel> featuredExercises = response
          .map((e) => ExerciseModel.fromJson(e))
          .toList();
      return right(featuredExercises);
    } on PostgrestException catch (e) {
      return left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } on SocketException catch (e) {
      return left(NetworkFailure.fromSocketException(e));
    } catch (e) {
      return left(SupabaseDatabaseFailure(e.toString()));
    }
  }
}
