import 'package:advancedfluttercourse/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CircleAvatarDoctorSpecialityItem extends StatelessWidget {
  final String imagePath;
  const CircleAvatarDoctorSpecialityItem({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 28.r,
      backgroundColor: ColorsManager.moreLighterGray,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SvgPicture.asset(imagePath),
      ),
    );
  }
}
