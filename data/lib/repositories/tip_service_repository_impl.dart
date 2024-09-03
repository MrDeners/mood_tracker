import 'package:domain/domain.dart';

class TipServiceRepositoryImpl implements TipServiceRepository {
  @override
  TipModel? createTip(NoteModel note) {
    return const TipModel(
      // TODO(Maliush): Get tips from backend
      title: 'Maybe... Go outside?',
      description: 'You just need to walk on the street, Bro :)',
    );
  }
}
