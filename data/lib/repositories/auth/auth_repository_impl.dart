import 'package:domain/domain.dart';

import '../../mapper/user/sign_in_user_mapper.dart';
import '../../mapper/user/sign_up_user_mapper.dart';
import '../../providers/firebase_auth_provider.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthProvider _authApiProvider;

  const AuthRepositoryImpl({
    required FirebaseAuthProvider authApiProvider,
  }) : _authApiProvider = authApiProvider;

  @override
  Future<void> signOut() async {
    await _authApiProvider.signOut();
  }

  @override
  Future<void> signIn(SignInUserModel userModel) async {
    await _authApiProvider.signIn(SignInUserMapper.toEntity(userModel));
  }

  @override
  Future<void> signUp(SignUpUserModel userModel) async {
    await _authApiProvider.signUp(SignUpUserMapper.toEntity(userModel));
  }
}
