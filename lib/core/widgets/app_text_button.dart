import 'package:advancedfluttercourse/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final bool haveBackground;
  final Color? backgroundColor;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? borderRadius;
  final double? buttonWidth;
  final double? buttonHeight;
  final TextStyle textStyle;
  final VoidCallback? onPressed;
  final String buttonText;

  const AppTextButton({
    super.key,
    this.backgroundColor,
    this.verticalPadding,
    this.horizontalPadding,
    this.borderRadius,
    this.buttonWidth,
    this.buttonHeight,
    this.onPressed,
    this.haveBackground = true,
    required this.textStyle,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final btn = TextButton(
      style: TextButton.styleFrom(
        backgroundColor: haveBackground
            ? (backgroundColor ?? ColorsManager.mainBlue)
            : null,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius?.r ?? 16.r),
        ),

        padding: EdgeInsets.symmetric(
          vertical: verticalPadding?.h ?? 12.h,
          horizontal: horizontalPadding?.w ?? 24.w,
        ),
      ),
      onPressed: onPressed,
      child: Text(buttonText, style: textStyle),
    );
    
    if (!haveBackground) {
      return btn;
    }
    return SizedBox(
      width: buttonWidth?.w ?? double.infinity,
      height: buttonHeight?.h ?? 50.h,
      child: btn,
    );
  }
}
