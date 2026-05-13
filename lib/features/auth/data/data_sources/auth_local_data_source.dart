import 'package:hive_flutter/hive_flutter.dart';
import 'package:k_rehab/core/storage/hive_manager.dart';
import 'package:k_rehab/features/auth/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel?> getCachedUser();
  Future<void> clearUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box<UserModel> box = Hive.box<UserModel>(HiveManager.userBox);

  @override
  Future<void> cacheUser(UserModel user) async {
    await box.put('current_user', user);
  }

  @override
  Future<UserModel?> getCachedUser() async {
    return box.get('current_user');
  }

  @override
  Future<void> clearUser() async {
    await box.delete('current_user');
  }
}
