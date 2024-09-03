import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppImage {
  final String iconKey;

  const AppImage(this.iconKey);

  Widget callSquare({
    Color? color,
    double? size,
    BoxFit? fit,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        iconKey,
        package: AppIcons.packageName,
        fit: fit ?? BoxFit.contain,
        height: size,
        width: size,
      ),
    );
  }

  Widget call({
    Color? color,
    double? height,
    double? width,
    BoxFit? fit,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        iconKey,
        package: AppIcons.packageName,
        fit: fit ?? BoxFit.contain,
        height: height,
        width: width,
      ),
    );
  }
}
