import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:k_rehab/core/services/cache_helper.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService(this._storage);

  static const String _tokenKey = 'auth_token';

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
    await CacheHelper.saveData(key: 'isLoggedIn', value: true);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
    await CacheHelper.removeData(key: 'isLoggedIn');
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
    await CacheHelper.removeData(key: 'isLoggedIn');
  }
}
