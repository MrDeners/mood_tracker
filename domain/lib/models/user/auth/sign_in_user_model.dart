class SignInUserModel {
  final String login;
  final String password;

  SignInUserModel({
    required this.login,
    required this.password,
  });

  const SignInUserModel.empty()
      : login = '',
        password = '';
}
