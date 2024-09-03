import '../../domain.dart';

abstract class AuthRepository {
  Future<void> signUp(SignUpUserModel userModel);

  Future<void> signIn(SignInUserModel userModel);

  Future<void> signOut ();
}