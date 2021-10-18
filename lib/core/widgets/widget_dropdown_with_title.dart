import 'package:flutter/material.dart';
import 'package:one_on_one_learning/core/core.dart';
import 'package:one_on_one_learning/core/widgets/widget_core_dropdown.dart';

class WidgetDropdownWithTitle extends StatelessWidget {
  final String title;
  final List<String> data;
  final String? hint;
  const WidgetDropdownWithTitle(
      {Key? key, required this.title, required this.data, this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kFontRegularDefault_14,
        ),
        SizedBox(height: 8),
        WidgetCoreDropdown(
          data: data,
          hint: hint,
        ),
      ],
    );
  }
}
