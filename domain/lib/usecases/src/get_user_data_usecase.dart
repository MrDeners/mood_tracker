import 'package:core/core.dart';

import '../../domain.dart';
import 'usecase.dart';

class GetUserDataUseCase implements UseCase<NoParams, User?> {
  final UserDataRepository _userDataRepository;

  const GetUserDataUseCase({
    required UserDataRepository userDataRepository,
  }) : _userDataRepository = userDataRepository;

  @override
  User? execute([NoParams? params]) {
    return _userDataRepository.getUserData();
  }
}
