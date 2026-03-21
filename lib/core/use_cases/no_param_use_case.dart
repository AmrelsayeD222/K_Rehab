import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';

abstract class NoParamUseCase<T> {
  Future<Either<Failure, T>> call();
}
