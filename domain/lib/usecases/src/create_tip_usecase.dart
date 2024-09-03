import '../../domain.dart';
import 'usecase.dart';

class CreateTipUseCase implements UseCase<NoteModel, TipModel?> {
  final TipServiceRepository _tipServiceRepository;

  const CreateTipUseCase({
    required TipServiceRepository tipServiceRepository,
  }) : _tipServiceRepository = tipServiceRepository;

  @override
  TipModel? execute(NoteModel note) {
    return _tipServiceRepository.createTip(note);
  }
}
