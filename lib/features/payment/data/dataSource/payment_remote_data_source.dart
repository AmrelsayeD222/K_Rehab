import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:k_rehab/features/payment/data/models/create_intention_request_model.dart';
import 'package:k_rehab/features/payment/data/models/create_intention_response_model.dart';

abstract interface class PaymentRemoteDataSource {
  Future<CreateIntentionResponseModel> createIntention(
    CreateIntentionRequestModel request,
  );
}

// ─────────────────────────────────────────────────────────────────────────────

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  PaymentRemoteDataSourceImpl();

  @override
  Future<CreateIntentionResponseModel> createIntention(
    CreateIntentionRequestModel request,
  ) async {
    final res = await Supabase.instance.client.functions.invoke(
      'create_paymob_intention',
      body: request.toJson(),
    );

    return CreateIntentionResponseModel.fromJson(res.data);
  }
}
