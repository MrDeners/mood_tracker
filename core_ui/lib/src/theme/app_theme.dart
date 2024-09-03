part of core_ui;

final ThemeData darkTheme = _buildThemeData(
  base: ThemeData.dark().copyWith(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      selectedLabelStyle: AppFonts.subText3Regular.copyWith(color: AppColors.black),
      unselectedLabelStyle: AppFonts.subText3Regular.copyWith(
        color: AppColors.black.withOpacity(0.54),
      ),
    ),
    extensions: <ThemeExtension<AppColorsTheme>>[
      const DarkColorsTheme(),
    ],
  ),
);

// TODO(Maliush): fix bugs, via navigationBottomBar not work
final ThemeData lightTheme = _buildThemeData(
  base: ThemeData.light().copyWith(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      selectedLabelStyle: AppFonts.subText3Regular.copyWith(color: AppColors.black),
      unselectedLabelStyle: AppFonts.subText3Regular.copyWith(
        color: AppColors.black.withOpacity(0.54),
      ),
    ),
    extensions: <ThemeExtension<AppColorsTheme>>[
      const LightColorsTheme(),
    ],
  ),
);

ThemeData _buildThemeData({
  required ThemeData base,
}) {
  final AppColorsTheme colors = base.colors;

  return base.copyWith(
    scaffoldBackgroundColor: colors.whiteBackground,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colors.accent,
    ),
    textTheme: _getTextTheme(colors),
    inputDecorationTheme: _getInputDecorationTheme(colors),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: colors.whiteBackground,
      secondary: colors.accent,
    ),
  );
}

TextTheme _getTextTheme(AppColorsTheme colors) {
  return const TextTheme(
    bodySmall: AppFonts.subText3Regular,
  ).apply(
    bodyColor: colors.primaryText,
  );
}

InputDecorationTheme _getInputDecorationTheme(AppColorsTheme colors) {
  return InputDecorationTheme(
    fillColor: colors.textInputBackground,
    focusColor: colors.textInputBackground,
    filled: true,
    contentPadding: const EdgeInsets.all(AppDimens.contentPadding16),
    hintStyle: AppFonts.subText2Regular.copyWith(
      color: colors.hintText,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.textInputBorderRadius),
      ),
      borderSide: BorderSide(
        color: colors.transparent,
        width: 0,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.textInputBorderRadius),
      ),
      borderSide: BorderSide(
        color: colors.transparent,
        width: 0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.textInputBorderRadius),
      ),
      borderSide: BorderSide(
        color: colors.transparent,
        width: 0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.textInputBorderRadius),
      ),
      borderSide: BorderSide(
        color: colors.accent,
      ),
    ),
    labelStyle: AppFonts.subText2Regular.copyWith(
      color: colors.primaryText,
    ),
  );
}
