part of 'sign_in_bloc.dart';

@immutable
class SignInState {
  final String email;
  final String password;
  final ToastModel? toast;
  final Map<String, String?> validationErrors;

  const SignInState({
    this.email = '',
    this.password = '',
    this.toast,
    this.validationErrors = const <String, String?>{
      AuthConstants.emailError: null,
      AuthConstants.passwordError: null,
    },
  });

  SignInState copyWith({
    String? email,
    String? password,
    ToastModel? toast,
    Map<String, String?> validationErrors = const <String, String?>{
      AuthConstants.emailError: null,
      AuthConstants.passwordError: null,
    },
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      toast: toast,
      validationErrors: validationErrors,
    );
  }
}
