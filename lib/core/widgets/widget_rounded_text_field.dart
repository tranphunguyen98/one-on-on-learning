import 'package:flutter/material.dart';
import 'package:one_on_one_learning/core/core.dart';

class WidgetRoundedTextField extends StatelessWidget {
  final String? hint;
  final String? validator;
  final double? radius;
  const WidgetRoundedTextField(
      {Key? key, this.hint, this.validator, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextFormField(
        style: kFontRegularDefault_14,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(
            horizontal: radius != null ? 16 : 24,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 24),
            ),
            borderSide: BorderSide(
              color: Colors.blueGrey,
              width: 0.25,
            ),
          ),
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
