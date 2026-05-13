import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:k_rehab/core/config/environment_config.dart';
import 'package:k_rehab/core/di/service_locator.dart';
import 'package:k_rehab/core/services/cache_helper.dart';
import 'package:k_rehab/core/services/supabase_config.dart';
import 'package:k_rehab/core/storage/hive_manager.dart';
import 'package:k_rehab/k_rehab_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveManager.init();
  EnvironmentConfig.environment = AppEnvironment.dev;
  await dotenv.load(fileName: ".env");
  await SupabaseConfig.init();
  await CacheHelper.init();
  setupServiceLocator();
  runApp(const KRehabApp());
}
