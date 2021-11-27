import 'package:flutter/material.dart';
import 'package:one_on_one_learning/core/core.dart';

class WidgetRoundedTextField extends StatelessWidget {
  final String? hint;
  final String? Function(String? value)? validator;
  final double? radius;
  final int? minLines;
  final TextEditingController? controller;
  final bool obscureText;

  const WidgetRoundedTextField({
    Key? key,
    this.hint,
    this.validator,
    this.radius,
    this.minLines,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: minLines != null ? 48.0 * minLines! : 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(radius ?? 24),
              ),
              border: Border.all(
                color: Colors.blueGrey,
                width: 0.25,
              )),
        ),
        TextFormField(
          style: kFontRegularDefault_14,
          minLines: obscureText ? 1 : minLines,
          maxLines: obscureText ? 1 : minLines,
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(horizontal: radius != null ? 16 : 24, vertical: 8),
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
          ),
        ),
      ],
    );
  }
}
