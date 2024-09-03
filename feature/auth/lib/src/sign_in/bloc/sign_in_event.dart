part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {
  const SignInEvent();
}

class SignIn extends SignInEvent {
  final String email;
  final String password;

  const SignIn({
    required this.email,
    required this.password,
  });
}

class NavigateToSignUpEvent extends SignInEvent {
  const NavigateToSignUpEvent();
}

class NavigateToForgotPasswordEvent extends SignInEvent {
  const NavigateToForgotPasswordEvent();
}
