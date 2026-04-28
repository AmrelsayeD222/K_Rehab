import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TypingIndicator extends StatelessWidget {
  final Color color;

  const TypingIndicator({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        )
            .animate(
              onPlay: (controller) => controller.repeat(),
              delay: (index * 150).ms,
            )
            .moveY(begin: 0, end: -4, duration: 300.ms, curve: Curves.easeInOut)
            .then()
            .moveY(begin: -4, end: 0, duration: 300.ms, curve: Curves.easeInOut)
            .then(delay: 300.ms); // Pause before repeating the bounce
      }),
    );
  }
}
