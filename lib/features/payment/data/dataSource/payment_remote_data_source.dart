import 'package:k_rehab/core/constants/app_secrets.dart';
import 'package:k_rehab/core/services/api_service.dart';
import 'package:k_rehab/features/payment/data/models/create_intention_request_model.dart';
import 'package:k_rehab/features/payment/data/models/create_intention_response_model.dart';

abstract interface class PaymentRemoteDataSource {
  Future<CreateIntentionResponseModel> createIntention(
    CreateIntentionRequestModel request,
  );
}

// ─────────────────────────────────────────────────────────────────────────────

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final ApiService apiService;

  PaymentRemoteDataSourceImpl({required this.apiService});

  @override
  Future<CreateIntentionResponseModel> createIntention(
    CreateIntentionRequestModel request,
  ) async {
    final response = await apiService.post(
      endpoint: 'https://accept.paymob.com/v1/intention/',
      body: request.toJson(),
      headers: {
        'Authorization': 'Token ${AppSecrets.paymobSecretKey}',
        'Content-Type': 'application/json',
      },
    );

    return CreateIntentionResponseModel.fromJson(response);
  }
}

