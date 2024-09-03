import 'package:core/core.dart';
import 'package:navigation/navigation.dart';

part 'stats_event.dart';
part 'stats_state.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  final AppRouter _appRouter;

  StatsBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(
          const StatsState(),
        );
}
