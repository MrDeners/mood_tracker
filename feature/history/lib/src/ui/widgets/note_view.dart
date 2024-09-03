import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class NoteView extends StatelessWidget {
  final NoteModel note;
  final NoteModel? previousNote;

  const NoteView({
    required this.note,
    this.previousNote,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (note.dateOfCreation != previousNote?.dateOfCreation) ...<Widget>[
          Text(
            note.dateOfCreation.getDayNameNumberAndMonth(),
          ),
        ],
        AppNoteCart(
          note: note,
          onDelete: () {},
        ), // TODO(Maliush): Delete card
      ],
    );
  }
}
