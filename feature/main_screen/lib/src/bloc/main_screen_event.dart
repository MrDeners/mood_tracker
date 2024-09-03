part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenEvent {
  const MainScreenEvent();
}

class ChangeCurrentPageEvent extends MainScreenEvent {
  final int currentPageIndex;

  const ChangeCurrentPageEvent({
    required this.currentPageIndex,
  });
}
