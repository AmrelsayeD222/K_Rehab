import 'package:k_rehab/core/error/failure.dart';

class PaymentFailure extends Failure {
  const PaymentFailure(super.errorMessage);
}

final class IntentionCreationFailure extends PaymentFailure {
  const IntentionCreationFailure(
      [super.errorMessage = 'Failed to create payment intention']);
}

// الـ SDK رجع Rejected
final class PaymentRejectedFailure extends PaymentFailure {
  const PaymentRejectedFailure([super.errorMessage = 'Payment rejected']);
}

// الـ SDK رجع Pending
final class PaymentPendingFailure extends PaymentFailure {
  const PaymentPendingFailure([super.errorMessage = 'Payment is pending']);
}

// خطأ في الـ MethodChannel (Native bridge)
final class NativeBridgeFailure extends PaymentFailure {
  const NativeBridgeFailure(
      [super.errorMessage = 'Failed to communicate with payment system']);
}

// خطأ شبكة
final class PaymentNetworkFailure extends PaymentFailure {
  const PaymentNetworkFailure([super.errorMessage = 'Network error']);
}

// خطأ غير متوقع
final class UnexpectedPaymentFailure extends PaymentFailure {
  const UnexpectedPaymentFailure([super.errorMessage = 'Unexpected error']);
}
