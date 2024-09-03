import 'package:core/core.dart';
import 'package:flutter/material.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc()
      : super(
          const MainScreenState(),
        ) {
    on<ChangeCurrentPageEvent>(_onChangeCurrentPage);
  }

  Future<void> _onChangeCurrentPage(
    ChangeCurrentPageEvent event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        currentPageIndex: event.currentPageIndex,
      ),
    );
  }
}
