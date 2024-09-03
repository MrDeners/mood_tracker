import 'package:core/core.dart';
import 'package:domain/models/mood/note_model.dart';
import 'package:navigation/navigation.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final AppRouter _appRouter;
  final AppRouter _appRouter;

  HistoryBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(
        HistoryState(
          date: DateTime.now(),
        ),
      ) {
    on<DecreaseMonthEvent>(_onDecreaseMonth);
    on<IncreaseMonthEvent>(_onIncreaseMonth);
    on<DeleteNoteEvent>(_onDeleteNote);
    on<UpdateNoteListEvent>(_onUpdateNoteList);
  }

  void _onDecreaseMonth(DecreaseMonthEvent event,
      Emitter<HistoryState> emit,) {
    emit(
      state.copyWith(
        date: DateTime(state.date.year, state.date.month - 1, state.date.day),
      ),
    );
  }

  void _onIncreaseMonth(IncreaseMonthEvent event,
      Emitter<HistoryState> emit,) {
    emit(
      state.copyWith(
        date: DateTime(state.date.year, state.date.month + 1, state.date.day),
      ),
    );
  }

  void _onDeleteNote(DeleteNoteEvent event,
      Emitter<HistoryState> emit,) {
    emit(
      state.copyWith(
        notes: state.notes?..removeAt(event.index),
      ),
    );
  }

  void _onUpdateNoteList(DeleteNoteEvent event,
      Emitter<HistoryState> emit,) {
    final List<NoteModel>? notes =;
    emit(
      state.copyWith(
        notes: state.notes?..removeAt(event.index),
      ),
    );
  }
}
