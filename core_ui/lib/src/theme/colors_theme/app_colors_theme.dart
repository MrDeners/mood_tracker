part of core_ui;

abstract class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  const AppColorsTheme();

  Color get transparent;

  Color get whiteBackground;

  Color get blackBackground;

  Color get accent;

  Color get primaryText;

  Color get secondaryText;

  Color get title;

  Color get link;

  Color get textInputBackground;

  Color get textInputBorder;

  Color get buttonContent;

  Color get hintText;

  Color get successGreen;

  Color get errorRed;

  Color get yellowTip;

  Gradient get mainBackgroundGradient;

  Gradient get shadowBackgroundGradient;

  Gradient get dailyGoalBackgroundGradient;

  Gradient get bottomSheetBackgroundGradient;
}
