import '../../domain.dart';
import 'usecase.dart';

class WriteNoteToDbUseCase implements FutureUseCase<NoteModel, void> {
  final DbRepository _dbRepository;

  const WriteNoteToDbUseCase({
    required DbRepository dbRepository,
  }) : _dbRepository = dbRepository;

  @override
  Future<void> execute(NoteModel note) async {
    await _dbRepository.writeNote(note);
  }
}
