import 'package:flutter/material.dart';
import 'package:one_on_one_learning/core/colors.dart';

import '../styles.dart';

class WidgetIconTextColumn extends StatelessWidget {
  final IconData iconData;
  final String text;
  const WidgetIconTextColumn(
      {Key? key, required this.iconData, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 24,
          color: kPrimaryColor,
        ),
        SizedBox(height: 8),
        Text(text, style: kFontRegularPrimary_14),
      ],
    );
  }
}
