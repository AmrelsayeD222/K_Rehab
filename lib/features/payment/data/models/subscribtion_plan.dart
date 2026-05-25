enum SubscriptionPlan {
  monthly,
  yearly;

  // ✅ حطّ الأسعار هنا بالـ cents (الجنيه × 100)
  int get amountCents {
    switch (this) {
      case SubscriptionPlan.monthly:
        return 9900; // ✅ غيّر للسعر الشهري × 100
      case SubscriptionPlan.yearly:
        return 79900; // ✅ غيّر للسعر السنوي × 100
    }
  }

  String get displayName {
    switch (this) {
      case SubscriptionPlan.monthly:
        return '99 EGP / month';
      case SubscriptionPlan.yearly:
        return '599 EGP / year';
    }
  }

  String get itemName {
    switch (this) {
      case SubscriptionPlan.monthly:
        return 'KRehab Monthly Subscription';
      case SubscriptionPlan.yearly:
        return 'KRehab Yearly Subscription';
    }
  }

  String get itemDescription {
    switch (this) {
      case SubscriptionPlan.monthly:
        return 'Monthly rehabilitation program access';
      case SubscriptionPlan.yearly:
        return 'Yearly rehabilitation program access';
    }
  }
}

// ✅ نتيجة الـ SDK
enum PaymobSdkResult {
  success,
  rejected,
  pending;

  factory PaymobSdkResult.fromString(String value) {
    final lowerValue = value.toLowerCase();
    switch (lowerValue) {
      case 'successfull':
      case 'success':
        return PaymobSdkResult.success;
      case 'rejected':
        return PaymobSdkResult.rejected;
      case 'pending':
        return PaymobSdkResult.pending;
      default:
        return PaymobSdkResult.rejected;
    }
  }
}
