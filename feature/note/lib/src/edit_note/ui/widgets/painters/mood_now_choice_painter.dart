import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MoodNowChoicePainter extends CustomPainter {
  final BuildContext context;
  final MoodType selectedFigure;

  MoodNowChoicePainter({
    required this.context,
    required this.selectedFigure,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double delta = size.width / 11;
    final double startWidth = size.width / 22;
    final double startHeight = size.height / 2;
    const double toUpCoefficient = 0.65;
    const double toDownCoefficient = 1.35;
    const double heightDifference = 20;
    const double underscoreOffset = 5;
    late final double selectedLeftOffset;

    final Paint backgroundPaint = Paint()..color = context.theme.colors.whiteBackground;
    final Path backgroundPath = Path();

    final Paint underscorePaint = Paint()
      ..color = context.theme.colors.accent.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2 * underscoreOffset
      ..strokeJoin = StrokeJoin.round;
    final Path underscorePath = Path();

    backgroundPath.moveTo(0, startHeight - heightDifference);

    for (int i = 0; i < 11; i++) {
      i.isEven
          ? backgroundPath.quadraticBezierTo(
              startWidth + i * delta,
              startHeight - 10,
              startWidth * 2 + i * delta,
              startHeight - heightDifference,
            )
          : backgroundPath.quadraticBezierTo(
              startWidth + i * delta,
              startHeight * toUpCoefficient,
              startWidth * 2 + i * delta,
              startHeight - heightDifference,
            );
    }

    backgroundPath.lineTo(size.width, startHeight + heightDifference);
    underscorePath.moveTo(size.width, startHeight + heightDifference + underscoreOffset);

    for (int i = 10; i >= 0; i--) {
      if (i.isEven) {
        backgroundPath.quadraticBezierTo(
          startWidth + i * delta,
          startHeight + 10,
          i * delta,
          startHeight + heightDifference,
        );

        underscorePath.quadraticBezierTo(
          startWidth + i * delta,
          startHeight + 10 + underscoreOffset,
          i * delta,
          startHeight + heightDifference + underscoreOffset,
        );
      } else {
        backgroundPath.quadraticBezierTo(
          startWidth + i * delta,
          startHeight * toDownCoefficient,
          i * delta,
          startHeight + heightDifference,
        );

        underscorePath.quadraticBezierTo(
          startWidth + i * delta,
          startHeight * toDownCoefficient + underscoreOffset,
          i * delta,
          startHeight + heightDifference + underscoreOffset,
        );
      }
    }

    switch (selectedFigure) {
      case MoodType.theWorstMood:
        selectedLeftOffset = startWidth;
        break;
      case MoodType.badMood:
        selectedLeftOffset = startWidth + 2 * delta;
        break;
      case MoodType.normalMood:
        selectedLeftOffset = startWidth + 4 * delta;
        break;
      case MoodType.goodMood:
        selectedLeftOffset = startWidth + 6 * delta;
        break;
      case MoodType.theBestMood:
        selectedLeftOffset = startWidth + 8 * delta;
        break;
    }

    backgroundPath.addOval(
      Rect.fromLTWH(
        selectedLeftOffset,
        size.height / 3.5,
        startWidth * 4,
        size.height * 0.4,
      ),
    );

    backgroundPath.close();

    canvas.drawPath(backgroundPath, backgroundPaint);
    canvas.drawPath(underscorePath, underscorePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
