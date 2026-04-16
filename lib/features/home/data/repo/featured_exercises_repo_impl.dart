import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/core/error/network_failure.dart';
import 'package:k_rehab/features/home/data/models/featured_exercises_model.dart';
import 'package:k_rehab/features/home/data/repo/featured_exercises_repo.dart';
import 'package:k_rehab/core/error/supabase_database_failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FeaturedExercisesRepoImpl implements FeaturedExercisesRepo {
  final SupabaseClient supabaseClient;
  FeaturedExercisesRepoImpl({required this.supabaseClient});
  @override
  Future<Either<Failure, List<FeaturedExercisesModel>>>
  getFeaturedExercises() async {
    try {
      final response = await supabaseClient.from('featured exercises').select();
      final List<FeaturedExercisesModel> featuredExercises = response
          .map((e) => FeaturedExercisesModel.fromJson(e))
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
