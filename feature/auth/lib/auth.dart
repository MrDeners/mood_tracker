library auth;

import 'package:navigation/navigation.dart';

export 'auth.gm.dart';
export 'src/change_password/change_password.dart';
export 'src/sign_in/sign_in.dart';
export 'src/sign_up/sign_up.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Form|Step,Route')
class AuthModule extends $AuthModule {}