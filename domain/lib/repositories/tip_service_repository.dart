import '../../domain.dart';

abstract class TipServiceRepository {
  TipModel? createTip(NoteModel note);
}
