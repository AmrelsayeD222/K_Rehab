import 'dart:io';
import 'failure.dart';

class NetworkFailure extends Failure {
  const NetworkFailure(super.errorMessage);

  factory NetworkFailure.fromSocketException(SocketException exception) {
    return const NetworkFailure(
      'No internet connection. Please check your network and try again',
    );
  }

  // /// Handles other errors that might be network-related but not SocketException
  // /// (e.g., ClientException or general lookup failures)
  // factory NetworkFailure.handleOtherErrors(Object exception) {
  //   final errorStr = exception.toString();
  //   if (errorStr.contains('SocketException') ||
  //       errorStr.contains('ClientException') ||
  //       errorStr.contains('Failed host lookup')) {
  //     return const NetworkFailure(
  //       'No internet connection. Please check your network and try again',
  //     );
  //   }
  //   return const NetworkFailure(
  //     'An unexpected error occurred. Please try again later',
  //   );
  // }
}
