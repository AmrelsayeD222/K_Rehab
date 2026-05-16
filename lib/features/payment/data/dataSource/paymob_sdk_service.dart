import 'package:flutter/services.dart';
import 'package:k_rehab/core/constants/app_secrets.dart';
import 'package:k_rehab/features/payment/data/models/subscribtion_plan.dart';

abstract interface class PaymobSdkService {
  Future<PaymobSdkResult> pay({
    required String clientSecret,
  });
}

// ─────────────────────────────────────────────────────────────────────────────

class PaymobSdkServiceImpl implements PaymobSdkService {
  static const _channel = MethodChannel('paymob_sdk_flutter');

  @override
  Future<PaymobSdkResult> pay({
    required String clientSecret,
  }) async {
    final String result = await _channel.invokeMethod(
      'payWithPaymob',
      {
        'publicKey': AppSecrets.paymobPublicKey,
        'clientSecret': clientSecret,
        'appName': 'KRehab',
      },
    );

    return PaymobSdkResult.fromString(result);
  }
}
