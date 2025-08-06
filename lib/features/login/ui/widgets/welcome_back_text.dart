import 'package:advancedfluttercourse/core/helpers/spacing.dart';
import 'package:advancedfluttercourse/core/theme/styles.dart';
import 'package:flutter/material.dart';

class WelcomeBackText extends StatelessWidget {
  const WelcomeBackText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacing(30),

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
      ],
    );
  }
}
