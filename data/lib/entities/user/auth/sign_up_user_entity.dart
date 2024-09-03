class SignUpUserEntity {
  final String login;
  final String password;
  final String name;

  SignUpUserEntity({
    required this.name,
    required this.login,
    required this.password,
  });

  const SignUpUserEntity.empty()
      : name = '',
        login = '',
        password = '';
}
