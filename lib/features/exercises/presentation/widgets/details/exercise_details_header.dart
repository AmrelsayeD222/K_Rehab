import 'package:flutter/material.dart';

import 'package:k_rehab/core/utils/app_validators.dart';
import 'package:k_rehab/core/widgets/k_loading_widget.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';
import 'package:k_rehab/features/exercises/presentation/widgets/details/exercise_video_player.dart';

class ExerciseDetailsHeader extends StatelessWidget {
  final ExerciseModel exercise;
  final String heroTag;

  const ExerciseDetailsHeader({
    super.key,
    required this.exercise,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    final hasGif = AppValidators.isValidImageUrl(exercise.gifUrl);
    final hasImage = AppValidators.isValidImageUrl(exercise.imageUrl);

    return Hero(
      tag: heroTag,
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: hasGif
            ? ExerciseVedioPlayer(
                url: exercise.gifUrl,
                fit: BoxFit.cover,
                placeholder: hasImage
                    ? ExerciseVedioPlayer(
                        url: exercise.imageUrl,
                        fit: BoxFit.cover,
                        placeholder: const KLoadingWidget(),
                      )
                    : const KLoadingWidget(),
                errorWidget: hasImage
                    ? ExerciseVedioPlayer(
                        url: exercise.imageUrl,
                        fit: BoxFit.cover,
                        errorWidget: const Icon(
                          Icons.fitness_center,
                          color: Colors.grey,
                          size: 64,
                        ),
                      )
                    : const Icon(
                        Icons.fitness_center,
                        color: Colors.grey,
                        size: 64,
                      ),
              )
            : hasImage
                ? ExerciseVedioPlayer(
                    url: exercise.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: const KLoadingWidget(),
                    errorWidget: const Icon(
                      Icons.fitness_center,
                      color: Colors.grey,
                      size: 64,
                    ),
                  )
                : const Icon(
                    Icons.fitness_center,
                    color: Colors.grey,
                    size: 64,
                  ),
      ),
    );
  }
}
