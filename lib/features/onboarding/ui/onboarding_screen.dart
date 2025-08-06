import 'package:advancedfluttercourse/core/theme/styles.dart';
import 'package:advancedfluttercourse/features/onboarding/ui/widgets/doc_logo_and_name.dart';
import 'package:advancedfluttercourse/features/onboarding/ui/widgets/doctor_image_and_text.dart';
import 'package:advancedfluttercourse/features/onboarding/ui/widgets/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            child: Column(
              children: [
                const DocLogoAndName(),
                SizedBox(height: 30.h),

                const DoctorImageAndText(),
                SizedBox(height: 30.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(
                    children: [
                      Text(
                        'Manage and Schedule all of your medical Appointments easily with Docdoc to get a new experience.',
                        style: TextStyles.font12GrayRegular,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.h),
                      const GetStartedButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
