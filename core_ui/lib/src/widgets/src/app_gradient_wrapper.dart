import 'package:flutter/material.dart';

import '../../../core_ui.dart';
import '../../enums/gradient_background_enum.dart';

class AppGradientWrapper extends StatelessWidget {
  final Widget child;
  final GradientBackgroundType gradientType;
  final Color? backgroundColor;

  const AppGradientWrapper({
    this.gradientType = GradientBackgroundType.mainBackground,
    this.backgroundColor,
    required this.child,
    super.key,
  });

  Gradient getGradientColors(AppColorsTheme colors) {
    switch (gradientType) {
      case GradientBackgroundType.mainBackground:
        return colors.mainBackgroundGradient;
      case GradientBackgroundType.bottomSheetBackground:
        return colors.bottomSheetBackgroundGradient;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor ?? context.theme.colors.whiteBackground,
      child: Container(
        decoration: BoxDecoration(
          gradient: getGradientColors(context.theme.colors),
        ),
        child: child,
      ),
    );
  }
}
