import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/features/auth/data/models/auth_params.dart';
import 'package:k_rehab/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> signUp(AuthParams params);
  Future<Either<Failure, void>> login(AuthParams params);
  Future<Either<Failure, void>> signInWithGoogle();
  Future<Either<Failure, void>> logout();
  bool get isLoggedIn;
  Stream<AuthState> get authStateStream;
}
