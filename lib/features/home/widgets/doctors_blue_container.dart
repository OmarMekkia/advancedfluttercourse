import 'package:advancedfluttercourse/core/helpers/spacing.dart';
import 'package:advancedfluttercourse/core/theme/colors.dart';
import 'package:advancedfluttercourse/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsBlueContainer extends StatelessWidget {
  const DoctorsBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 165,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/home_blue_pattern.png"),
                fit: BoxFit.cover,
              ),

              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Book and\nschedule with\nnearest doctor",
                      style: TextStyles.font18WhiteMeduim,
                      textAlign: TextAlign.start,
                    ),
                    verticalSpacing(16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48.r),
                          ),
                        ),
                        child: Text(
                          "Find Nearby",
                          style: TextStyles.font12BlueRegular,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 8,
            top: 0,
            child: Image.asset("assets/images/home_doctor.png", height: 200.h),
          ),
        ],
      ),
    );
  }
}
