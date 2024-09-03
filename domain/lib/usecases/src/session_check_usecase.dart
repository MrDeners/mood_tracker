import 'package:core/core.dart';

import '../../domain.dart';
import 'usecase.dart';

class SessionCheckUseCase implements UseCase<NoParams, User?> {
  final UserDataRepository _userDataRepository;

  const SessionCheckUseCase({
    required UserDataRepository userDataRepository,
  }) : _userDataRepository = userDataRepository;

  @override
  User? execute([NoParams? params]) {
    return _userDataRepository.getUserData();
  }
}
