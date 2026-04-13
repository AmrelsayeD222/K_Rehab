import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/features/home/data/models/featured_protocol_model.dart';

abstract class FeaturedProtocolRepo {
  Future<Either<Failure, List<FeaturedProtocolModel>>> getFeaturedProtocols();
}
