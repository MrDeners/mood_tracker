part of 'history_bloc.dart';

class HistoryState {
  final DateTime date;
  final List<NoteModel>? notes;

  const HistoryState({
    required this.date,
    this.notes,
  });

  HistoryState copyWith({
    DateTime? date,
    List<NoteModel>? notes,
  }) {
    return HistoryState(
      date: date ?? this.date,
      notes: notes ?? this.notes,
    );
  }
}
