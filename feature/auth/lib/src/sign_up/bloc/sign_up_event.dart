part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {
  const SignUpEvent();
}

class SignUp extends SignUpEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUp({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

class NavigateBackEvent extends SignUpEvent {
  const NavigateBackEvent();
}
