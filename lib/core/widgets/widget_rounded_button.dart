import 'package:flutter/material.dart';
import 'package:one_on_one_learning/core/core.dart';

class WidgetRoundedButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? overlayColor;
  final double? elevation;
  final Alignment? alignment;
  final IconData? leading;
  final IconData? trailing;

  const WidgetRoundedButton(
      {Key? key,
      required this.text,
      this.backgroundColor,
      this.elevation,
      this.textColor,
      this.overlayColor,
      this.alignment,
      this.leading,
      this.trailing})
      : super(key: key);

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
          elevation: MaterialStateProperty.all<double>(elevation ?? 0),
          backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor ?? kPrimaryColor,
          ),
          overlayColor: MaterialStateProperty.all<Color>(
            overlayColor ?? kWhiteColor,
          ),
          alignment: alignment ?? Alignment.center,
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null) ...[
              Icon(
                leading,
                size: 24,
                color: kBlackColor,
              ),
              SizedBox(width: 8),
            ],
            Text(
              text,
              style:
                  kFontMediumWhite_14.copyWith(color: textColor ?? kWhiteColor),
            ),
            if (trailing != null) ...[
              Spacer(),
              Icon(
                trailing,
                size: 14,
                color: kBlackColor,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
