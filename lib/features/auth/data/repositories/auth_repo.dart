import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/features/auth/data/models/auth_params.dart';
import 'package:k_rehab/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> signUp(AuthParams params);
  Future<Either<Failure, void>> login(AuthParams params);
}
