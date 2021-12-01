import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_on_one_learning/core/colors.dart';
import 'package:one_on_one_learning/core/widgets/widget_radio_row_group.dart';
import 'package:one_on_one_learning/core/widgets/widget_search_text_field.dart';
import 'package:one_on_one_learning/features/home/widgets/widget_home_teacher_item.dart';
import 'package:one_on_one_learning/features/teacher_list/logic.dart';

class TeacherListPage extends StatelessWidget {
  final List<String> categoryList = [
    'All',
    'English for Kids',
    'English for Adults',
    'English for Adults1',
    'English for Adults2',
    'English for Adults3',
    'English for Adults4',
  ];

  final controller = Get.put(TeacherListController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            children: [
              WidgetSearchTextField(hint: 'Tìm Tutor'),
              Positioned.fill(
                top: 0,
                right: 8,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: PopupMenuButton<ETeacherFilter>(
                    icon: Icon(
                      Icons.filter_alt,
                      color: kGrayColor,
                    ),
                    onSelected: (value) {
                      controller.changeFilter(value);
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          value: ETeacherFilter.Default,
                          child: Text('Sắp xếp theo thứ tự mặc định'),
                        ),
                        PopupMenuItem(
                          value: ETeacherFilter.Favorite,
                          child: Text('Sắp xếp theo ưa thích'),
                        ),
                        PopupMenuItem(
                          value: ETeacherFilter.Rating,
                          child: Text('Sắp xếp theo theo sao giảm dần'),
                        ),
                      ];
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 16),
        Container(
          height: 36,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: WidgetRadioRowGroup(data: categoryList),
        ),
        Expanded(child: _buildListOfTeacher()),
      ],
    );
  }

  Widget _buildListOfTeacher() {
    return GetBuilder<TeacherListController>(
        init: controller,
        builder: (logic) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: logic.displayedTeachers.length,
                    itemBuilder: (context, index) => WidgetHomeTeacherItem(
                      key: UniqueKey(),
                      teacherModel: logic.displayedTeachers[index],
                    ),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
