import 'package:advancedfluttercourse/core/helpers/spacing.dart';
import 'package:advancedfluttercourse/core/helpers/text_validations.dart';
import 'package:advancedfluttercourse/core/theme/colors.dart';
import 'package:advancedfluttercourse/core/widgets/app_text_form_field.dart';
import 'package:advancedfluttercourse/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  late TextEditingController passwordController;
  bool isObscureText = true;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Email",
            validator: TextValidations.emailValidator,
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpacing(20),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            validator: TextValidations.passwordLoginValidator,
            hintText: "Password",
            isObscureText: isObscureText,
            suffixIcon: gestureDetectorWithVisibilityIcon(
              onTap: () => setState(() => isObscureText = !isObscureText),
              isObscureText: true,
              color: ColorsManager.gray,
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
