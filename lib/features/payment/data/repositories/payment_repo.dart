import 'package:dartz/dartz.dart';
import 'package:k_rehab/core/error/payment_failure.dart';
import 'package:k_rehab/features/payment/data/models/subscribtion_plan.dart';

abstract interface class PaymentRepository {
  /// ينشئ intention ويفتح شاشة الدفع عبر الـ SDK
  /// بيرجع Right(unit) لو الدفع نجح
  /// بيرجع Left(PaymentFailure) في أي حالة فشل
  Future<Either<PaymentFailure, Unit>> startSubscriptionPayment({
    required SubscriptionPlan plan,
    required String userEmail,
    required String userFirstName,
    required String userLastName,
    required String userPhone,
  });
}
