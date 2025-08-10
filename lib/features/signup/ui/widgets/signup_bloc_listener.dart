import 'package:advancedfluttercourse/core/routing/routes.dart';
import 'package:advancedfluttercourse/core/theme/colors.dart';
import 'package:advancedfluttercourse/core/theme/styles.dart';
import 'package:advancedfluttercourse/features/signup/logic/cubit/signup_cubit.dart';
import 'package:advancedfluttercourse/features/signup/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
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
          backgroundColor: ColorsManager.white,
          content: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Error:\n\n',
                  style: TextStyles.font16WhiteMedium.copyWith(
                    color: ColorsManager.red,
                  ),
                ),
                TextSpan(
                  text: errorMessage,
                  style: TextStyles.font14DarkBlueMedium,
                ),
              ],
            ),
          ),
          icon: const Icon(Icons.error, color: ColorsManager.red, size: 40),
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
