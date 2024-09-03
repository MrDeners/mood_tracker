part of 'change_password_bloc.dart';

@immutable
class ChangePasswordState {
  final String password;
  final String confirmPassword;

  const ChangePasswordState({
    this.password = '',
    this.confirmPassword = '',
  });

  ChangePasswordState copyWith({
    String? password,
    String? confirmPassword,
  }) {
      return ChangePasswordState(
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
      );
  }
}
