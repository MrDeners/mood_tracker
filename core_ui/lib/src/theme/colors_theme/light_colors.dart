import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class LightColorsTheme extends AppColorsTheme {
  const LightColorsTheme();

  @override
  Color get transparent => AppColors.transparent;

  @override
  Color get whiteBackground => AppColors.white;

  @override
  Color get blackBackground => AppColors.black;

  @override
  Color get accent => AppColors.lavenderIndigo;

  @override
  Color get primaryText => AppColors.chineseBlack;

  @override
  Color get secondaryText => AppColors.chineseBlack74;

  @override
  Color get hintText => AppColors.chineseBlack64;

  @override
  Color get title => AppColors.chineseBlack;

  @override
  Color get link => AppColors.lavenderIndigo;

  @override
  Color get textInputBackground => AppColors.white;

  @override
  Color get textInputBorder => AppColors.paleLavender;

  @override
  Color get buttonContent => AppColors.white;

  @override
  Color get successGreen => AppColors.successGreen;

  @override
  Color get errorRed => AppColors.wrongRed;

  @override
  Color get yellowTip => AppColors.spanishYellow;

  @override
  Gradient get bottomSheetBackgroundGradient => const LinearGradient(
        colors: AppColors.alertBackgroundGradient,
        begin: FractionalOffset(0, -0.8),
        end: FractionalOffset.bottomLeft,
        stops: <double>[0, 0.65, 1],
      );

  @override
  Gradient get mainBackgroundGradient => const LinearGradient(
        colors: AppColors.mainBackgroundGradient,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  @override
  Gradient get shadowBackgroundGradient => const LinearGradient(
        colors: AppColors.shadowBackgroundGradient,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: <double>[0, 0.24, 0, 6, 1],
      );

  @override
  Gradient get dailyGoalBackgroundGradient => const LinearGradient(
        colors: AppColors.dailyGoalBackgroundGradient,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  @override
  ThemeExtension<AppColorsTheme> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
    covariant ThemeExtension<AppColorsTheme>? other,
    double t,
  ) {
    return this;
  }
}
