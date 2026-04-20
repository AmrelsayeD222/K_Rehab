import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/core/error/network_failure.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';
import 'package:k_rehab/features/home/data/repo/featured_protocol_repo.dart';
import 'package:k_rehab/core/error/supabase_database_failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FeaturedProtocolRepoImpl implements FeaturedProtocolRepo {
  final SupabaseClient supabaseClient;

  FeaturedProtocolRepoImpl({required this.supabaseClient});
  @override
  Future<Either<Failure, List<ProtocolModel>>>
  getFeaturedProtocols() async {
    try {
      final response = await supabaseClient
          .from('protocols')
          .select()
          .eq('is_featured', true);

      final List<ProtocolModel> protocols = (response as List)
          .map((e) => ProtocolModel.fromJson(e))
          .toList();

      return Right(protocols);
    } on PostgrestException catch (e) {
      return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } on SocketException catch (e) {
      return Left(NetworkFailure.fromSocketException(e));
    } catch (e) {
      return Left(SupabaseDatabaseFailure(e.toString()));
    }
  }
}
