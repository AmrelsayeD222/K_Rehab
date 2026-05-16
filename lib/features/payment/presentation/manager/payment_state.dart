import 'package:equatable/equatable.dart';
import 'package:k_rehab/core/error/payment_failure.dart';

sealed class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object?> get props => [];
}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentSuccess extends PaymentState {}

final class PaymentFailureState extends PaymentState {
  final PaymentFailure failure;

  const PaymentFailureState(this.failure);

  @override
  List<Object?> get props => [failure];
}
