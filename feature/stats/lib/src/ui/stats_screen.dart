import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/stats_bloc.dart';
import 'widgets/widgets.dart';

@RoutePage()
class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StatsBloc>(
      create: (BuildContext context) => StatsBloc(appRouter: appLocator.get<AppRouter>()),
      child: BlocBuilder<StatsBloc, StatsState>(
        builder: (BuildContext context, StatsState state) {
          return const Scaffold(
            body: StatsScreenContent(),
          );
        },
      ),
    );
  }
}
