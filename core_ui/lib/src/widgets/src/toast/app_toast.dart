import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core_ui.dart';

class AppToast extends Fluttertoast {
  static void showToast(ToastType type, String text, BuildContext context) {
    Fluttertoast.showToast(
      msg: text,
      gravity: ToastGravity.TOP,
      backgroundColor: type == ToastType.Success
          ? context.theme.colors.successGreen
          : type == ToastType.Error
              ? context.theme.colors.errorRed
              : context.theme.colors.accent,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
