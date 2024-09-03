import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/sign_in_bloc.dart';
import 'sign_in_content.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (BuildContext context) => SignInBloc(
        appRouter: appLocator.get<AppRouter>(),
        signInUseCase: appLocator.get<SignInUseCase>(),
      ),
      child: const Scaffold(
        body: SignInContent(),
      ),
    );
  }
}
