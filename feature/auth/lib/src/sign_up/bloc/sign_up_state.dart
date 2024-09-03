part of 'sign_up_bloc.dart';

@immutable
class SignUpState {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final ToastModel? toast;
  final Map<String, String?> validationErrors;

  const SignUpState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.toast,
    this.validationErrors = const <String, String?>{
      AuthConstants.nameError: null,
      AuthConstants.emailError: null,
      AuthConstants.passwordError: null,
      AuthConstants.confirmPasswordError: null,
    },
  });

  SignUpState copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    ToastModel? toast,
    Map<String, String?> validationErrors = const <String, String?>{
      'nameError': null,
      'emailError': null,
      'passwordError': null,
      'confirmPasswordError': null,
    },
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      toast: toast,
      validationErrors: validationErrors,
    );
  }
}
