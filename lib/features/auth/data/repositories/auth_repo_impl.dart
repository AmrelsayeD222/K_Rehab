import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/core/error/network_failure.dart';
import 'package:k_rehab/core/error/supabase_auth_failure.dart';
import 'package:k_rehab/core/error/supabase_database_failure.dart';
import 'package:k_rehab/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:k_rehab/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:k_rehab/features/auth/data/models/auth_params.dart';
import 'package:k_rehab/features/auth/data/models/user_model.dart';
import 'package:k_rehab/features/auth/data/repositories/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, UserModel>> signUp(AuthParams params) async {
    try {
      final response = await remoteDataSource.signUp(params);
      final user = response.user;
      if (user != null) {
        final userModel = UserModel(
          id: user.id,
          email: user.email ?? params.email,
          name: user.userMetadata?['name'] ?? params.name,
          createdAt: DateTime.parse(user.createdAt),
        );

        await localDataSource.cacheUser(userModel);

        return Right(userModel);
      }
      return Left(
        SupabaseAuthFailure('User registration failed: No user returned'),
      );
    } on AuthException catch (e) {
      return Left(SupabaseAuthFailure.fromAuthException(e));
    } on SocketException catch (e) {
      return Left(NetworkFailure.fromSocketException(e));
    } catch (e) {
      return Left(SupabaseDatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> login(AuthParams params) async {
    try {
      final response = await remoteDataSource.signInWithPassword(params);
      final session = response.session;
      if (session != null) {
        final userModel = UserModel(
          id: session.user.id,
          email: session.user.email ?? '',
          name: session.user.userMetadata?['name'] ?? '',
          createdAt: DateTime.parse(session.user.createdAt),
        );
        await localDataSource.cacheUser(userModel);
        return const Right(null);
      }
      return Left(
        SupabaseAuthFailure('User login failed: No session returned'),
      );
    } on AuthException catch (e) {
      return Left(SupabaseAuthFailure.fromAuthException(e));
    } on SocketException catch (e) {
      return Left(NetworkFailure.fromSocketException(e));
    } catch (e) {
      return Left(SupabaseAuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithGoogle() async {
    try {
      await remoteDataSource.signInWithOAuth(OAuthProvider.google);
      return const Right(null);
    } on AuthException catch (e) {
      return Left(SupabaseAuthFailure.fromAuthException(e));
    } catch (e) {
      return Left(SupabaseAuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.signOut();
      await localDataSource.clearUser();
      return const Right(null);
    } on AuthException catch (e) {
      return Left(SupabaseAuthFailure.fromAuthException(e));
    } catch (e) {
      return Left(SupabaseAuthFailure(e.toString()));
    }
  }

  @override
  bool get isLoggedIn => remoteDataSource.currentSession != null;

  @override
  Stream<AuthState> get authStateStream => remoteDataSource.onAuthStateChange;
}
