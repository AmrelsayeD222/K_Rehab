import 'package:hive_flutter/hive_flutter.dart';
import 'package:k_rehab/core/storage/hive_manager.dart';
import 'package:k_rehab/features/auth/data/models/user_model.dart';

abstract class ProfileLocalDataSource {
  Future<void> cacheUserData(UserModel user);
  Future<UserModel?> getCachedUserData();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final Box<UserModel> box = Hive.box<UserModel>(HiveManager.userBox);

  @override
  Future<void> cacheUserData(UserModel user) async {
    await box.put('current_user', user);
  }

  @override
  Future<UserModel?> getCachedUserData() async {
    return box.get('current_user');
  }
}
