import 'package:advancedfluttercourse/core/helpers/app_regex.dart';
import 'package:advancedfluttercourse/core/helpers/spacing.dart';
import 'package:advancedfluttercourse/core/helpers/text_validations.dart';
import 'package:advancedfluttercourse/core/theme/colors.dart';
import 'package:advancedfluttercourse/core/widgets/app_text_form_field.dart';
import 'package:advancedfluttercourse/features/signup/ui/widgets/password_validations.dart';
import 'package:advancedfluttercourse/features/signup/logic/cubit/signup_cubit.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isObscureTextPassword = true;
  bool isObscureTextPasswordConfirmation = true;

  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasDigits = false;
  bool hasMinLength = false;
  bool hasSpecialCharacter = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setUpPasswordControllerListener();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasDigits = AppRegex.hasDigits(passwordController.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasMinLength = passwordController.text.length >= 6;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formkey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignupCubit>().nameController,
            hintText: "Name",
            validator: TextValidations.nameValidator,
          ),
          verticalSpacing(20),

          AppTextFormField(
            controller: context.read<SignupCubit>().emailController,
            hintText: "Email",
            validator: TextValidations.emailValidator,
          ),
          verticalSpacing(20),

          AppTextFormField(
            controller: context.read<SignupCubit>().phoneController,
            hintText: "Phone",
            validator: TextValidations.phoneValidator,
          ),
          verticalSpacing(20),

          AppTextFormField(
            controller: passwordController,
            hintText: "Password",
            validator: TextValidations.passwordSignupValidator,
            isObscureText: isObscureTextPassword,
            suffixIcon: gestureDetectorWithVisibilityIcon(
              color: ColorsManager.gray,
              isObscureText: isObscureTextPassword,
              onTap: () => setState(
                () => isObscureTextPassword = !isObscureTextPassword,
              ),
            ),
          ),
          !(TextValidations.passwordSignupValidator(passwordController.text) == null)
              ? PasswordValidations(
                  hasUppercase: hasUppercase,
                  hasLowercase: hasLowercase,
                  hasDigits: hasDigits,
                  hasSpecialCharacters: hasSpecialCharacter,
                  hasMinLength: hasMinLength,
                )
              : SizedBox(height: 0),
          verticalSpacing(20),

          AppTextFormField(
            controller: context
                .read<SignupCubit>()
                .passwordConfirmationController,
            hintText: "Confirm Password",
            validator: TextValidations(
              passwordText: passwordController.text,
            ).passwordConfirmationValidator,
            isObscureText: isObscureTextPasswordConfirmation,
            suffixIcon: gestureDetectorWithVisibilityIcon(
              color: ColorsManager.gray,
              isObscureText: isObscureTextPasswordConfirmation,
              onTap: () => setState(
                () => isObscureTextPasswordConfirmation =
                    !isObscureTextPasswordConfirmation,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget gestureDetectorWithVisibilityIcon({
    required bool isObscureText,
    required VoidCallback onTap,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        isObscureText
            ? FluentSystemIcons.ic_fluent_eye_hide_filled
            : FluentSystemIcons.ic_fluent_eye_show_filled,
        color: color,
      ),
    );
  }
}
