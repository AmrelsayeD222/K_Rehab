class CreateIntentionResponseModel {
  final String clientSecret;
  final String id;

  const CreateIntentionResponseModel({
    required this.clientSecret,
    required this.id,
  });

  factory CreateIntentionResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateIntentionResponseModel(
        clientSecret: json['client_secret'] as String,
        id: json['id'] as String,
      );
}
