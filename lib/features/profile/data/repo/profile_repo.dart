import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/core/error/supabase_auth_failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepo {
  final SupabaseClient client;
  ProfileRepo({required this.client});
  Future<Either<Failure, void>> logout() async {
    try {
      await client.auth.signOut();
      return right(null);
    } on AuthException catch (e) {
      return left(SupabaseAuthFailure(e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
