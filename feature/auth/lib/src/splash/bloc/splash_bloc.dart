import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecases/src/session_check_usecase.dart';
import 'package:meta/meta.dart';
import 'package:navigation/navigation.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppRouter _appRouter;
  final SessionCheckUseCase _sessionCheckUseCase;

  SplashBloc({
    required AppRouter appRouter,
    required SessionCheckUseCase sessionCheckUseCase,
  })  : _appRouter = appRouter,
        _sessionCheckUseCase = sessionCheckUseCase,
        super(SplashInitial()) {
    on<NavigateLogInEvent>(_onNavigateLogIn);
    on<NavigateMainEvent>(_onNavigateMain);
    on<SessionCheckEvent>(_onSessionCheck);

    add(const SessionCheckEvent());
  }

  Future<void> _onNavigateLogIn(
    NavigateLogInEvent event,
    Emitter<SplashState> emit,
  ) async {
    await _appRouter.replaceAll(<PageRouteInfo>[const SignInRoute()]);
  }

  Future<void> _onNavigateMain(
    NavigateMainEvent event,
    Emitter<SplashState> emit,
  ) async {
    await _appRouter.replaceAll(<PageRouteInfo>[const MainRoute()]);
  }

  Future<void> _onSessionCheck(
    SessionCheckEvent event,
    Emitter<SplashState> emit,
  ) async {
    final User? user = _sessionCheckUseCase.execute();
    user == null ? add(const NavigateLogInEvent()) : add(const NavigateMainEvent());
  }
}
