import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/core/error/network_failure.dart';
import 'package:k_rehab/core/error/supabase_auth_failure.dart';
import 'package:k_rehab/core/error/supabase_database_failure.dart';
import 'package:k_rehab/features/auth/data/models/sign_up_params.dart';
import 'package:k_rehab/features/auth/data/models/user_model.dart';
import 'package:k_rehab/features/auth/data/repositories/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl extends AuthRepo {
  final SupabaseClient client;
  AuthRepoImpl({required this.client});
  @override
  Future<Either<Failure, UserModel>> signUp(AuthParams params) async {
    try {
      final response = await client.auth.signUp(
        email: params.email,
        password: params.password,
        data: {'name': params.name},
      );
      final user = response.user;
      if (user != null) {
        final userModel = UserModel(
          id: user.id,
          email: user.email ?? params.email,
          name: user.userMetadata?['name'] ?? params.name,
          createdAt: DateTime.parse(user.createdAt),
        );
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
  Future<Either<Failure, void>> createProfile(UserModel userModel) async {
    try {
      await client.from('profiles').insert(userModel.toJson());
      return const Right(null);
    } on PostgrestException catch (e) {
      return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } on SocketException catch (e) {
      return Left(NetworkFailure.fromSocketException(e));
    } catch (e) {
      return Left(SupabaseDatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> login(AuthParams params) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: params.email,
        password: params.password,
      );
      final session = response.session;
      if (session != null) {
        return Right(session.accessToken);
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
}
