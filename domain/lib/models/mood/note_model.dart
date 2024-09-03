import 'package:core_ui/core_ui.dart';

import '../../domain.dart';

class NoteModel {
  final String? uid;
  final MoodType todayMood;
  final List<EmotionModel> emotions;
  final List<ReasonModel> reasons;
  final String? comment;
  final TipModel tip;
  final DateTime dateOfCreation;

  const NoteModel({
    required this.uid,
    required this.todayMood,
    required this.emotions,
    required this.reasons,
    this.comment,
    required this.dateOfCreation,
    required this.tip,
  });

  NoteModel.empty()
      : uid = null,
        todayMood = MoodType.normalMood,
        emotions = const <EmotionModel>[],
        reasons = const <ReasonModel>[],
        comment = '',
        dateOfCreation = DateTime.now(),
        tip = const TipModel.empty();

  NoteModel copyWith({
    String? uid,
    MoodType? todayMood,
    List<EmotionModel>? emotions,
    List<ReasonModel>? reasons,
    String? comment,
    TipModel? tip,
    DateTime? dateOfCreation,
  }) {
    return NoteModel(
      uid: uid ?? this.uid,
      todayMood: todayMood ?? this.todayMood,
      emotions: emotions ?? this.emotions,
      reasons: reasons ?? this.reasons,
      comment: comment ?? this.comment,
      tip: tip ?? this.tip,
      dateOfCreation: dateOfCreation ?? this.dateOfCreation,
    );
  }
}
