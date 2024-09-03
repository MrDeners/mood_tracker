import 'package:core/core.dart';
import 'package:domain/usecases/src/session_check_usecase.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/splash_bloc.dart';
import 'splash_content.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      lazy: false,
      create: (BuildContext context) => SplashBloc(
        appRouter: appLocator.get<AppRouter>(),
        sessionCheckUseCase: appLocator.get<SessionCheckUseCase>(),
      ),
      child: const Scaffold(
        body: SplashContent(),
      ),
    );
  }
}
