import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../bloc/change_password_bloc.dart';

class ChangePasswordFormContent extends StatelessWidget {
  const ChangePasswordFormContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppIcons.backArrow.call(
          onTap: () {
            context.read<ChangePasswordBloc>().add(const NavigateBackEvent());
          },
        ),
        const Spacer(flex: 15),
        Text(
          LocaleKeys.authScreen_password.watchTr(context),
          style: AppFonts.heading1.copyWith(
            color: context.theme.colors.primaryText,
          ),
        ),
        const AppSignInputField(),
        const Spacer(),
        Text(
          LocaleKeys.authScreen_confirmPassword.watchTr(context),
          style: AppFonts.heading1.copyWith(
            color: context.theme.colors.primaryText,
          ),
        ),
        const AppSignInputField(isPassword: true),
        const Spacer(flex: 2),
        AppButton(
          text: LocaleKeys.authScreen_changePassword.watchTr(context),
          onTap: () {},
        ),
        const Spacer(flex: 30),
      ],
    );
  }
}
