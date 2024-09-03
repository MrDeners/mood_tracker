part of 'main_screen_bloc.dart';

@immutable
class MainScreenState {
  final int currentPageIndex;

  const MainScreenState({
    this.currentPageIndex = 0,
  });

  MainScreenState copyWith({
    int? currentPageIndex,
  }) {
    return MainScreenState(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
    );
  }
}
