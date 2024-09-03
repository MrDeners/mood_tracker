import 'package:flutter/services.dart';

class FormatterConstants {
  static TextInputFormatter allowedSymbols = FilteringTextInputFormatter.allow(
    RegExp(r'^[a-zA-Z0-9.!@#$%^&*()-_+=]+$'),
  );
}
