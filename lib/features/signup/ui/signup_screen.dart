import 'package:advancedfluttercourse/core/helpers/spacing.dart';
import 'package:advancedfluttercourse/core/theme/styles.dart';
import 'package:advancedfluttercourse/core/widgets/app_text_button.dart';
import 'package:advancedfluttercourse/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:advancedfluttercourse/features/signup/logic/cubit/signup_cubit.dart';
import 'package:advancedfluttercourse/features/signup/ui/widgets/already_have_an_account.dart';
import 'package:advancedfluttercourse/features/signup/ui/widgets/signup_bloc_listener.dart';
import 'package:advancedfluttercourse/features/signup/ui/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formkey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignUpState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Welcome", style: TextStyles.font24BlueBold),
                verticalSpacing(10),
                Text(
                  "this is smal text blablabla aoihao;ifn ahofihapoihn opianoipfna ha;ioiagoinaognoian",
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpacing(20),

                SignupForm(),
                verticalSpacing(20),

                AppTextButton(
                  buttonWidth: double.infinity,
                  buttonText: 'Login',
                  textStyle: TextStyles.font16WhiteMedium,
                  onPressed: () {
                    validateThenDoSignup(context);
                  },
                ),
                verticalSpacing(16),

                TermsAndConditionsText(),
                verticalSpacing(10),

                AlreadyHaveAnAccountText(),
                SignupBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
