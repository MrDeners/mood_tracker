library setting;

import 'package:navigation/navigation.dart';

export 'setting.gm.dart';
export 'src/ui/setting_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Form|Step,Route')
class SettingModule extends $SettingModule {}
