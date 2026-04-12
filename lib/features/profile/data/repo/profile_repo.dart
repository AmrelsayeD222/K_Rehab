import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> uploadProfileImage(File image);
  Future<Either<Failure, String>> getProfileImage();
  Future<Either<Failure, String>> getUserName();
}
