import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/core/error/supabase_auth_failure.dart';
import 'package:k_rehab/core/error/supabase_database_failure.dart';
import 'package:k_rehab/features/auth/data/models/user_model.dart';
import 'package:k_rehab/features/auth/data/repositories/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl extends AuthRepo {
  final SupabaseClient client;
  AuthRepoImpl({required this.client});
  @override
  Future<Either<Failure, UserModel>> signUp(
    String email,
    String password,
    String name,
  ) async {
    try {
      final response = await client.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );
      final user = response.user;
      if (user != null) {
        final userModel = UserModel(
          id: user.id,
          email: user.email ?? email,
          name: user.userMetadata?['name'] ?? name,
          createdAt: DateTime.parse(user.createdAt),
        );
        return Right(userModel);
      }
      return Left(
        SupabaseAuthFailure('User registration failed: No user returned'),
      );
    } on AuthApiException catch (e) {
      return Left(SupabaseAuthFailure.fromAuthException(e));
    } catch (e) {
      return Left(SupabaseAuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> createProfile(UserModel userModel) async {
    try {
      await client.from('profiles').insert(userModel.toJson());
      return const Right(null);
    } catch (e) {
      return Left(SupabaseDatabaseFailure(e.toString()));
    }
  }
}
