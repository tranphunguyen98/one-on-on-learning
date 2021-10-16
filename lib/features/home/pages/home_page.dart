import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_on_one_learning/core/core.dart';
import 'package:one_on_one_learning/features/home/widgets/widget_header_home.dart';
import 'package:one_on_one_learning/features/home/widgets/widget_home_teacher_item.dart';
import 'package:one_on_one_learning/model/teacher.dart';

import '../logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WidgetHeaderHome(),
            _buildListOfTeacher(),
          ],
        ),
      ),
    );
  }

  Widget _buildListOfTeacher() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gia sư được đề xuất',
                    style: kFontRegularDefault_14,
                  ),
                  SizedBox(height: 2),
                  SizedBox(
                    width: 136,
                    child: Divider(
                      thickness: 1,
                      height: 1,
                      color: kBlackColor,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                'Tất cả',
                style: kFontRegularPrimary_14,
              ),
              SizedBox(width: 2),
              Icon(
                Icons.chevron_right,
                color: kPrimaryColor,
              ),
            ],
          ),
          SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) => WidgetHomeTeacherItem(
              teacherModel:
                  index % 2 == 0 ? TeacherModel.mock : TeacherModel.mock1,
            ),
            separatorBuilder: (context, index) => SizedBox(height: 16),
          ),
        ],
      ),
    );
  }
}
