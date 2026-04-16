import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/core/error/supabase_auth_failure.dart';
import 'package:k_rehab/core/error/supabase_database_failure.dart';
import 'package:k_rehab/features/profile/data/repo/profile_repo.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepoImpl implements ProfileRepo {
  final SupabaseClient client;

  ProfileRepoImpl({required this.client});

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await client.auth.signOut();
      return right(null);
    } on AuthException catch (e) {
      return left(SupabaseAuthFailure.fromAuthException(e));
    } catch (e) {
      return left(SupabaseAuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> uploadProfileImage(File image) async {
    try {
      await client.storage
          .from('profiles')
          .upload(
            'profiles${client.auth.currentUser!.id}',
            image,
            fileOptions: const FileOptions(upsert: true),
          );
      return right(null);
    } on StorageException catch (e) {
      return left(SupabaseDatabaseFailure.fromStorageException(e));
    } catch (e) {
      return left(SupabaseDatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getProfileImage() async {
    try {
      final baseUrl = client.storage
          .from('profiles')
          .getPublicUrl('profiles${client.auth.currentUser!.id}');
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      return right('$baseUrl?v=$timestamp');
    } on StorageException catch (e) {
      return left(SupabaseDatabaseFailure.fromStorageException(e));
    } catch (e) {
      return left(SupabaseDatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getUserName() async {
    try {
      final user = client.auth.currentUser;
      if (user != null) {
        final name = user.userMetadata?['name'] as String?;
        return right(name ?? 'Unknown User');
      }
      return left(SupabaseAuthFailure('User not logged in'));
    } catch (e) {
      return left(SupabaseDatabaseFailure(e.toString()));
    }
  }
}
