import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:navigation/app_router/app_router.dart';

part 'change_password_event.dart';

part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final AppRouter _appRouter;

  ChangePasswordBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(const ChangePasswordState()) {
    on<ChangePasswordEvent>(_onChangePassword);
    on<NavigateBackEvent>(_onNavigateBack);
  }

  Future<void> _onChangePassword(
    ChangePasswordEvent event,
    Emitter<ChangePasswordState> emit,
  ) async {}

  Future<void> _onNavigateBack(
    NavigateBackEvent event,
    Emitter<ChangePasswordState> emit,
  ) async {
    await _appRouter.maybePop();
  }
}
