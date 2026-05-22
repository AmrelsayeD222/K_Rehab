import 'dart:io';
import 'failure.dart';

class NetworkFailure extends Failure {
  const NetworkFailure(super.errorMessage);

  factory NetworkFailure.fromSocketException(SocketException exception) {
    return const NetworkFailure(
      'No internet connection. Please check your network and try again',
    );
  }
}
