class SignUpUserModel {
  final String name;
  final String login;
  final String password;

  SignUpUserModel({
    required this.name,
    required this.login,
    required this.password,
  });

  const SignUpUserModel.empty()
      : name = '',
        login = '',
        password = '';
}
