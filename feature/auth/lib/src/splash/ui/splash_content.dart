import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppGradientWrapper(
      child: Center(
        child: SizedBox.shrink(),
      ),
    );
  }
}
