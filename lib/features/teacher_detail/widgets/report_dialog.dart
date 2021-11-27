import 'package:flutter/material.dart';
import 'package:one_on_one_learning/core/core.dart';
import 'package:one_on_one_learning/core/widgets/widget_chip.dart';
import 'package:one_on_one_learning/core/widgets/widget_multi_line_text_field.dart';
import 'package:one_on_one_learning/features/teacher_detail/widgets/widget_text_header.dart';

class ReportDialog extends StatelessWidget {
  final String teacherName;
  const ReportDialog({Key? key, required this.teacherName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingBottom = MediaQuery.of(context).viewInsets.bottom;
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          children: [
            WidgetTextHeader(title: 'Báo cáo $teacherName'),
            SizedBox(height: 32),
            Text(
              'Bạn đang gặp phải vấn đề gì?',
              style: kFontSemiboldPrimary_16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: WidgetMultiLineTextField(
                minLines: 3,
                hint: 'Nội dung',
              ),
            ),
            WidgetChip(text: 'Tutor này làm phiền tôi'),
            WidgetChip(text: 'Hồ sơ này là giả mạo'),
            WidgetChip(text: 'Ảnh hồ sơ không phù hợp'),
            Divider(height: 1),
            SizedBox(
              height: 64,
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Báo cáo Tutor',
                  style: kFontSemiboldPrimary_16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
