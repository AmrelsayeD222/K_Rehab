import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:k_rehab/core/constants/app_secrets.dart';
import '../models/auth_params.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> signUp(AuthParams params);
  Future<AuthResponse> signInWithPassword(AuthParams params);
  Future<void> signInWithOAuth(OAuthProvider provider);
  Future<void> signOut();
  Session? get currentSession;
  Stream<AuthState> get onAuthStateChange;
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<AuthResponse> signUp(AuthParams params) async {
    return await client.auth.signUp(
      email: params.email,
      password: params.password,
      data: {'name': params.name},
    );
  }

  @override
  Future<AuthResponse> signInWithPassword(AuthParams params) async {
    return await client.auth.signInWithPassword(
      email: params.email,
      password: params.password,
    );
  }

  @override
  Future<void> signInWithOAuth(OAuthProvider provider) async {
    await client.auth.signInWithOAuth(
      provider,
      authScreenLaunchMode: LaunchMode.externalApplication,
      redirectTo: AppSecrets.authCallbackUrl,
    );
  }

  @override
  Future<void> signOut() async {
    await client.auth.signOut();
  }

  @override
  Session? get currentSession => client.auth.currentSession;

  @override
  Stream<AuthState> get onAuthStateChange => client.auth.onAuthStateChange;
}
