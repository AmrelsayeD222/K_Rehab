import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';

abstract class WithParamUseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}
