import 'package:flutter/material.dart';
import 'package:one_on_one_learning/core/colors.dart';
import 'package:one_on_one_learning/core/core.dart';
import 'package:one_on_one_learning/core/widgets/widget_rounded_text_field.dart';
import 'package:one_on_one_learning/features/message/widgets/widget_message_item.dart';
import 'package:one_on_one_learning/model/message.dart';
import 'package:one_on_one_learning/model/teacher.dart';

class MessagePage extends StatelessWidget {
  final TeacherModel teacherModel = TeacherModel.mock;
  final List<MessageModel> messages = List.generate(3, (index) => MessageModel.mock);
  MessagePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _widgetAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) => WidgetMessageItem(messageModel: messages[index]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16, left: 16, right: 8),
            child: Row(
              children: [
                Expanded(
                  child: WidgetRoundedTextField(
                    hint: 'Nhắn tin ...',
                  ),
                ),
                SizedBox(width: 4),
                IconButton(
                  padding: EdgeInsets.all(4),
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                    color: kRedColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar _widgetAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Icon(
        Icons.arrow_back_ios_rounded,
        size: 16,
        color: kBlackColor,
      ),
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(teacherModel.imageUrl),
            radius: 16,
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                teacherModel.name,
                style: kFontRegularDefault_14,
              ),
              Text(
                'Tutor',
                style: kFontRegularGray_12,
              )
            ],
          ),
        ],
      ),
    );
  }
}
