import 'package:flutter/material.dart';
import 'package:one_on_one_learning/core/core.dart';
import 'package:one_on_one_learning/core/widgets/widget_rounded_text_field.dart';

class WidgetRoundedTextFieldWithTitle extends StatelessWidget {
  final String title;
  final String? hint;
  final bool isRequired;
  const WidgetRoundedTextFieldWithTitle({
    Key? key,
    required this.title,
    this.hint,
    this.isRequired = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title ${isRequired ? '*' : ''}',
          style: kFontRegularDefault_14,
        ),
        SizedBox(height: 8),
        WidgetRoundedTextField(
          hint: hint,
        ),
      ],
    );
  }
}
