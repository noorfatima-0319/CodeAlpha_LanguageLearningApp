import 'dart:math';
import 'package:flutter/material.dart';

class FlipCard extends StatelessWidget {
  final bool flipped; final Widget front, back; final VoidCallback onTap;
  const FlipCard({super.key, required this.flipped, required this.front, required this.back, required this.onTap});
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: flipped ? pi : 0.0),
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOutCubic,
        builder: (_, a, __) {
          final showBack = a > pi / 2;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..setEntry(3, 2, 0.0012)..rotateY(a),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: showBack ? cs.primaryContainer : cs.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Center(
                child: showBack
                    ? Transform(alignment: Alignment.center, transform: Matrix4.rotationY(pi), child: back)
                    : front,
              ),
            ),
          );
        },
      ),
    );
  }
}
