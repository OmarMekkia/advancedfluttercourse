import 'package:advancedfluttercourse/core/theme/colors.dart';
import 'package:advancedfluttercourse/core/theme/styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorsManager.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text("Hi Omar!",style: TextStyles.font18DarkBlueBold,),
            Text("How Are You Today?",style: TextStyles.font11darkGrayRegular,),

          ],
        ),
      ),
    );
  }
}