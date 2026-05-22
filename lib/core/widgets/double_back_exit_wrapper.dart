import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DoubleBackExitWrapper extends StatefulWidget {
  final Widget child;
  final int currentIndex;
  final VoidCallback onBackToHome;
  final Duration duration;

  const DoubleBackExitWrapper({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.onBackToHome,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<DoubleBackExitWrapper> createState() => _DoubleBackExitWrapperState();
}

class _DoubleBackExitWrapperState extends State<DoubleBackExitWrapper> {
  DateTime? _lastBackPressTime;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        // 1. If not on Home tab, go to Home tab
        if (widget.currentIndex != 0) {
          widget.onBackToHome();
          return;
        }

        // 2. If on Home tab, handle double back to exit
        final now = DateTime.now();

        if (_lastBackPressTime == null ||
            now.difference(_lastBackPressTime!) > widget.duration) {
          _lastBackPressTime = now;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Press back again to exit ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              backgroundColor: Theme.of(context).cardColor,
              duration: widget.duration,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.only(
                bottom: 20,
                left: 100,
                right: 100,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        } else {
          SystemNavigator.pop();
        }
      },
      child: widget.child,
    );
  }
}
