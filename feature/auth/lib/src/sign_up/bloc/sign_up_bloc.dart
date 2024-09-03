import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigation/navigation.dart';

import '../../../constants/note_constants.dart';
import '../../../validators/auth_validator.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AppRouter _appRouter;
  final SignUpUseCase _signUpUseCase;

  SignUpBloc({
    required AppRouter appRouter,
    required SignUpUseCase signUpUseCase,
  })  : _appRouter = appRouter,
        _signUpUseCase = signUpUseCase,
        super(const SignUpState()) {
    on<NavigateBackEvent>(_onNavigateBack);
    on<SignUp>(_onSignUp);
  }

  Future<void> _onNavigateBack(
    NavigateBackEvent event,
    Emitter<SignUpState> emit,
  ) async {
    await _appRouter.maybePop();
  }

  Future<void> _onSignUp(
    SignUp event,
    Emitter<SignUpState> emit,
  ) async {
    emit(
      state.copyWith(
        name: event.name,
        email: event.email,
        password: event.password,
        confirmPassword: event.confirmPassword,
        validationErrors: <String, String?>{
          AuthConstants.nameError: AuthValidator.nameValidator(value: event.name),
          AuthConstants.emailError: AuthValidator.emailValidator(value: event.email),
          AuthConstants.passwordError: AuthValidator.passwordValidator(value: event.password),
          AuthConstants.confirmPasswordError: AuthValidator.confirmPasswordValidator(
            password: event.password,
            confirmPassword: event.confirmPassword,
          ),
        },
      ),
    );

    if (state.validationErrors.values.every((String? value) => value == null)) {
      try {
        await _signUpUseCase.execute(
          SignUpUserModel(
            name: state.name,
            login: state.email,
            password: state.password,
          ),
        );
        await _appRouter.replaceAll(<PageRouteInfo>[const MainRoute()]);
        emit(
          state.copyWith(
            toast: ToastModel(message: LocaleKeys.authScreen_logIn.tr(), type: ToastType.Success),
          ),
        );
      } on AppException catch (error) {
        emit(
          state.copyWith(
            toast: ToastModel(message: error.message, type: ToastType.Error),
          ),
        );
      }
    }
  }
}
