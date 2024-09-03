import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/enums/gradient_background_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/widgets.dart';

class NoteProcessingWrapper extends StatelessWidget {
  const NoteProcessingWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colors.transparent,
        borderRadius: BorderRadius.circular(AppDimens.formBorderRadius),
      ),
      clipBehavior: Clip.hardEdge,
      child: AppGradientWrapper(
        backgroundColor: context.theme.colors.transparent,
        gradientType: GradientBackgroundType.bottomSheetBackground,
        child: const SafeArea(
          top: false,
          child: NoteProcessingContent(),
        ),
      ),
    );
  }
}
