import 'dart:async';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

Future<void> mainCommon(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await _setupDI(flavor);
  await dataDI.initDependencies();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      fallbackLocale: AppLocalization.fallbackLocale,
      path: AppLocalization.langsFolderPath,
      child: const App(),
    ),
  );
}

Future<void> _setupDI(Flavor flavor) async {
  appLocator.pushNewScope(
    init: (_) {
      AppDI.initDependencies(flavor);
    },
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      locale: context.locale,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        ...context.localizationDelegates,
      ],
      supportedLocales: context.supportedLocales,
      routerDelegate: appLocator.get<AppRouter>().delegate(),
      routeInformationParser: appLocator.get<AppRouter>().defaultRouteParser(),
      builder: (BuildContext context, Widget? child) {
        return child ?? const SizedBox.shrink();
      },
    );
  }
}
