import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/failure.dart';
import 'package:k_rehab/core/error/network_failure.dart';
import 'package:k_rehab/core/error/supabase_auth_failure.dart';
import 'package:k_rehab/core/error/supabase_database_failure.dart';
import 'package:k_rehab/features/auth/data/models/user_model.dart';
import 'package:k_rehab/features/profile/data/data_sources/profile_local_data_source.dart';
import 'package:k_rehab/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:k_rehab/features/profile/data/repo/profile_repo.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource remoteDataSource;
  final ProfileLocalDataSource localDataSource;
  final SupabaseClient supabaseClient;

  ProfileRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.supabaseClient,
  });

  @override
  Future<Either<Failure, void>> uploadProfileImage(File image) async {
    try {
      await remoteDataSource.uploadProfileImage(image);
      return right(null);
    } on StorageException catch (e) {
      return left(SupabaseDatabaseFailure.fromStorageException(e));
    } on AuthException catch (e) {
      return left(SupabaseAuthFailure.fromAuthException(e));
    } on SocketException catch (e) {
      return left(NetworkFailure.fromSocketException(e));
    } catch (e) {
      return left(SupabaseDatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserData() async {
    try {
      final user = supabaseClient.auth.currentUser;
      if (user != null) {
        final profileImageUrl =
            await remoteDataSource.getProfileImageUrl(user.id);

        final userModel = UserModel(
          id: user.id,
          name: user.userMetadata?['name'] ?? 'Unknown User',
          email: user.email ?? 'No Email',
          profileImageUrl: profileImageUrl,
          isSubscribed: user.userMetadata?['isSubscribed'] ?? false,
        );

        await localDataSource.cacheUserData(userModel);
        return right(userModel);
      }
      
      final cachedUser = await localDataSource.getCachedUserData();
      if (cachedUser != null) return right(cachedUser);
      
      return left(SupabaseAuthFailure('User not logged in'));
    } catch (e) {
      final cachedUser = await localDataSource.getCachedUserData();
      if (cachedUser != null) return right(cachedUser);
      return left(SupabaseDatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateSubscriptionStatus({required bool isActive}) async {
    try {
      await remoteDataSource.updateSubscriptionStatus(isActive);
      
      final cachedUser = await localDataSource.getCachedUserData();
      if (cachedUser != null) {
        final updatedUser = UserModel(
          id: cachedUser.id,
          name: cachedUser.name,
          email: cachedUser.email,
          profileImageUrl: cachedUser.profileImageUrl,
          createdAt: cachedUser.createdAt,
          isSubscribed: isActive,
        );
        await localDataSource.cacheUserData(updatedUser);
      }
      return right(null);
    } on AuthException catch (e) {
      return left(SupabaseAuthFailure.fromAuthException(e));
    } on SocketException catch (e) {
      return left(NetworkFailure.fromSocketException(e));
    } catch (e) {
      return left(SupabaseDatabaseFailure(e.toString()));
    }
  }
}
