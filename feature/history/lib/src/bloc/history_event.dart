part of 'history_bloc.dart';

abstract class HistoryEvent {
  const HistoryEvent();
}

class DecreaseMonthEvent extends HistoryEvent {
  const DecreaseMonthEvent();
}

class IncreaseMonthEvent extends HistoryEvent {
  const IncreaseMonthEvent();
}

class DeleteNoteEvent extends HistoryEvent {
  final int index;

  const DeleteNoteEvent({
    required this.index,
  });
}

class UpdateNoteListEvent extends HistoryEvent {
  final DateTime time;

  const UpdateNoteListEvent({
    required this.time,
  });
}
