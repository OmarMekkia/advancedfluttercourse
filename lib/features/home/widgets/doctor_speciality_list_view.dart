import 'package:advancedfluttercourse/core/helpers/spacing.dart';
import 'package:advancedfluttercourse/core/theme/styles.dart';
import 'package:advancedfluttercourse/features/home/widgets/circle_avatar_doctor_speciality_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListView extends StatelessWidget {
  final List<String> specialityList = const [
    "General",
    "Neurologic",
    "Pediatric",
    "Radiology",
    "General",
    "Neurologic",
    "Pediatric",
    "Radiology",
  ];

  final List<String> specialtyIcons = const [
    "assets/svgs/general_speciality.svg",
    "assets/svgs/general_speciality.svg",
    "assets/svgs/general_speciality.svg",
    "assets/svgs/general_speciality.svg",
    "assets/svgs/general_speciality.svg",
    "assets/svgs/general_speciality.svg",
    "assets/svgs/general_speciality.svg",
    "assets/svgs/general_speciality.svg",
  ];

  const DoctorSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: specialityList.length,
        separatorBuilder: (context, index) => horizontalSpacing(24),
        itemBuilder: (context, index) {
          final iconPath = specialtyIcons[index];

          return Column(
            children: [
              CircleAvatarDoctorSpecialityItem(imagePath: iconPath),
              verticalSpacing(8),
              Text(
                specialityList[index],
                style: TextStyles.font12darkBlueRegular,
              ),
            ],
          );
        },
      ),
    );
  }
}
