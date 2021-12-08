import 'package:flutter/material.dart';
import 'package:one_on_one_learning/core/widgets/widget_rounded_button.dart';
import 'package:one_on_one_learning/features/teacher_detail/widgets/widget_text_header.dart';

class WidgetChooseDateBottomSheet extends StatelessWidget {
  const WidgetChooseDateBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        WidgetTextHeader(title: 'Hãy chọn ngày của bạn!'),
        SizedBox(height: 16),
        ...List.generate(
          7,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: WidgetRoundedButton(
              text: '2021-10-${24 + index}',
              onPressed: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Đặt lịch học thành công'),
                      content: Text('Chúc mừng bạn đã đặt lịch học thành công'),
                      actions: [
                        OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'))
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
