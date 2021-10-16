import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:one_on_one_learning/core/core.dart';

class WidgetRadioRowGroup extends StatefulWidget {
  final List<String> data;
  final Function(String value)? onValueChanged;
  const WidgetRadioRowGroup({Key? key, required this.data, this.onValueChanged})
      : super(key: key);

  @override
  _WidgetRadioRowGroupState createState() => _WidgetRadioRowGroupState();
}

class _WidgetRadioRowGroupState extends State<WidgetRadioRowGroup> {
  late String selectedItem;

  @override
  void initState() {
    selectedItem = widget.data.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final String item = widget.data[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedItem = item;
            });
            return widget.onValueChanged?.call(item);
          },
          child: Chip(
            label: Text(
              item,
              style: kFontRegularDefault_12.copyWith(
                  color: item == selectedItem ? Colors.blue : Colors.black54),
            ),
            backgroundColor: item == selectedItem
                ? Colors.blue.shade100
                : Colors.grey.shade100,
          ),
        );
      },
    );
  }
}
