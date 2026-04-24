import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:k_rehab/core/widgets/k_loading_widget.dart';
import 'package:k_rehab/features/exercises/data/models/exercise_model.dart';

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
        child: exercise.gifUrl.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: exercise.gifUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => CachedNetworkImage(
                  imageUrl: exercise.imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const KLoadingWidget(),
                ),
                errorWidget: (context, url, error) => CachedNetworkImage(
                  imageUrl: exercise.imageUrl,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(
                    Icons.fitness_center,
                    color: Colors.grey,
                    size: 64,
                  ),
                ),
              )
            : exercise.imageUrl.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: exercise.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const KLoadingWidget(),
                    errorWidget: (context, url, error) => const Icon(
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
