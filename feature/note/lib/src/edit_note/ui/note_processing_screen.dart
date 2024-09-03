import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/note_processor_bloc.dart';
import 'note_processing_wrapper.dart';

@RoutePage()
class NoteProcessingScreen extends StatelessWidget {
  final NoteModel? note;

  const NoteProcessingScreen({
    super.key,
    this.note,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NoteProcessorBloc>(
      create: (BuildContext context) => NoteProcessorBloc(
        note: note,
        appRouter: appLocator.get<AppRouter>(),
        createTipUseCase: appLocator.get<CreateTipUseCase>(),
        writeNoteToDbUseCase: appLocator.get<WriteNoteToDbUseCase>(),
        getUserDataUseCase: appLocator.get<GetUserDataUseCase>(),
      ),
      child: const Scaffold(
        body: NoteProcessingWrapper(),
      ),
    );
  }
}
