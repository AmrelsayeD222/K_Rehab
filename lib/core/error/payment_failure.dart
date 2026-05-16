import 'package:k_rehab/core/error/failure.dart';

class PaymentFailure extends Failure {
  const PaymentFailure(super.errorMessage);
}

final class IntentionCreationFailure extends PaymentFailure {
  const IntentionCreationFailure(
      [super.errorMessage = 'فشل في بدء عملية الدفع']);
}

// الـ SDK رجع Rejected
final class PaymentRejectedFailure extends PaymentFailure {
  const PaymentRejectedFailure([super.errorMessage = 'تم رفض عملية الدفع']);
}

// الـ SDK رجع Pending
final class PaymentPendingFailure extends PaymentFailure {
  const PaymentPendingFailure(
      [super.errorMessage = 'عملية الدفع قيد الانتظار']);
}

// خطأ في الـ MethodChannel (Native bridge)
final class NativeBridgeFailure extends PaymentFailure {
  const NativeBridgeFailure(
      [super.errorMessage = 'خطأ في الاتصال بنظام الدفع']);
}

// خطأ شبكة
final class PaymentNetworkFailure extends PaymentFailure {
  const PaymentNetworkFailure([super.errorMessage = 'خطأ في الاتصال بالشبكة']);
}

// خطأ غير متوقع
final class UnexpectedPaymentFailure extends PaymentFailure {
  const UnexpectedPaymentFailure([super.errorMessage = 'حدث خطأ غير متوقع']);
}
