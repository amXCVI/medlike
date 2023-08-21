import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

/// Draw animation of [Slidable] widget => open and then close
///
/// [onAnimationEndAction] - Action that'll be fired up after animation played
void animateDeleting(BuildContext ctx, VoidCallback? onAnimationEndAction) {
  Future.delayed(const Duration(seconds: 1), () {
    Slidable.of(ctx)!
        .openEndActionPane(
            curve: Curves.easeOutCirc, duration: const Duration(seconds: 1))
        .then((value) => Slidable.of(ctx)!.close(
            curve: Curves.easeOutQuint, duration: const Duration(seconds: 1)))
        .then((value) => onAnimationEndAction?.call());
  });
}
