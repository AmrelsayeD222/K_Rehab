import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppSecrets {
  static String supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
  static String supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  static String geminiApiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
  static String authCallbackUrl = dotenv.env['AUTH_CALLBACK_URL'] ?? '';
}
