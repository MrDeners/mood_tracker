import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTextElementButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Function()? onTap;
  final Function()? onDelete;
  final bool isActive;
  final bool isShort;

  const AppTextElementButton({
    required this.text,
    this.textColor,
    this.onTap,
    this.onDelete,
    this.isActive = false,
    this.isShort = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.theme.colors;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: isShort ? AppDimens.shortButtonHeight : AppDimens.buttonHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppDimens.buttonBorderRadius,
          ),
          border: Border.all(
            color: isActive ? colors.whiteBackground : colors.hintText,
          ),
          color: isActive ? colors.whiteBackground : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.contentPadding16,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: AppFonts.heading3.copyWith(
                  color: getTextColor(colors),
                ),
                textAlign: TextAlign.center,
              ),
              (onDelete != null) ? AppIcons.close.call(onTap: onDelete) : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Color getTextColor(AppColorsTheme colors) {
    return textColor ?? (isActive ? colors.primaryText : colors.buttonContent);
  }
}
