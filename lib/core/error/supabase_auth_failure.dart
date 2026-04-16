import 'package:supabase_flutter/supabase_flutter.dart';
import 'failure.dart';

class SupabaseAuthFailure extends Failure {
  SupabaseAuthFailure(super.errorMessage);

  factory SupabaseAuthFailure.fromAuthException(AuthException exception) {
    // 1. Handle specialized network exceptions from Supabase
    if (exception is AuthRetryableFetchException) {
      return SupabaseAuthFailure(
        'No internet connection. Please check your network and try again',
      );
    }

    final String? code = exception.code;

    // ✅ FIX: null-safe statusCode handling (no fake 0 value)
    final int? statusCode = int.tryParse(exception.statusCode ?? '');

    // 2. Connection / unknown error state
    if (code == null && statusCode == null) {
      return SupabaseAuthFailure(
        'No internet connection. Please check your network and try again',
      );
    }

    if (code != null) {
      switch (code) {
        case 'network_error':
          return SupabaseAuthFailure(
            'No internet connection. Please check your network and try again',
          );

        case 'invalid_credentials':
        case 'bad_jwt':
          return SupabaseAuthFailure('Invalid email or password');

        case 'user_not_found':
          return SupabaseAuthFailure('No account found with this email');

        case 'user_already_exists':
        case 'email_exists':
        case 'phone_exists':
          return SupabaseAuthFailure(
            'An account with this email or phone number already exists',
          );

        case 'email_not_confirmed':
        case 'phone_not_confirmed':
          return SupabaseAuthFailure(
            'Please confirm your email or phone number first',
          );

        case 'email_address_invalid':
          return SupabaseAuthFailure('Invalid email address');

        case 'email_address_not_authorized':
          return SupabaseAuthFailure(
            'This email is not authorized to use the system',
          );

        case 'email_provider_disabled':
        case 'phone_provider_disabled':
        case 'signup_disabled':
          return SupabaseAuthFailure('Sign-ups are currently disabled');

        case 'weak_password':
          return SupabaseAuthFailure(
            'Password is too weak. Please choose a stronger one',
          );

        case 'captcha_failed':
          return SupabaseAuthFailure('CAPTCHA verification failed');

        case 'session_expired':
        case 'reauthentication_needed':
          return SupabaseAuthFailure(
            'Your session has expired. Please log in again',
          );

        case 'over_request_rate_limit':
        case 'over_email_send_rate_limit':
        case 'over_sms_send_rate_limit':
        case '429':
          return SupabaseAuthFailure(
            'Too many requests. Please try again later',
          );

        case 'user_banned':
          return SupabaseAuthFailure('This user account is temporarily banned');

        case 'invalid_otp':
          return SupabaseAuthFailure(
            'Incorrect verification code. Please try again',
          );

        case 'expired_otp':
          return SupabaseAuthFailure(
            'Verification code has expired. Please request a new one',
          );

        case 'too_many_attempts':
          return SupabaseAuthFailure(
            'Too many incorrect attempts. Please try again after 15 minutes',
          );

        case 'unexpected_failure':
        default:
          return SupabaseAuthFailure(
            'An unexpected error occurred. Please try again',
          );
      }
    }

    // 3. HTTP status fallback (null-safe)
    switch (statusCode) {
      case 403:
        return SupabaseAuthFailure(
          'You do not have permission to perform this action',
        );

      case 422:
        return SupabaseAuthFailure(
          'The request could not be processed at the moment',
        );

      case 429:
        return SupabaseAuthFailure(
          'Rate limit exceeded. Please wait and try again',
        );

      case 500:
        return SupabaseAuthFailure(
          'Internal server error. Please try again later',
        );

      case 501:
        return SupabaseAuthFailure(
          'This feature is not available on the server',
        );

      default:
        return SupabaseAuthFailure(
          'An unexpected error occurred. Please try again later',
        );
    }
  }
}
