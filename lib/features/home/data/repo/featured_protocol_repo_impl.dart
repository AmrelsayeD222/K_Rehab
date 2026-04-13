import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/features/home/data/models/featured_protocol_model.dart';
import 'package:k_rehab/features/home/data/repo/featured_protocol_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FeaturedProtocolRepoImpl implements FeaturedProtocolRepo {
  final SupabaseClient supabaseClient;

  FeaturedProtocolRepoImpl({required this.supabaseClient});
  @override
  Future<Either<Failure, List<FeaturedProtocolModel>>>
  getFeaturedProtocols() async {
    try {
      final response = await supabaseClient
          .from('featured protocols')
          .select('title, image_path');

      final List<FeaturedProtocolModel> protocols = (response as List)
          .map((e) => FeaturedProtocolModel.fromJson(e))
          .toList();

      return Right(protocols);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
