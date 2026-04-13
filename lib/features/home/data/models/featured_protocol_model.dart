class FeaturedProtocolModel {
  final String title;
  final String imagePath;

  FeaturedProtocolModel({required this.title, required this.imagePath});

  factory FeaturedProtocolModel.fromJson(Map<String, dynamic> json) {
    return FeaturedProtocolModel(
      title: json['title'],
      imagePath: json['image_path'],
    );
  }
}
