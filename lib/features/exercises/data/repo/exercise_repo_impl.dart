import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/core/error/network_failure.dart';
import 'package:k_rehab/core/error/supabase_auth_failure.dart';
import 'package:k_rehab/core/error/supabase_database_failure.dart';
import 'package:k_rehab/features/exercises/data/data_sources/exercise_local_data_source.dart';
import 'package:k_rehab/features/exercises/data/data_sources/exercise_remote_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/exercise_model.dart';
import 'exercise_repo.dart';

class ExerciseRepoImpl implements ExerciseRepo {
  final ExerciseRemoteDataSource remoteDataSource;
  final ExerciseLocalDataSource localDataSource;

  ExerciseRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<ExerciseModel>>> fetchExercises() async {
    try {
      final exercises = await remoteDataSource.fetchExercises();
      await localDataSource.cacheExercises(exercises);
      return right(exercises);
    } on PostgrestException catch (e) {
      final cached = await localDataSource.getCachedExercises();
      if (cached.isNotEmpty) return right(cached);
      return left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } on AuthException catch (e) {
      return left(SupabaseAuthFailure.fromAuthException(e));
    } on SocketException catch (e) {
      final cached = await localDataSource.getCachedExercises();
      if (cached.isNotEmpty) return right(cached);
      return left(NetworkFailure.fromSocketException(e));
    } catch (e) {
      return left(SupabaseDatabaseFailure(e.toString()));
    }
  }
}
