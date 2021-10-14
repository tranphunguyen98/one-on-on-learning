import 'package:flutter/material.dart';
import 'package:one_on_one_learning/core/core.dart';

class WidgetRoundedButton extends StatelessWidget {
  final String text;
  const WidgetRoundedButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(21.0),
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: kFontMediumWhite_14,
        ),
      ),
    );
  }
}
