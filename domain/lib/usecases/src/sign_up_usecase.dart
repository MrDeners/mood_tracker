import '../../domain.dart';
import 'usecase.dart';

class SignUpUseCase implements FutureUseCase<SignUpUserModel, void> {
  final AuthRepository _authRepository;

  const SignUpUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(SignUpUserModel userModel) async {
    await _authRepository.signUp(userModel);
  }
}
