import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_details_model.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';

abstract class ProtocolRepo {
  Future<Either<Failure, List<ProtocolModel>>> fetchProtocols();
  Future<Either<Failure, ProtocolDetailsModel>> fetchProtocolDetails(String protocolId);
}
