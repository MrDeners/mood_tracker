import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../../../constants/note_constants.dart';
import '../../../validators/auth_validator.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AppRouter _appRouter;
  final SignInUseCase _signInUseCase;

  SignInBloc({
    required AppRouter appRouter,
    required SignInUseCase signInUseCase,
  })  : _appRouter = appRouter,
        _signInUseCase = signInUseCase,
        super(const SignInState()) {
    on<SignIn>(_onSignIn);
    on<NavigateToSignUpEvent>(_onSignUp);
    on<NavigateToForgotPasswordEvent>(_onForgotPassword);
  }

  Future<void> _onSignIn(
    SignIn event,
    Emitter<SignInState> emit,
  ) async {
    emit(
      state.copyWith(
        email: event.email,
        password: event.password,
        validationErrors: <String, String?>{
          AuthConstants.emailError: AuthValidator.emailValidator(value: event.email),
          AuthConstants.passwordError: AuthValidator.passwordValidator(value: event.password),
        },
      ),
    );

    if (state.validationErrors.values.every((String? value) => value == null)) {
      try {
        await _signInUseCase.execute(
          SignInUserModel(
            login: state.email,
            password: state.password,
          ),
        );
        await _appRouter.replaceAll(<PageRouteInfo>[const MainRoute()]);
        emit(
          state.copyWith(
            toast: ToastModel(
              message: LocaleKeys.authScreen_successLogIn.tr(),
              type: ToastType.Success,
            ),
          ),
        );
      } on AppException catch (error) {
        emit(
          state.copyWith(
            toast: ToastModel(
              message: error.message,
              type: ToastType.Error,
            ),
          ),
        );
      }
    }
  }

  Future<void> _onSignUp(
    NavigateToSignUpEvent event,
    Emitter<SignInState> emit,
  ) async {
    await _appRouter.push(const SignUpRoute());
  }

  Future<void> _onForgotPassword(
    NavigateToForgotPasswordEvent event,
    Emitter<SignInState> emit,
  ) async {
    await _appRouter.push(const ChangePasswordRoute());
  }
}
