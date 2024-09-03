import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/setting_bloc.dart';
import 'widgets/widgets.dart';

@RoutePage()
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingBloc>(
      create: (BuildContext context) => SettingBloc(appRouter: appLocator.get<AppRouter>()),
      child: BlocBuilder<SettingBloc, SettingState>(
        builder: (BuildContext context, SettingState state) {
          return const Scaffold(
            body: SettingScreenContent(),
          );
        },
      ),
    );
  }
}
