import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppSecrets {
  static String supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
  static String supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  static String authCallbackUrl = dotenv.env['AUTH_CALLBACK_URL'] ?? '';

  // Paymob Secrets
  static String paymobPublicKey = dotenv.env['PAYMOB_PUBLIC_KEY'] ?? '';
  static String paymobCardIntegrationId =
      dotenv.env['PAYMOB_CARD_INTEGRATION_ID'] ?? '';
  static String paymobWalletIntegrationId =
      dotenv.env['PAYMOB_WALLET_INTEGRATION_ID'] ?? '';
}
