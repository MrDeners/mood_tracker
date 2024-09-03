import 'package:core/core.dart';

import '../entities/user/auth/auth_entities.dart';
import 'firebase_safe_request.dart';

class FirebaseAuthProvider {
  Future<void> signUp(SignUpUserEntity userModel) async {
    await SafeRequestService.firebaseSafeRequest(
      () => FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.login,
        password: userModel.password,
      ),
    );
  }

  Future<void> signIn(SignInUserEntity userModel) async {
    await SafeRequestService.firebaseSafeRequest(
      () => FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userModel.login,
        password: userModel.password,
      ),
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
