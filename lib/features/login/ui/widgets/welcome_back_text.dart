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
        verticalSpacing(35),

        Text(
          'Welcome Back',
          style: TextStyles.font32BlueBold,
          textAlign: TextAlign.start,
        ),

        verticalSpacing(20),

        Text(
          "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
          style: TextStyles.font14GrayRegular,
        ),
      ],
    );
  }
}
