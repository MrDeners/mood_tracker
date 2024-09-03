// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:domain/domain.dart' as _i4;
import 'package:flutter/material.dart' as _i3;
import 'package:note/src/edit_note/ui/note_processing_screen.dart' as _i1;

abstract class $NoteModule extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    AddNoteRoute.name: (routeData) {
      final args = routeData.argsAs<AddNoteRouteArgs>(
          orElse: () => const AddNoteRouteArgs());
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.NoteProcessingScreen(
          key: args.key,
          note: args.note,
        ),
      );
    }
  };
}

/// generated route for
/// [_i1.NoteProcessingScreen]
class AddNoteRoute extends _i2.PageRouteInfo<AddNoteRouteArgs> {
  AddNoteRoute({
    _i3.Key? key,
    _i4.NoteModel? note,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          AddNoteRoute.name,
          args: AddNoteRouteArgs(
            key: key,
            note: note,
          ),
          initialChildren: children,
        );

  static const String name = 'AddNoteRoute';

  static const _i2.PageInfo<AddNoteRouteArgs> page =
      _i2.PageInfo<AddNoteRouteArgs>(name);
}

class AddNoteRouteArgs {
  const AddNoteRouteArgs({
    this.key,
    this.note,
  });

  final _i3.Key? key;

  final _i4.NoteModel? note;

  @override
  String toString() {
    return 'AddNoteRouteArgs{key: $key, note: $note}';
  }
}
