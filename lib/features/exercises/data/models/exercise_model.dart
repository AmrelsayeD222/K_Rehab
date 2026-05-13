import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'exercise_model.g.dart';

@HiveType(typeId: 3)
class ExerciseModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String tag;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final String difficulty;
  @HiveField(5)
  final int? sets;
  @HiveField(6)
  final int? reps;
  @HiveField(7)
  final int? holdSeconds;
  @HiveField(8)
  final String subtitle;
  @HiveField(9)
  final String imageUrl;
  @HiveField(10)
  final String gifUrl;
  @HiveField(11)
  final List<ExerciseStepModel> steps;

  @override
  List<Object?> get props => [
        id,
        title,
        tag,
        category,
        difficulty,
        sets,
        reps,
        holdSeconds,
        subtitle,
        imageUrl,
        gifUrl,
        steps,
      ];

  const ExerciseModel({
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

@HiveType(typeId: 4)
class ExerciseStepModel extends Equatable {
  @HiveField(0)
  final int step;
  @HiveField(1)
  final String description;

  @override
  List<Object?> get props => [step, description];

  const ExerciseStepModel({required this.step, required this.description});

  factory ExerciseStepModel.fromJson(Map<String, dynamic> json) {
    return ExerciseStepModel(
      step: json['step'] ?? 0,
      description: json['description'] ?? '',
    );
  }
}
