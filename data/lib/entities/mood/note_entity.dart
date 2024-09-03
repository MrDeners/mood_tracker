import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

import 'emotion_entity.dart';
import 'reason_entity.dart';
import 'tip_entity.dart';

@JsonSerializable(explicitToJson: true)
class NoteEntity {
  final String? uid;
  @JsonKey(fromJson: MoodType.fromJson)
  final MoodType todayMood;
  @JsonKey(fromJson: EmotionEntity.fromJson)
  final List<EmotionEntity> emotions;
  @JsonKey(fromJson: ReasonEntity.fromJson)
  final List<ReasonEntity> reasons;
  final String? comment;
  @JsonKey(fromJson: TipEntity.fromJson)
  final TipEntity tip;
  final DateTime dateOfCreation;

  const NoteEntity({
    required this.uid,
    required this.todayMood,
    required this.emotions,
    required this.reasons,
    this.comment,
    required this.dateOfCreation,
    required this.tip,
  });

  NoteEntity.empty()
      : uid = null,
        todayMood = MoodType.normalMood,
        emotions = const <EmotionEntity>[],
        reasons = const <ReasonEntity>[],
        comment = '',
        dateOfCreation = DateTime.now(),
        tip = const TipEntity.empty();

  NoteEntity copyWith({
    String? uid,
    MoodType? todayMood,
    List<EmotionEntity>? emotions,
    List<ReasonEntity>? reasons,
    String? comment,
    TipEntity? tip,
    DateTime? dateOfCreation,
  }) {
    return NoteEntity(
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
