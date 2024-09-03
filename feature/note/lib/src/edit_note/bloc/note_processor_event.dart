part of 'note_processor_bloc.dart';

@immutable
abstract class NoteProcessorEvent {
  const NoteProcessorEvent();
}

class GoPreviousSteepEvent extends NoteProcessorEvent {
  final Future<void> Function() goBack;

  const GoPreviousSteepEvent({
    required this.goBack,
  });
}

class CloseEditingEvent extends NoteProcessorEvent {
  const CloseEditingEvent();
}

class GoNextSteepEvent extends NoteProcessorEvent {
  final Function() goNext;

  const GoNextSteepEvent({
    required this.goNext,
  });
}

class SaveNoteEvent extends NoteProcessorEvent {
  final String comment;

  const SaveNoteEvent({
    required this.comment,
  });
}

class ClearSelectedEmotionsEvent extends NoteProcessorEvent {
  const ClearSelectedEmotionsEvent();
}

class ChangeSelectedEmotionsEvent extends NoteProcessorEvent {
  final List<int> selectedEmotionsId;

  const ChangeSelectedEmotionsEvent({
    required this.selectedEmotionsId,
  });
}

class ClearSelectedReasonsEvent extends NoteProcessorEvent {
  const ClearSelectedReasonsEvent();
}

class ChangeSelectedReasonsEvent extends NoteProcessorEvent {
  final List<int> selectedReasonsId;

  const ChangeSelectedReasonsEvent({
    required this.selectedReasonsId,
  });
}

class ChangeTodayMoodEvent extends NoteProcessorEvent {
  final MoodType todayMood;

  const ChangeTodayMoodEvent({
    required this.todayMood,
  });
}
