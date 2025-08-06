import 'package:advancedfluttercourse/core/helpers/spacing.dart';
import 'package:advancedfluttercourse/core/theme/styles.dart';
import 'package:advancedfluttercourse/core/widgets/app_text_button.dart';
import 'package:advancedfluttercourse/features/login/data/models/login_request_body.dart';
import 'package:advancedfluttercourse/features/login/logic/cubit/login_cubit.dart';
import 'package:advancedfluttercourse/features/login/ui/widgets/already_have_an_account_text.dart';
import 'package:advancedfluttercourse/features/login/ui/widgets/email_and_password.dart';
import 'package:advancedfluttercourse/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:advancedfluttercourse/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:advancedfluttercourse/features/login/ui/widgets/welcome_back_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WelcomeBackText(),
                verticalSpacing(30),
                const EmailAndPassword(),

                Column(
                  children: [
                    verticalSpacing(24),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font13Blueregular,
                      ),
                    ),
                    verticalSpacing(40),

                    AppTextButton(
                      buttonWidth: double.infinity,
                      buttonText: 'Login',
                      textStyle: TextStyles.font16WhiteMedium,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpacing(16),

                    TermsAndConditionsText(),
                    verticalSpacing(60),

                    AlreadyHaveAnAccountText(),
                    verticalSpacing(40),
                    LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState(
        LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text,
        ),
      );

    }
  }
}
