import '../../domain.dart';
import 'usecase.dart';

class SignInUseCase implements FutureUseCase<SignInUserModel, void> {
  final AuthRepository _authRepository;

  const SignInUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(SignInUserModel userModel) async {
      await _authRepository.signIn(userModel);
  }
}
