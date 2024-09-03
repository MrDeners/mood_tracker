import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataRepositoryImpl implements UserDataRepository {
  @override
  User? getUserData() {
    return FirebaseAuth.instance.currentUser;
  }
}
