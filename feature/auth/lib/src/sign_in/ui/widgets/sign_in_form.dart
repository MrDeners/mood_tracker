import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../../../constants/note_constants.dart';
import '../../bloc/sign_in_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (BuildContext context, SignInState state) {
        if (state.toast != null) {
          AppToast.showToast(
            state.toast!.type,
            state.toast!.message,
            context,
          );
        }
      },
      builder: (BuildContext context, SignInState state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Spacer(flex: 15),
            AppSignInputField(
              controller: loginController,
              title: LocaleKeys.authScreen_email.watchTr(context),
              error: context.read<SignInBloc>().state.validationErrors[AuthConstants.emailError],
            ),
            const Spacer(flex: 5),
            AppSignInputField(
              title: LocaleKeys.authScreen_password.watchTr(context),
              error: context.read<SignInBloc>().state.validationErrors[AuthConstants.passwordError],
              isPassword: true,
              controller: passwordController,
            ),
            const Spacer(flex: 2),
            AppButton(
              text: LocaleKeys.authScreen_logIn.watchTr(context),
              onTap: () {
                context.read<SignInBloc>().add(
                      SignIn(
                        email: loginController.text,
                        password: passwordController.text,
                      ),
                    );
              },
            ),
            const Spacer(flex: 15),
            Row(
              children: <Widget>[
                AppButton(
                  text: LocaleKeys.authScreen_createAccount.watchTr(context),
                  onTap: () {
                    context.read<SignInBloc>().add(
                          const NavigateToSignUpEvent(),
                        );
                  },
                ),
                const Spacer(),
                AppButton(
                  text: LocaleKeys.authScreen_forgotPassword.watchTr(context),
                  onTap: () {
                    context.read<SignInBloc>().add(
                          const NavigateToForgotPasswordEvent(),
                        );
                  },
                ),
              ],
            ),
            const Spacer(flex: 30),
          ],
        );
      },
    );
  }
}
