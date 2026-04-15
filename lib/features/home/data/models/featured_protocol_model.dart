class FeaturedProtocolModel {
  final String title;
  final String imagePath;
  final String id;

  FeaturedProtocolModel({
    required this.title,
    required this.imagePath,
    required this.id,
  });

  factory FeaturedProtocolModel.fromJson(Map<String, dynamic> json) {
    return FeaturedProtocolModel(
      title: json['title'] ?? '',
      imagePath: json['image_path'] ?? '',
      id: json['id'] ?? '',
    );
  }
}
