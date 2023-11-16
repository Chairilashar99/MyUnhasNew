import 'package:flutter/material.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';

class PersonalDataField extends StatelessWidget {
  final String label;
  final String? value;

  const PersonalDataField({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: kTextTheme.bodySmall?.copyWith(
            color: Palette.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(value ?? 'none'),
      ],
    );
  }
}
