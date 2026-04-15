class ExerciseModel {
  final String id;
  final String title;
  final String tag;
  final String category;
  final String difficulty;
  final int? sets;
  final int? reps;
  final int? holdSeconds;
  final String subtitle;
  final String imageUrl;
  final String gifUrl;
  final List<ExerciseStepModel> steps;

  ExerciseModel({
    required this.id,
    required this.title,
    required this.tag,
    required this.category,
    required this.difficulty,
    this.sets,
    this.reps,
    this.holdSeconds,
    required this.subtitle,
    required this.imageUrl,
    required this.gifUrl,
    required this.steps,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      tag: json['tag'] ?? '',
      category: json['category'] ?? '',
      difficulty: json['difficulty'] ?? 'MODERATE DIFFICULTY',
      sets: json['sets'],
      reps: json['reps'],
      holdSeconds: json['hold_seconds'],
      subtitle: json['subtitle'] ?? '',
      imageUrl: json['image_url'] ?? '',
      gifUrl: json['gif_url'] ?? '',
      steps: (json['steps'] as List<dynamic>?)
              ?.map((step) => ExerciseStepModel.fromJson(step))
              .toList() ??
          [],
    );
  }
}

class ExerciseStepModel {
  final int step;
  final String description;

  ExerciseStepModel({required this.step, required this.description});

  factory ExerciseStepModel.fromJson(Map<String, dynamic> json) {
    return ExerciseStepModel(
      step: json['step'] ?? 0,
      description: json['description'] ?? '',
    );
  }
}
