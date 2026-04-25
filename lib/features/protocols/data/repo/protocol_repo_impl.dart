import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/core/error/network_failure.dart';
import 'package:k_rehab/core/error/supabase_database_failure.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_details_model.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';
import 'package:k_rehab/features/protocols/data/repo/protocol_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProtocolRepoImpl implements ProtocolRepo {
  final SupabaseClient supabaseClient;

  ProtocolRepoImpl({required this.supabaseClient});

  @override
  Future<Either<Failure, List<ProtocolModel>>> fetchProtocols() async {
    try {
      // جلب البيانات الأساسية فقط لتقليل الحجم
      final response = await supabaseClient
          .from('protocols')
          .select(
            'id, title, subtitle, isClinicallyReviewed, image_path, duration, sessions, isFree, is_featured',
          );
      final List<ProtocolModel> protocols = response
          .map((e) => ProtocolModel.fromJson(e))
          .toList();
      return right(protocols);
    } on PostgrestException catch (e) {
      return left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } on SocketException catch (e) {
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
      // جلب الـ document بالكامل
      final response = await supabaseClient
          .from('protocols')
          .select('details')
          .eq('id', protocolId)
          .single();

      if (response['details'] == null) {
        return left(SupabaseDatabaseFailure('No details found'));
      }

      return right(ProtocolDetailsModel.fromJson(response['details']));
    } on PostgrestException catch (e) {
      return left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } on SocketException catch (e) {
      return left(NetworkFailure.fromSocketException(e));
    } catch (e) {
      return left(SupabaseDatabaseFailure(e.toString()));
    }
  }
}
