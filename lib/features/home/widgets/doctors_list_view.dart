import 'package:advancedfluttercourse/core/helpers/spacing.dart';
import 'package:advancedfluttercourse/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Container(
                width: 110,
                height: 120,
                margin: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  color: ColorsManager.lightGray,
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              horizontalSpacing(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name"),
                    Text("Degree | 01090909090"),
                    Text("Email@email.com"),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
