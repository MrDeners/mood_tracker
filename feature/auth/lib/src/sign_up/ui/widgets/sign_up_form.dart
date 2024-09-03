import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../../../constants/note_constants.dart';
import '../../bloc/sign_up_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (BuildContext context, SignUpState state) {
        if (state.toast != null) {
          AppToast.showToast(
            state.toast!.type,
            state.toast!.message,
            context,
          );
        }
      },
      builder: (BuildContext context, SignUpState state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppIcons.backArrow.call(
              onTap: () {
                context.read<SignUpBloc>().add(const NavigateBackEvent());
              },
            ),
            const Spacer(flex: 15),
            AppSignInputField(
              title: LocaleKeys.authScreen_name.watchTr(context),
              error: context.read<SignUpBloc>().state.validationErrors[AuthConstants.nameError],
              controller: nameController,
            ),
            const Spacer(flex: 5),
            AppSignInputField(
              title: LocaleKeys.authScreen_email.watchTr(context),
              error: context.read<SignUpBloc>().state.validationErrors[AuthConstants.emailError],
              controller: emailController,
            ),
            const Spacer(flex: 5),
            AppSignInputField(
              title: LocaleKeys.authScreen_password.watchTr(context),
              error: context.read<SignUpBloc>().state.validationErrors[AuthConstants.passwordError],
              isPassword: true,
              controller: passwordController,
            ),
            const Spacer(flex: 5),
            AppSignInputField(
              title: LocaleKeys.authScreen_confirmPassword.watchTr(context),
              error: context
                  .read<SignUpBloc>()
                  .state
                  .validationErrors[AuthConstants.confirmPasswordError],
              isPassword: true,
              controller: confirmPasswordController,
            ),
            const Spacer(flex: 2),
            Text(
              LocaleKeys.authScreen_availablePasswordSymbols.watchTr(context),
              style: AppFonts.subText1Medium.copyWith(
                color: context.theme.colors.successGreen,
              ),
            ),
            Text(
              LocaleKeys.authScreen_passwordLength.watchTr(context),
              style: AppFonts.subText1Medium.copyWith(
                color: context.theme.colors.successGreen,
              ),
            ),
            Text(
              LocaleKeys.authScreen_passwordLetterCases.watchTr(context),
              style: AppFonts.subText1Medium.copyWith(
                color: context.theme.colors.successGreen,
              ),
            ),
            Text(
              LocaleKeys.authScreen_specialPasswordSymbols.watchTr(context),
              style: AppFonts.subText1Medium.copyWith(
                color: context.theme.colors.successGreen,
              ),
            ),
            const Spacer(flex: 5),
            AppButton(
              text: LocaleKeys.authScreen_signUp.watchTr(context),
              onTap: () {
                context.read<SignUpBloc>().add(
                      SignUp(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        confirmPassword: confirmPasswordController.text,
                      ),
                    );
              },
            ),
            const Spacer(flex: 30),
          ],
        );
      },
    );
  }
}
