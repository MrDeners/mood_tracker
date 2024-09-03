import 'package:flutter/material.dart';

import '../../../core_ui.dart';

class AppMoodWidget extends StatelessWidget {
  final MoodType mood;

  const AppMoodWidget({
    super.key,
    required this.mood,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: mood.shadowColor.withOpacity(0.3),
            offset: const Offset(0, 5),
            blurRadius: 5,
          ),
        ],
      ),
      child: mood.image.callSquare(),
    );
  }
}
