import 'package:flutter/material.dart';

class WidgetRoundedTextField extends StatelessWidget {
  final String? hint;
  final String? validator;
  const WidgetRoundedTextField({Key? key, this.hint, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24),
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
