import 'package:advancedfluttercourse/core/routing/routes.dart';
import 'package:advancedfluttercourse/core/theme/colors.dart';
import 'package:advancedfluttercourse/core/theme/styles.dart';
import 'package:advancedfluttercourse/features/login/logic/cubit/login_cubit.dart';
import 'package:advancedfluttercourse/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,

              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.mainBlue,
                  ),
                );
              },
            );
          },
          success: (loginResponse) {
            context.go(Routes.homeScreen);
          },
          error: (errorMessage) {
            setUpErrorState(context, errorMessage);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setUpErrorState(BuildContext context, String errorMessage) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Error: $errorMessage', style: TextStyles.font14DarkBlueMedium),
          icon: const Icon(Icons.error, color: ColorsManager.red),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('Got it'),
            ),
          ],
        );
      },
    );
  }
}
