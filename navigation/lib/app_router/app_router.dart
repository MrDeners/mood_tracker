import 'package:auth/auth.dart';
import 'package:auto_route/auto_route.dart';
import 'package:history/history.dart';
import 'package:home/home.dart';
import 'package:main_screen/main_screen.dart';
import 'package:note/note.dart';
import 'package:setting/setting.dart';
import 'package:stats/stats.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  modules: <Type>[
    AuthModule,
    NoteModule,
    MainScreenModule,
    HomeModule,
    StatsModule,
    HistoryModule,
    SettingModule,
  ],
  replaceInRouteName: 'Form,Screen,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: SplashRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: SignInRoute.page,
          path: '/signIn',
        ),
        AutoRoute(
          page: SignUpRoute.page,
          path: '/signUp',
        ),
        AutoRoute(
          page: ChangePasswordRoute.page,
          path: '/changePassword',
        ),
        AutoRoute(
          page: AddNoteRoute.page,
          path: '/addNote',
        ),
        AutoRoute(
          page: MainRoute.page,
          path: '/mainScreen',
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: '/homeScreen',
        ),
        AutoRoute(
          page: StatsRoute.page,
          path: '/statsScreen',
        ),
        AutoRoute(
          page: HistoryRoute.page,
          path: '/historyScreen',
        ),
        AutoRoute(
          page: SettingRoute.page,
          path: '/settingScreen',
        ),
      ];
}
