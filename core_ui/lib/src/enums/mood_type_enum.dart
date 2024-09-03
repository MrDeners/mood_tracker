import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../core_ui.dart';

@JsonSerializable()
enum MoodType {
  theWorstMood(
    image: AppImages.poutingFace,
    title: LocaleKeys.note_mood_theWorst,
    shadowColor: AppColors.wrongRed,
  ),
  badMood(
    image: AppImages.sadFace,
    title: LocaleKeys.note_mood_bad,
    shadowColor: AppColors.spanishYellow,
  ),
  normalMood(
    image: AppImages.neutralFace,
    title: LocaleKeys.note_mood_normal,
    shadowColor: AppColors.spanishYellow,
  ),
  goodMood(
    image: AppImages.happyFace,
    title: LocaleKeys.note_mood_good,
    shadowColor: AppColors.spanishYellow,
  ),
  theBestMood(
    image: AppImages.lovedFace,
    title: LocaleKeys.note_mood_theBest,
    shadowColor: AppColors.spanishYellow,
  );

  final AppImage image;
  final String title;
  final Color shadowColor;

  const MoodType({
    required this.image,
    required this.title,
    required this.shadowColor,
  });
}
