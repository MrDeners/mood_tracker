library stats;

import 'package:navigation/navigation.dart';

export 'src/ui/stats_screen.dart';
export 'stats.gm.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Form|Step,Route')
class StatsModule extends $StatsModule {}
