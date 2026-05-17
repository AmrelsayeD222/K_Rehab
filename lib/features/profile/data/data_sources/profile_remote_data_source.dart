import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ProfileRemoteDataSource {
  Future<void> uploadProfileImage(File image);
  String getPublicUrl(String userId);
  Future<void> updateSubscriptionStatus(bool isSubscribed);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final SupabaseClient client;

  ProfileRemoteDataSourceImpl({required this.client});

  @override
  Future<void> uploadProfileImage(File image) async {
    await client.storage.from('profiles').upload(
          'profiles/${client.auth.currentUser!.id}',
          image,
          fileOptions: const FileOptions(upsert: true),
        );
  }

  @override
  String getPublicUrl(String userId) {
    return client.storage.from('profiles').getPublicUrl('profiles/$userId');
  }

  @override
  Future<void> updateSubscriptionStatus(bool isSubscribed) async {
    await client.auth.updateUser(
      UserAttributes(data: {'isSubscribed': isSubscribed}),
    );
  }
}
