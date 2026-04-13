class FeaturedExercisesModel {
  final String title;
  final String imagePath;
  final String description;
  final String level;

  FeaturedExercisesModel({
    required this.title,
    required this.imagePath,
    required this.description,
    required this.level,
  });

  factory FeaturedExercisesModel.fromJson(Map<String, dynamic> json) {
    return FeaturedExercisesModel(
      title: json['title'] ?? 'Title',
      imagePath: json['image_path'] ?? '',
      description: json['description'] ?? '',
      level: json['level'] ?? '',
    );
  }
}
