library note;

import 'package:navigation/navigation.dart';

export 'note.gm.dart';
export 'src/edit_note/ui/note_processing_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Form|Step,Route')
class NoteModule extends $NoteModule {}