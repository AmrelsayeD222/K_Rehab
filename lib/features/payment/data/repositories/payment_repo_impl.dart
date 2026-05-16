import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:k_rehab/core/constants/app_secrets.dart';
import 'package:k_rehab/core/error/dio_failure.dart';
import 'package:k_rehab/core/error/payment_failure.dart';
import 'package:k_rehab/features/payment/data/dataSource/payment_remote_data_source.dart';
import 'package:k_rehab/features/payment/data/dataSource/paymob_sdk_service.dart';
import 'package:k_rehab/features/payment/data/models/create_intention_request_model.dart';
import 'package:k_rehab/features/payment/data/models/subscribtion_plan.dart';
import 'package:k_rehab/features/payment/data/repositories/payment_repo.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource _remoteDataSource;
  final PaymobSdkService _sdkService;

  const PaymentRepositoryImpl({
    required PaymentRemoteDataSource remoteDataSource,
    required PaymobSdkService sdkService,
  })  : _remoteDataSource = remoteDataSource,
        _sdkService = sdkService;

  @override
  Future<Either<PaymentFailure, Unit>> startSubscriptionPayment({
    required SubscriptionPlan plan,
    required String userEmail,
    required String userFirstName,
    required String userLastName,
    required String userPhone,
  }) async {
    try {
      // ─── Step 1: Create Intention ──────────────────────────────────────────

      final cardIntegrationId =
          int.tryParse(AppSecrets.paymobCardIntegrationId) ?? 0;
      final walletIntegrationId =
          int.tryParse(AppSecrets.paymobWalletIntegrationId) ?? 0;

      final request = CreateIntentionRequestModel(
        amount: plan.amountCents,
        currency: 'EGP',
        paymentMethods: [cardIntegrationId, walletIntegrationId],
        items: [
          IntentionItemModel(
            name: plan.itemName,
            amount: plan.amountCents,
            description: plan.itemDescription,
            quantity: 1,
          ),
        ],
        billingData: BillingDataModel(
          firstName: userFirstName,
          lastName: userLastName,
          email: userEmail,
          phoneNumber: userPhone,
        ),
        customer: CustomerModel(
          firstName: userFirstName,
          lastName: userLastName,
          email: userEmail,
        ),
      );

      final intentionResponse =
          await _remoteDataSource.createIntention(request);

      // ─── Step 2: Launch SDK ────────────────────────────────────────────────
      final sdkResult = await _sdkService.pay(
        clientSecret: intentionResponse.clientSecret,
      );

      // ─── Step 3: Map SDK result → Either ──────────────────────────────────
      switch (sdkResult) {
        case PaymobSdkResult.success:
          return right(unit);

        case PaymobSdkResult.rejected:
          return left(const PaymentRejectedFailure());

        case PaymobSdkResult.pending:
          return left(const PaymentPendingFailure());
      }
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioError(e);
      if (e.type == DioExceptionType.badResponse) {
        return left(IntentionCreationFailure(failure.errorMessage));
      }
      return left(PaymentNetworkFailure(failure.errorMessage));
    } on Exception catch (e) {
      return left(UnexpectedPaymentFailure(e.toString()));
    }
  }
}
