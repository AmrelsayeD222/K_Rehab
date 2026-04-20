class ProtocolModel {
  final String id;
  final String title;
  final String subtitle;
  final bool isClinicallyReviewed;
  final String imagePath;
  final String duration;
  final String sessions;
  final bool isFree;
  final bool isFeatured;

  ProtocolModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.isClinicallyReviewed,
    required this.imagePath,
    required this.duration,
    required this.sessions,
    required this.isFree,
    required this.isFeatured,
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
    );
  }
}
