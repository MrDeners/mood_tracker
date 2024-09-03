import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class SplashForm extends StatelessWidget {
  const SplashForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppGradientWrapper(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:AppDimens.contentPadding16),
          child: SizedBox.shrink(),
        ),
      ),
    );
  }
}
