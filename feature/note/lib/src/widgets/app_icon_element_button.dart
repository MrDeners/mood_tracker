import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppIconElementButton extends StatelessWidget {
  final String text;
  final Color? textColor;

  final AppIcon icon;
  final Function()? onTap;
  final bool isActive;

  const AppIconElementButton({
    required this.text,
    required this.icon,
    this.textColor,
    this.onTap,
    this.isActive = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Container(
            height: AppDimens.iconButtonHeight,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive
                  ? context.theme.colors.whiteBackground
                  : context.theme.colors.blackBackground.withOpacity(0.04),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.contentPadding16,
              ),
              child: icon.call(
                size: AppDimens.EmotionIconHeight,
              ),
            ),
          ),
          Text(
            text,
            style: AppFonts.subText3Regular.copyWith(
              color: textColor ?? context.theme.colors.primaryText,
            ),
          ),
        ],
      ),
    );
  }
}
