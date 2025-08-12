import 'package:advancedfluttercourse/core/helpers/spacing.dart';
import 'package:advancedfluttercourse/core/theme/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasDigits;
  final bool hasSpecialCharacters;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasUppercase,
    required this.hasLowercase,
    required this.hasDigits,
    required this.hasSpecialCharacters,
    required this.hasMinLength,
  });

  Widget buildValidationItem(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check : Icons.close,
          color: isValid ? Colors.green : Colors.red,
        ),
        horizontalSpacing(8),
        Text(text, style: TextStyles.font10DarkBlueRegular),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List validations = [];
    validations.addAll([
      {'text': 'Contains uppercase letter', 'isValid': hasUppercase},
      {'text': 'Contains lowercase letter', 'isValid': hasLowercase},
      {'text': 'Contains digit', 'isValid': hasDigits},
      {'text': 'Contains special character', 'isValid': hasSpecialCharacters},
      {'text': 'At least 6 characters long', 'isValid': hasMinLength},
    ]);
    validations.sort(
      (a, b) => (a["isValid"] ? 1 : 0).compareTo(b['isValid'] ? 1 : 0),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(validations.length, (index) {
        final validation = validations[index];
        return buildValidationItem(validation['text'], validation['isValid']);
      }),
    );
  }
}
