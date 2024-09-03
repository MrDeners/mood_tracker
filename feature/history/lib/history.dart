library history;

import 'package:navigation/navigation.dart';

export 'history.gm.dart';
export 'src/ui/history_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Form|Step,Route')
class HistoryModule extends $HistoryModule {}
