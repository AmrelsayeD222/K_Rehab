import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String name;
  final String email;
  final String id;
  final String? profileImageUrl;
  final DateTime? createdAt;

  @override
  List<Object?> get props => [name, email, id, profileImageUrl, createdAt];

  const UserModel({
    required this.name,
    required this.email,
    required this.id,
    this.profileImageUrl,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profileImageUrl: json['profile_image_url'] ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'profile_image_url': profileImageUrl,
    };
  }
}
