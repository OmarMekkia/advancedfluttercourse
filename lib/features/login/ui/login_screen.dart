import 'package:advancedfluttercourse/core/helpers/spacing.dart';
import 'package:advancedfluttercourse/core/theming/colors.dart';
import 'package:advancedfluttercourse/core/theming/styles.dart';
import 'package:advancedfluttercourse/core/widgets/app_text_button.dart';
import 'package:advancedfluttercourse/core/widgets/app_text_form_field.dart';
import 'package:advancedfluttercourse/features/login/ui/widgets/already_have_an_account_text.dart';
import 'package:advancedfluttercourse/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

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
                Text(
                  'Welcome Back',
                  style: TextStyles.font24BlueBold,
                  textAlign: TextAlign.start,
                ),
                verticalSpacing(8),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpacing(30),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(hintText: "Email"),
                      verticalSpacing(20),
                      AppTextFormField(
                        hintText: "Password",
                        isObscureText: isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () =>
                              setState(() => isObscureText = !isObscureText),
                          child: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: ColorsManager.gray,
                          ),
                        ),
                      ),
                      verticalSpacing(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyles.font13Blueregular,
                        ),
                      ),
                      verticalSpacing(40),
                      SizedBox(
                        width: double.infinity,
                        child: AppTextButton(
                          buttonText: 'Login',
                          textStyle: TextStyles.font16WhiteMedium,
                          onPressed: () {},
                        ),
                      ),
                      verticalSpacing(16),
                      TermsAndConditionsText(),
                      verticalSpacing(60),
                      AlreadyHaveAnAccountText(),
                      verticalSpacing(40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
