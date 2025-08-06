import 'package:advancedfluttercourse/core/helpers/App_regex.dart';
import 'package:advancedfluttercourse/core/helpers/spacing.dart';
import 'package:advancedfluttercourse/core/theme/colors.dart';
import 'package:advancedfluttercourse/core/widgets/app_text_form_field.dart';
import 'package:advancedfluttercourse/features/login/logic/cubit/login_cubit.dart';
import 'package:advancedfluttercourse/features/login/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}



class _EmailAndPasswordState extends State<EmailAndPassword> {
  late TextEditingController passwordController;
  bool isObscureText = true;
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasDigits = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;



  String? emailValidator(String? value) {
    if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
      return 'Email is required';
    }
    // Add more email validation logic if needed
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty ) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasDigits = AppRegex.hasDigits(passwordController.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasMinLength = passwordController.text.length >= 6;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setUpPasswordControllerListener();
  }

  

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Email",
            validator: emailValidator,
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpacing(20),
          AppTextFormField(
            controller: passwordController,
            validator: passwordValidator,
            hintText: "Password",
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () => setState(() => isObscureText = !isObscureText),
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: ColorsManager.gray,
              ),
            ),
          ),
          PasswordValidations(
            hasUppercase: AppRegex.hasUpperCase(passwordController.text),
            hasLowercase: AppRegex.hasLowerCase(passwordController.text),
            hasDigits: AppRegex.hasDigits(passwordController.text),
            hasSpecialCharacters: AppRegex.hasSpecialCharacter(
              passwordController.text,
            ),
            hasMinLength: passwordController.text.length >= 6,
          ),
        ],
      ),
    );
  }
  
}
