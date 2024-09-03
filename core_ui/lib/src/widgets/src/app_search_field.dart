import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppSearchField extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? textValue;
  final String? hintText;

  const AppSearchField({
    this.controller,
    this.textValue,
    this.onChanged,
    this.hintText,
    super.key,
  });

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

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
    return Container(
      height: AppDimens.textInputSize,
      decoration: BoxDecoration(
        color: context.theme.colors.textInputBackground,
        borderRadius: BorderRadius.circular(
          AppDimens.textInputBorderRadius,
        ),
      ),
      child: Stack(
        children: <Widget>[
          TextField(
            style: AppFonts.heading2.copyWith(
              color: context.theme.colors.primaryText,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText ?? LocaleKeys.general_search.watchTr(context),
              contentPadding: const EdgeInsets.only(left: 50, bottom: 50),
            ),
            cursorColor: context.theme.colors.primaryText,
            autocorrect: false,
            textCapitalization: TextCapitalization.sentences,
            controller: _controller,
            onChanged: widget.onChanged,
          ),
          Positioned(
            left: AppDimens.contentPadding16,
            bottom: AppDimens.contentPadding14,
            child: AppIcons.search.call(size: AppDimens.searchFieldIconSize),
          ),
        ],
      ),
    );
  }
}
