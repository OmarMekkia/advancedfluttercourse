import 'package:advancedfluttercourse/core/theme/styles.dart';
import 'package:flutter/material.dart';

class TitleSeeAll extends StatelessWidget {
  final String title;
  final VoidCallback seeAllonPressed;
  const TitleSeeAll({
    super.key,
    required this.title,
    required this.seeAllonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: TextStyles.font18DarkBlueSemiBold),
        TextButton(
          onPressed: seeAllonPressed,
          child: Text("See All", style: TextStyles.font12BlueRegular),
        ),
      ],
    );
  }
}
