import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/core/error/payment_failure.dart';
import 'package:k_rehab/features/payment/data/models/subscribtion_plan.dart';
import 'package:k_rehab/features/payment/data/repositories/payment_repo.dart';
import 'package:k_rehab/features/profile/data/repo/profile_repo.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepository _paymentRepository;
  final ProfileRepo _profileRepo;

  PaymentCubit({
    required PaymentRepository paymentRepository,
    required ProfileRepo profileRepo,
  })  : _paymentRepository = paymentRepository,
        _profileRepo = profileRepo,
        super(PaymentInitial());

  Future<void> subscribe(SubscriptionPlan plan) async {
    emit(PaymentLoading());

    // 1. Get User Data for Billing Info
    final userResult = await _profileRepo.getUserData();

    await userResult.fold(
      (failure) async {
        emit(PaymentFailureState(const IntentionCreationFailure(
          'فشل في الحصول على بيانات المستخدم لعملية الدفع',
        )));
      },
      (user) async {
        // 2. Start Payment Process
        final result = await _paymentRepository.startSubscriptionPayment(
          plan: plan,
          userEmail: user.email,
          userFirstName: user.name.split(' ').first,
          userLastName: user.name.split(' ').last,
          userPhone: '+201234567890', // Default if missing from model
        );

        result.fold(
          (failure) => emit(PaymentFailureState(failure)),
          (_) => emit(PaymentSuccess()),
        );
      },
    );
  }
}
