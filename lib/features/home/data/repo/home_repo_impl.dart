import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/core/error/network_failure.dart';
import 'package:k_rehab/core/error/supabase_auth_failure.dart';
import 'package:k_rehab/core/error/supabase_database_failure.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';
import 'package:k_rehab/features/home/data/repo/home_repo.dart';
import 'package:k_rehab/features/home/data/data_sources/home_local_data_source.dart';
import 'package:k_rehab/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<ProtocolModel>>> getFeaturedProtocols() async {
    try {
      final protocols = await remoteDataSource.fetchFeaturedProtocols();
      await localDataSource.cacheFeaturedProtocols(protocols);
      return right(protocols);
    } on PostgrestException catch (e) {
      final cached = await localDataSource.getCachedFeaturedProtocols();
      if (cached.isNotEmpty) return right(cached);
      return left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } on AuthException catch (e) {
      return left(SupabaseAuthFailure.fromAuthException(e));
    } on SocketException catch (e) {
      final cached = await localDataSource.getCachedFeaturedProtocols();
      if (cached.isNotEmpty) return right(cached);
      return left(NetworkFailure.fromSocketException(e));
    } catch (e) {
      return left(SupabaseDatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ExerciseModel>>> getFeaturedExercises() async {
    try {
      final exercises = await remoteDataSource.fetchFeaturedExercises();
      await localDataSource.cacheFeaturedExercises(exercises);
      return right(exercises);
    } on PostgrestException catch (e) {
      final cached = await localDataSource.getCachedFeaturedExercises();
      if (cached.isNotEmpty) return right(cached);
      return left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } on AuthException catch (e) {
      return left(SupabaseAuthFailure.fromAuthException(e));
    } on SocketException catch (e) {
      final cached = await localDataSource.getCachedFeaturedExercises();
      if (cached.isNotEmpty) return right(cached);
      return left(NetworkFailure.fromSocketException(e));
    } catch (e) {
      return left(SupabaseDatabaseFailure(e.toString()));
    }
  }
}
