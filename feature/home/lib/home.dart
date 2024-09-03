library home;

import 'package:navigation/navigation.dart';

export 'home.gm.dart';
export 'src/ui/home_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Form|Step,Route')
class HomeModule extends $HomeModule {}
