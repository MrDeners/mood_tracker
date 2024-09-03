part of core_ui;

class AppFonts {
  static const String _packageName = kPackageName;
  static const String _fontFamily = 'Pangram';

  static const double lineHeight = 1.5;

  static const double fontSize24 = 24;

  static const double fontSize18 = 18;

  static const double fontSize16 = 16;

  static const double fontSize14 = 14;

  static const double fontSize12 = 12;

  static const TextStyle heading1 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: fontSize24,
    fontFamily: _fontFamily,
    height: lineHeight,
    package: _packageName,
  );

  static const TextStyle heading2 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: fontSize18,
    fontFamily: _fontFamily,
    height: lineHeight,
    package: _packageName,
  );

  static const TextStyle heading3 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: fontSize14,
    fontFamily: _fontFamily,
    height: lineHeight,
    package: _packageName,
  );

  static const TextStyle subText1Regular = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: fontSize16,
    fontFamily: _fontFamily,
    height: lineHeight,
    package: _packageName,
  );

  static const TextStyle subText1Medium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: fontSize16,
    fontFamily: _fontFamily,
    height: lineHeight,
    package: _packageName,
  );

  static const TextStyle subText1Bold = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: fontSize16,
    fontFamily: _fontFamily,
    height: lineHeight,
    package: _packageName,
  );

  static const TextStyle subText2Regular = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: fontSize14,
    fontFamily: _fontFamily,
    height: lineHeight,
    package: _packageName,
  );

  static const TextStyle subText2Medium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: fontSize14,
    fontFamily: _fontFamily,
    height: lineHeight,
    package: _packageName,
  );

  static const TextStyle subText3Regular = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: fontSize12,
    fontFamily: _fontFamily,
    height: lineHeight,
    package: _packageName,
  );
}