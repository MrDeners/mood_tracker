import '../domain.dart';

abstract class DbRepository {
  Future<void> writeNote(NoteModel data);

  Future<List<NoteModel>> getNotesByFilter(
    String field,
    dynamic value,
  );
}
