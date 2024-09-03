import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/history_bloc.dart';
import 'widgets/widgets.dart';

@RoutePage()
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryBloc>(
      create: (BuildContext context) => HistoryBloc(
        appRouter: appLocator.get<AppRouter>(),
      ),
      child: const Scaffold(
        body: HistoryScreenContent(),
      ),
    );
  }
}
