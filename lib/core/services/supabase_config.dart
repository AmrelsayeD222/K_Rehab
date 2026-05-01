import 'package:k_rehab/core/constants/app_secrets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static final SupabaseClient client = Supabase.instance.client;
  static Future<void> init() async {
    await Supabase.initialize(
      url: AppSecrets.supabaseUrl,
      anonKey: AppSecrets.supabaseAnonKey,
    );
  }
}
