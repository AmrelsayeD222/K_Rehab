import 'package:supabase_flutter/supabase_flutter.dart';

import 'failure.dart';

class SupabaseDatabaseFailure extends Failure {
  SupabaseDatabaseFailure(super.errorMessage);

  factory SupabaseDatabaseFailure.fromPostgrestException(
    PostgrestException exception,
  ) {
    final String? code = exception.code?.toString();

    // ── Handle missing/unknown code safely ─────────────────────────────
    if (code == null) {
      return SupabaseDatabaseFailure(
        'Unable to process request. Please try again',
      );
    }

    switch (code) {
      // ── Row / data issues ──────────────────────────────────────────────
      case 'PGRST116':
        return SupabaseDatabaseFailure('No data found');

      case 'PGRST301':
        return SupabaseDatabaseFailure(
          'Your session has expired. Please log in again',
        );

      // ── Unique / integrity violations ──────────────────────────────────
      case '23505':
        return SupabaseDatabaseFailure('This record already exists');

      case '23503':
        return SupabaseDatabaseFailure(
          "You can't delete or modify this item because it's linked to other data",
        );

      case '23502':
        return SupabaseDatabaseFailure('Please fill in all required fields');

      case '23514':
        return SupabaseDatabaseFailure(
          'The provided data does not meet required conditions',
        );

      // ── Permissions / RLS ──────────────────────────────────────────────
      case '42501':
        return SupabaseDatabaseFailure(
          'You do not have permission to perform this action',
        );

      case '42503':
        return SupabaseDatabaseFailure(
          'Access denied. Please contact support if this is unexpected',
        );

      // ── Schema / query issues ──────────────────────────────────────────
      case '42P01':
      case '42703':
      case 'PGRST200':
        return SupabaseDatabaseFailure(
          'An internal error occurred. Please try again later',
        );

      // ── Connection / server issues ─────────────────────────────────────
      case '08000':
      case '08003':
      case '08006':
        return SupabaseDatabaseFailure(
          'Unable to connect to the server. Please try again',
        );

      case '53300':
        return SupabaseDatabaseFailure(
          'The server is currently busy. Please try again later',
        );

      case '57014':
        return SupabaseDatabaseFailure(
          'The request timed out. Please try again',
        );

      // ── Default fallback ────────────────────────────────────────────────
      default:
        return SupabaseDatabaseFailure(
          'An unexpected error occurred. Please try again',
        );
    }
  }

  factory SupabaseDatabaseFailure.fromStorageException(
    StorageException exception,
  ) {
    // ── Handle common storage issues ──────────────────────────────────
    if (exception.message.contains('Object not found')) {
      return SupabaseDatabaseFailure('File not found');
    }

    if (exception.message.contains('bucket not found')) {
      return SupabaseDatabaseFailure('Storage configuration error');
    }

    if (exception.message.contains('Payload too large')) {
      return SupabaseDatabaseFailure('File size is too large');
    }

    if (exception.message.contains('Unauthorized')) {
      return SupabaseDatabaseFailure(
        'You do not have permission to access this file',
      );
    }

    return SupabaseDatabaseFailure(
      'An error occurred while accessing cloud storage',
    );
  }
}
