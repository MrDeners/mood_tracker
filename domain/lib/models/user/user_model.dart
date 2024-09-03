class UserModel {
  final String name;
  final String email;
  final String? password;

  UserModel({
    required this.name,
    required this.email,
    this.password,
  });

  const UserModel.empty()
      : name = '',
        email = '',
        password = '';
}
