import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/change_password_bloc.dart';

import 'change_password_form.dart';

@RoutePage()
class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangePasswordBloc>(
      create: (BuildContext context) => ChangePasswordBloc(
        appRouter: appLocator.get<AppRouter>(),
      ),
      child: const Scaffold(body: ChangePasswordForm()),
    );
  }
}
