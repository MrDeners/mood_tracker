import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class SignUpContent extends StatelessWidget {
  const SignUpContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppGradientWrapper(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:AppDimens.contentPadding16),
          child: SignUpForm(),
        ),
      ),
    );
  }
}
