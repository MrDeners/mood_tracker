import 'package:flutter/material.dart';

class AppLocalization {
  static const String langsFolderPath = 'packages/core/resources/langs';

  static List<Locale> get supportedLocales => <Locale>[_enLocale, _ruLocale];

  static Locale get fallbackLocale => _enLocale;

  static const Locale _enLocale = Locale('en', 'US');
  static const Locale _ruLocale = Locale('ru', 'RU');
}
