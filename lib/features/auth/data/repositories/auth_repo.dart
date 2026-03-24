import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> signUp(
    String email,
    String password,
    String name,
  );
  Future<Either<Failure, void>> createProfile(UserModel userModel);
}
