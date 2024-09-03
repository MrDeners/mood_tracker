class SignInUserEntity {
  final String login;
  final String password;

  SignInUserEntity({
    required this.login,
    required this.password,
  });

  const SignInUserEntity.empty()
      : login = '',
        password = '';
}
