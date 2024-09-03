library main_screen;

import 'package:navigation/navigation.dart';

export 'main_screen.gm.dart';
export 'src/ui/main_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Form|Step,Route')
class MainScreenModule extends $MainScreenModule {}
