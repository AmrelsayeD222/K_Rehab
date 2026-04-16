import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/core/error/network_failure.dart';
import 'package:k_rehab/core/error/supabase_database_failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/exercise_model.dart';
import 'exercise_repo.dart';

class ExerciseRepoImpl implements ExerciseRepo {
  final SupabaseClient supabaseClient;

  ExerciseRepoImpl({required this.supabaseClient});

  @override
  Future<Either<Failure, List<ExerciseModel>>> fetchExercises() async {
    try {
      final response = await supabaseClient.from('exercises').select();
      final List<ExerciseModel> exercises = response
          .map((e) => ExerciseModel.fromJson(e))
          .toList();
      return right(exercises);
    } on PostgrestException catch (e) {
      return left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } on SocketException catch (e) {
      return left(NetworkFailure.fromSocketException(e));
    } catch (e) {
      return left(SupabaseDatabaseFailure(e.toString()));
    }
  }
}
