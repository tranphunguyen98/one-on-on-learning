import 'package:flutter/material.dart';
import 'package:one_on_one_learning/core/core.dart';
import 'package:one_on_one_learning/core/widgets/widget_rounded_text_field.dart';

class WidgetRoundedTextFieldWithTitle extends StatelessWidget {
  final String title;
  final bool isRequired;
  final String? hint;
  final double? radius;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? textInputType;
  const WidgetRoundedTextFieldWithTitle({
    Key? key,
    required this.title,
    this.hint,
    this.isRequired = false,
    this.radius,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.textInputType,
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
          radius: radius,
          validator: validator,
          controller: controller,
          obscureText: obscureText,
          textInputType: textInputType,
        ),
      ],
    );
  }
}
