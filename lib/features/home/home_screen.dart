import 'package:advancedfluttercourse/core/theme/colors.dart';
import 'package:advancedfluttercourse/features/home/widgets/doctors_blue_container.dart';
import 'package:advancedfluttercourse/features/home/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 16, 20, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const HomeTopBar(),
               const DoctorsBlueContainer(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
