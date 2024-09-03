import 'package:domain/domain.dart';

import '../../entities/user/auth/sign_up_user_entity.dart';

class SignUpUserMapper {
  static SignUpUserModel toModel(SignUpUserEntity entity) {
    return SignUpUserModel(
      name: entity.name,
      login: entity.login,
      password: entity.password,
    );
  }

  static SignUpUserEntity toEntity(SignUpUserModel model) {
    return SignUpUserEntity(
      name: model.name,
      login: model.login,
      password: model.password,
    );
  }
}
