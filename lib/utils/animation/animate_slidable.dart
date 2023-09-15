import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

/// Holding a flag so we won't animate dozens of cards simultaneously
bool _isAnimating = false;

/// Draw animation of [Slidable] widget => open and then close
///
/// [onAnimationEndAction] - Action that'll be fired up after animation played
void animateDeleting(BuildContext ctx, VoidCallback? onAnimationEndAction) {
  // Do not play anim if already playing or slider isn't on top of route
  if (_isAnimating || !ModalRoute.of(ctx)!.isCurrent) return;
  _isAnimating = true;
  Future.delayed(const Duration(seconds: 1), () {
    //Reseting animation flag
    _isAnimating = false;

    //Run animation
    Slidable.of(ctx)
        ?.openEndActionPane(
          // First animate card opening
          curve: Curves.easeOutCirc,
          duration: const Duration(milliseconds: 500),
        )
        .then(
          // Delay so we could show action
          (value) => Future.delayed(
            const Duration(milliseconds: 700),
            // Then animate card closing
            () => Slidable.of(ctx)!
                .close(
                    curve: Curves.easeOutCirc,
                    duration: const Duration(milliseconds: 400))
                .then((value) {
              // Clean up vals
              onAnimationEndAction?.call();
            }),
          ),
        );
  });
  // Cleaning up card animation
}
