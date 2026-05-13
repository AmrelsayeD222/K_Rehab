import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/core/error/network_failure.dart';
import 'package:k_rehab/core/error/supabase_auth_failure.dart';
import 'package:k_rehab/core/error/supabase_database_failure.dart';
import 'package:k_rehab/features/protocols/data/data_sources/protocol_local_data_source.dart';
import 'package:k_rehab/features/protocols/data/data_sources/protocol_remote_data_source.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_details_model.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';
import 'package:k_rehab/features/protocols/data/repo/protocol_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProtocolRepoImpl implements ProtocolRepo {
  final ProtocolRemoteDataSource remoteDataSource;
  final ProtocolLocalDataSource localDataSource;

  ProtocolRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<ProtocolModel>>> fetchProtocols() async {
    try {
      final protocols = await remoteDataSource.fetchProtocols();
      await localDataSource.cacheProtocols(protocols);
      return right(protocols);
    } on PostgrestException catch (e) {
      final cached = await localDataSource.getCachedProtocols();
      if (cached.isNotEmpty) return right(cached);
      return left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } on AuthException catch (e) {
      return left(SupabaseAuthFailure.fromAuthException(e));
    } on SocketException catch (e) {
      final cached = await localDataSource.getCachedProtocols();
      if (cached.isNotEmpty) return right(cached);
      return left(NetworkFailure.fromSocketException(e));
    } catch (e) {
      return left(SupabaseDatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProtocolDetailsModel>> fetchProtocolDetails(
    String protocolId,
  ) async {
    try {
      final details = await remoteDataSource.fetchProtocolDetails(protocolId);
      await localDataSource.cacheProtocolDetails(protocolId, details);
      return right(details);
    } on PostgrestException catch (e) {
      final cached = await localDataSource.getCachedProtocolDetails(protocolId);
      if (cached != null) return right(cached);
      return left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } on AuthException catch (e) {
      return left(SupabaseAuthFailure.fromAuthException(e));
    } on SocketException catch (e) {
      final cached = await localDataSource.getCachedProtocolDetails(protocolId);
      if (cached != null) return right(cached);
      return left(NetworkFailure.fromSocketException(e));
    } catch (e) {
      return left(SupabaseDatabaseFailure(e.toString()));
    }
  }
}
