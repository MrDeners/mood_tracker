import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

import '../../../core_ui.dart';

class AppSignInputField extends StatefulWidget {
  final String? title;
  final String? error;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? textValue;
  final bool isPassword;
  final int? maxLines;

  final int? maxLength;
  final TextAlign textAlign;

  const AppSignInputField({
    this.title,
    this.error,
    this.controller,
    this.textValue,
    this.onChanged,
    this.isPassword = false,
    this.maxLines = 1,
    this.maxLength,
    this.textAlign = TextAlign.center,
    super.key,
  });

  @override
  State<AppSignInputField> createState() => _AppSignInputFieldState();
}

class _AppSignInputFieldState extends State<AppSignInputField> {
  late final TextEditingController _controller;

  late bool isHide;

  @override
  void initState() {
    super.initState();
    widget.isPassword ? isHide = true : isHide = false;

    _controller = widget.controller ?? TextEditingController();

    if (widget.textValue != null) {
      _controller.text = widget.textValue!;
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppFonts.heading2.copyWith(
        color: context.theme.colors.primaryText,
      ),
      decoration: InputDecoration(
        labelText: widget.title,
        labelStyle: AppFonts.subText1Medium.copyWith(
          color: context.theme.colors.primaryText,
        ),
        errorText: widget.error,
        errorStyle: AppFonts.subText1Medium.copyWith(
          color: context.theme.colors.errorRed,
        ),
        suffixIcon: widget.isPassword
            ? Padding(
                padding: const EdgeInsets.only(
                  right: AppDimens.contentPadding16,
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: AppDimens.contentPadding16,
                  ),
                  child: AppImages.hidePassword(
                    height: AppDimens.littleIconSize,
                    onTap: () {
                      setState(() {
                        isHide = !isHide;
                      });
                    },
                  ),
                ),
              )
            : null,
        filled: true,
        fillColor: context.theme.colors.textInputBackground,
      ),
      inputFormatters: <TextInputFormatter>[
        FormatterConstants.allowedSymbols,
      ],
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      textAlign: widget.textAlign,
      cursorColor: context.theme.colors.accent,
      autocorrect: false,
      controller: _controller,
      onChanged: (String value) => widget.onChanged?.call(value),
      obscureText: isHide,
    );
  }
}
