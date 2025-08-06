import 'package:advancedfluttercourse/core/theme/styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "By logging in, you agree to our",
            style: TextStyles.font13GrayRegular,
          ),
          TextSpan(
            text: " Terms & Conditions ",
            style: TextStyles.font13DarkBlueMedium,
          ),
          TextSpan(text: " and", style: TextStyles.font13GrayRegular),
          TextSpan(
            text: " privacy policy.",
            style: TextStyles.font13DarkBlueMedium,
          ),
        ],
      ),
    );
  }
}
