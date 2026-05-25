import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ProfileRemoteDataSource {
  Future<void> uploadProfileImage(File image);
  Future<String?> getProfileImageUrl(String userId);
  Future<void> updateSubscriptionStatus(bool isSubscribed);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final SupabaseClient client;

  ProfileRemoteDataSourceImpl({required this.client});

  static String profileImagePath(String userId) => 'profiles/$userId';

  @override
  Future<void> uploadProfileImage(File image) async {
    await client.storage.from('profiles').upload(
          profileImagePath(client.auth.currentUser!.id),
          image,
          fileOptions: const FileOptions(upsert: true),
        );
  }

  @override
  Future<String?> getProfileImageUrl(String userId) async {
    final path = profileImagePath(userId);
    final exists = await client.storage.from('profiles').exists(path);
    if (!exists) return null;
    return client.storage.from('profiles').getPublicUrl(path);
  }

  @override
  Future<void> updateSubscriptionStatus(bool isSubscribed) async {
    await client.auth.updateUser(
      UserAttributes(data: {'isSubscribed': isSubscribed}),
    );
  }
}
