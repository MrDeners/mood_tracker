import 'package:core/core.dart';
import 'package:navigation/navigation.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppRouter _appRouter;

  HomeBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(
          const HomeState(),
        );
}
