import 'package:domain/domain.dart';

import '../entities/mood/note_entity.dart';
import '../mapper/db_mapper.dart';
import '../providers/firebase_db_provider.dart';

class DbRepositoryImpl implements DbRepository {
  static const String notesKey = 'notes';
  final FirebaseDbProvider _dbProvider;

  const DbRepositoryImpl({
    required FirebaseDbProvider dbProvider,
  }) : _dbProvider = dbProvider;

  @override
  Future<void> writeNote(NoteModel data) async {
    await _dbProvider.write(
      notesKey,
      DbMapper.noteToMap(data),
    );
  }

  @override
  Future<List<NoteModel>> getNotesByFilter(String field, dynamic value) async {
    return _dbProvider.getByFilter(notesKey, field, value).map((e) => NoteEntity.fromMap(e));
    ;
  }
}
