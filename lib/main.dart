import 'package:flutter/material.dart';
import 'package:k_rehab/core/di/service_locator.dart';
import 'package:k_rehab/core/services/cache_helper.dart';
import 'package:k_rehab/core/services/supabase_config.dart';
import 'package:k_rehab/k_rehab_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.init();
  await CacheHelper.init();
  setupServiceLocator();

  runApp(const KRehabApp());
}
