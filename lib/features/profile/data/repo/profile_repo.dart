import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/features/auth/data/models/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, void>> uploadProfileImage(File image);
  Future<Either<Failure, UserModel>> getUserData();
  Future<Either<Failure, void>> updateSubscriptionStatus({required bool isActive});
}
