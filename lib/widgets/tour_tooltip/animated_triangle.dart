import 'package:flutter/material.dart';

/// Draw an animated triagle that would appear in given animation time
/// Suppose to work with tooltip widget
class AnimatedTrianglePainter extends CustomPainter {
  final Color targetColor;
  final Animation<Color?> _colorAnim;

  AnimatedTrianglePainter(
      {required this.targetColor, required Animation<double> animation})
      : _colorAnim = ColorTween(begin: Colors.transparent, end: targetColor)
            .animate(animation),
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();
    final Paint paint = Paint();

    paint.strokeWidth = 2.0;
    paint.color = _colorAnim.value ?? targetColor;
    paint.style = PaintingStyle.fill;

    path.moveTo(size.width / 2.0, 0.0);
    path.lineTo(0.0, size.height + 1);
    path.lineTo(size.width, size.height + 1);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
