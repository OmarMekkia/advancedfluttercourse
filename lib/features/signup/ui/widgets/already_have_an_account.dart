import 'package:advancedfluttercourse/core/routing/routes.dart';
import 'package:advancedfluttercourse/core/theme/styles.dart';
import 'package:advancedfluttercourse/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Already Have an Account?",
            style: TextStyles.font13DarkBlueRegular,
          ),

          WidgetSpan(
            alignment: PlaceholderAlignment.middle,

            child: AppTextButton(
              textStyle: TextStyles.font13BlueSemiBold,
              buttonText: "Login",
              horizontalPadding: 0,
              verticalPadding: 0,
              haveBackground: false,
              onPressed: () {
                context.go(Routes.loginScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
