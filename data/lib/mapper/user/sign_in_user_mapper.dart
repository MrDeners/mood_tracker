import 'package:domain/domain.dart';

import '../../entities/user/auth/sign_in_user_entity.dart';

class SignInUserMapper {
  static SignInUserModel toModel(SignInUserEntity entity) {
    return SignInUserModel(
      login: entity.login,
      password: entity.password,
    );
  }

  static SignInUserEntity toEntity(SignInUserModel model) {
    return SignInUserEntity(
      login: model.login,
      password: model.password,
    );
  }
}
