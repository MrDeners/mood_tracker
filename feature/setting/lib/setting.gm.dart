// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:setting/src/ui/setting_screen.dart' as _i1;

abstract class $SettingModule extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SettingRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SettingScreen(),
      );
    }
  };
}

/// generated route for
/// [_i1.SettingScreen]
class SettingRoute extends _i2.PageRouteInfo<void> {
  const SettingRoute({List<_i2.PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
