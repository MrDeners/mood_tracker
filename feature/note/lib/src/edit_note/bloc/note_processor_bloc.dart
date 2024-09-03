import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

part 'note_processor_event.dart';
part 'note_processor_state.dart';

class NoteProcessorBloc extends Bloc<NoteProcessorEvent, NoteProcessorState> {
  final NoteModel? note;
  final AppRouter _appRouter;
  final CreateTipUseCase _createTipUseCase;
  final WriteNoteToDbUseCase _writeNoteToDbUseCase;
  final GetUserDataUseCase _getUserDataUseCase;

  NoteProcessorBloc({
    this.note,
    required AppRouter appRouter,
    required CreateTipUseCase createTipUseCase,
    required WriteNoteToDbUseCase writeNoteToDbUseCase,
    required GetUserDataUseCase getUserDataUseCase,
  })  : _appRouter = appRouter,
        _createTipUseCase = createTipUseCase,
        _writeNoteToDbUseCase = writeNoteToDbUseCase,
        _getUserDataUseCase = getUserDataUseCase,
        super(
          NoteProcessorState(
            todayMood: note?.todayMood ?? MoodType.normalMood,
            selectedEmotionsId: note?.emotions.map((EmotionModel emotion) => emotion.id).toList(),
            selectedReasonsId: note?.reasons.map((ReasonModel reason) => reason.id).toList(),
            comment: note?.comment,
          ),
        ) {
    on<GoPreviousSteepEvent>(_onPreviousSteep);
    on<CloseEditingEvent>(_onCloseEditing);
    on<GoNextSteepEvent>(_onNextSteep);
    on<SaveNoteEvent>(_onSaveNote);
    on<ClearSelectedEmotionsEvent>(_onClearSelectedEmotions);
    on<ChangeSelectedEmotionsEvent>(_onChangeSelectedEmotions);
    on<ClearSelectedReasonsEvent>(_onClearSelectedReasons);
    on<ChangeSelectedReasonsEvent>(_onChangeSelectedReasons);
    on<ChangeTodayMoodEvent>(_onChangeTodayMood);
  }

  Future<void> _onPreviousSteep(
    GoPreviousSteepEvent event,
    Emitter<NoteProcessorState> emit,
  ) async {
    if (state.currentPage == 1) {
      add(const CloseEditingEvent());
    } else {
      emit(
        state.copyWith(currentPage: state.currentPage - 1),
      );
      await event.goBack();
    }
  }

  Future<void> _onCloseEditing(
    CloseEditingEvent event,
    Emitter<NoteProcessorState> emit,
  ) async {
    await _appRouter.maybePop();
  }

  Future<void> _onNextSteep(
    GoNextSteepEvent event,
    Emitter<NoteProcessorState> emit,
  ) async {
    emit(
      state.copyWith(currentPage: state.currentPage + 1),
    );
    await event.goNext();
  }

  Future<void> _onSaveNote(
    SaveNoteEvent event,
    Emitter<NoteProcessorState> emit,
  ) async {
    final NoteModel tempNote = NoteModel(
      uid: null,
      todayMood: state.todayMood,
      emotions: state.emotions,
      reasons: state.reasons,
      tip: const TipModel.empty(),
      dateOfCreation: DateTime.now(),
    );
    final NoteModel note = tempNote.copyWith(
      uid: _getUserDataUseCase.execute()?.uid,
      tip: _createTipUseCase.execute(tempNote),
    );
    await _writeNoteToDbUseCase.execute(note);

    // TODO(Maliush): transfer recently properties to DB on UserData collection
    emit(
      state.copyWith(
        recentlyEmotionsId: state.selectedEmotionsId,
        recentlyReasonsId: state.selectedReasonsId,
        comment: event.comment,
      ),
    );

    add(const CloseEditingEvent());
  }

  Future<void> _onClearSelectedEmotions(
    ClearSelectedEmotionsEvent event,
    Emitter<NoteProcessorState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedEmotionsId: state.selectedEmotionsId..clear(),
      ),
    );
  }

  Future<void> _onChangeSelectedEmotions(
    ChangeSelectedEmotionsEvent event,
    Emitter<NoteProcessorState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedEmotionsId: event.selectedEmotionsId,
      ),
    );
  }

  Future<void> _onClearSelectedReasons(
    ClearSelectedReasonsEvent event,
    Emitter<NoteProcessorState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedReasonsId: const <int>[],
      ),
    );
  }

  Future<void> _onChangeSelectedReasons(
    ChangeSelectedReasonsEvent event,
    Emitter<NoteProcessorState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedReasonsId: event.selectedReasonsId,
      ),
    );
  }

  Future<void> _onChangeTodayMood(
    ChangeTodayMoodEvent event,
    Emitter<NoteProcessorState> emit,
  ) async {
    emit(
      state.copyWith(
        todayMood: event.todayMood,
      ),
    );
  }
}
