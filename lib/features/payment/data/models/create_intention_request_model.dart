class CreateIntentionRequestModel {
  final int amount;
  final String currency;
  final List<int> paymentMethods;
  final List<IntentionItemModel> items;
  final BillingDataModel billingData;
  final CustomerModel customer;

  const CreateIntentionRequestModel({
    required this.amount,
    required this.currency,
    required this.paymentMethods,
    required this.items,
    required this.billingData,
    required this.customer,
  });

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'currency': currency,
        'payment_methods': paymentMethods,
        'items': items.map((e) => e.toJson()).toList(),
        'billing_data': billingData.toJson(),
        'customer': customer.toJson(),
      };
}

// ─────────────────────────────────────────────

class IntentionItemModel {
  final String name;
  final int amount;
  final String description;
  final int quantity;

  const IntentionItemModel({
    required this.name,
    required this.amount,
    required this.description,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'amount': amount,
        'description': description,
        'quantity': quantity,
      };
}

// ─────────────────────────────────────────────

class BillingDataModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  const BillingDataModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone_number': phoneNumber,
      };
}

// ─────────────────────────────────────────────

class CustomerModel {
  final String firstName;
  final String lastName;
  final String email;

  const CustomerModel({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
      };
}
