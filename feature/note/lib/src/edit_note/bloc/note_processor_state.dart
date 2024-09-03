part of 'note_processor_bloc.dart';

@immutable
class NoteProcessorState {
  final MoodType todayMood;
  final List<EmotionModel> emotions;
  final List<int> recentlyEmotionsId;
  final List<int> selectedEmotionsId;
  final List<ReasonModel> reasons;
  final List<int> recentlyReasonsId;
  final List<int> selectedReasonsId;
  final String? comment;
  final int currentPage;

  const NoteProcessorState({
    this.todayMood = MoodType.normalMood,
    this.emotions = const <EmotionModel>[],
    this.recentlyEmotionsId = const <int>[],
    List<int>? selectedEmotionsId,
    this.reasons = const <ReasonModel>[],
    this.recentlyReasonsId = const <int>[],
    List<int>? selectedReasonsId,
    this.comment,
    this.currentPage = 1,
  })  : selectedEmotionsId = selectedEmotionsId ?? const <int>[],
        selectedReasonsId = selectedReasonsId ?? const <int>[];

  NoteProcessorState copyWith({
    int? currentPage,
    MoodType? todayMood,
    List<EmotionModel>? emotions,
    List<int>? recentlyEmotionsId,
    List<int>? selectedEmotionsId,
    List<ReasonModel>? reasons,
    List<int>? recentlyReasonsId,
    List<int>? selectedReasonsId,
    String? comment,
  }) {
    return NoteProcessorState(
      todayMood: todayMood ?? this.todayMood,
      emotions: emotions ?? this.emotions,
      recentlyEmotionsId: recentlyEmotionsId ?? this.recentlyEmotionsId,
      selectedEmotionsId: selectedEmotionsId ?? this.selectedEmotionsId,
      reasons: reasons ?? this.reasons,
      recentlyReasonsId: recentlyReasonsId ?? this.recentlyReasonsId,
      selectedReasonsId: selectedReasonsId ?? this.selectedReasonsId,
      comment: comment ?? this.comment,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
