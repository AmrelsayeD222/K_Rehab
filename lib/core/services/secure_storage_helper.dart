import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SecureStorageHelper extends LocalStorage {
  final FlutterSecureStorage _storage;
  static const _supabaseSessionKey = 'supabase_session';

  const SecureStorageHelper({
    FlutterSecureStorage storage = const FlutterSecureStorage(),
  }) : _storage = storage;

  @override
  Future<void> initialize() async {}

  @override
  Future<bool> hasAccessToken() async {
    return await _storage.containsKey(key: _supabaseSessionKey);
  }

  @override
  Future<String?> accessToken() async {
    return await _storage.read(key: _supabaseSessionKey);
  }

  @override
  Future<void> removePersistedSession() async {
    await _storage.delete(key: _supabaseSessionKey);
  }

  @override
  Future<void> persistSession(String persistSessionString) async {
    await _storage.write(key: _supabaseSessionKey, value: persistSessionString);
  }
}
