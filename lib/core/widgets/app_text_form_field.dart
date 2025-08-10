import 'package:advancedfluttercourse/core/theme/colors.dart';
import 'package:advancedfluttercourse/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final bool? isObscureText;
  final TextStyle? textInputStyle;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final Color? fillColor;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
    this.isObscureText,
    this.textInputStyle,
    this.hintStyle,
    this.contentPadding,
    this.suffixIcon,
    this.fillColor,
    this.enabledBorder,
    this.focusedBorder,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapUpOutside: (_) {FocusManager.instance.primaryFocus?.unfocus();},
      keyboardType: TextInputType.text, // controls keyboard type

      controller: controller,
      enabled: true,
      obscureText: isObscureText ?? false,
      style: textInputStyle ?? TextStyles.font14DarkBlueMedium,
      validator: (value) => validator(value),

      decoration: InputDecoration(
        filled: true,
        isDense: true,
        hintText: hintText,
        suffixIcon: suffixIcon,

        hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
        fillColor: fillColor ?? ColorsManager.moreLighterGray,

        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),

        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(
                color: ColorsManager.lighterGray,
                width: 1.3,
              ),
            ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(
                color: ColorsManager.mainBlue,
                width: 1.3,
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: ColorsManager.red, width: 1.3),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: ColorsManager.red, width: 1.3),
        ),
      ),
    );
  }
}
