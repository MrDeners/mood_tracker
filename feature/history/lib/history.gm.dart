// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:history/src/ui/history_screen.dart' as _i1;

abstract class $HistoryModule extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    HistoryRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HistoryScreen(),
      );
    }
  };
}

/// generated route for
/// [_i1.HistoryScreen]
class HistoryRoute extends _i2.PageRouteInfo<void> {
  const HistoryRoute({List<_i2.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
