import 'package:get_it/get_it.dart';
import 'package:navigation/navigation.dart';
import '../config/app_config.dart';

final AppDI appDI = AppDI();
final GetIt appLocator = GetIt.instance;

class AppDI {
  static void initDependencies(Flavor flavor) {
    appLocator.registerSingleton<AppConfig>(
      AppConfig.fromFlavor(flavor),
    );
    setupNavigationDependencies();
  }
}