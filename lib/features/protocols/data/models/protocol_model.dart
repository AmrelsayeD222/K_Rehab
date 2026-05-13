import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_details_model.dart';

part 'protocol_model.g.dart';

@HiveType(typeId: 6)
class ProtocolModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String subtitle;
  @HiveField(3)
  final bool isClinicallyReviewed;
  @HiveField(4)
  final String imagePath;
  @HiveField(5)
  final String duration;
  @HiveField(6)
  final String sessions;
  @HiveField(7)
  final bool isFree;
  @HiveField(8)
  final bool isFeatured;
  @HiveField(9)
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
