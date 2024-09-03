import 'package:domain/domain.dart';

import '../../entities/user/user_entity.dart';

class UserMapper {
  static UserModel toModel(UserEntity entity) {
    return UserModel(
      name: entity.name,
      email: entity.email,
      password: entity.password,
    );
  }

  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      name: model.name,
      email: model.email,
      password: model.password,
    );
  }
}
