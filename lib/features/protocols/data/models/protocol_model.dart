import 'package:equatable/equatable.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_details_model.dart';

class ProtocolModel extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final bool isClinicallyReviewed;
  final String imagePath;
  final String duration;
  final String sessions;
  final bool isFree;
  final bool isFeatured;
  final ProtocolDetailsModel? details;

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        isClinicallyReviewed,
        imagePath,
        duration,
        sessions,
        isFree,
        isFeatured,
        details,
      ];

  const ProtocolModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.isClinicallyReviewed,
    required this.imagePath,
    required this.duration,
    required this.sessions,
    required this.isFree,
    required this.isFeatured,
    this.details,
  });

  factory ProtocolModel.fromJson(Map<String, dynamic> json) {
    return ProtocolModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      isClinicallyReviewed: json['isClinicallyReviewed'] ?? false,
      imagePath: json['image_path'] ?? '',
      duration: json['duration'] ?? '',
      sessions: json['sessions'] ?? '',
      isFree: json['isFree'] ?? true,
      isFeatured: json['is_featured'] ?? false,
      details: json['details'] != null
          ? ProtocolDetailsModel.fromJson(json['details'])
          : null,
    );
  }
}
