import 'package:flutter/material.dart';
import 'package:one_on_one_learning/core/colors.dart';
import 'package:one_on_one_learning/core/widgets/widget_rounded_button.dart';

class WidgetSettingButton extends StatelessWidget {
  final String text;
  final IconData leading;
  final VoidCallback? onPressed;

  const WidgetSettingButton({
    Key? key,
    required this.text,
    required this.leading,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetRoundedButton(
      onPressed: onPressed,
      text: text,
      elevation: 4,
      backgroundColor: kWhiteColor,
      textColor: kBlackColor,
      overlayColor: Colors.grey.shade200,
      alignment: Alignment.centerLeft,
      leading: leading,
      trailing: Icons.arrow_forward_ios_outlined,
    );
  }
}
