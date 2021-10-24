import 'package:flutter/material.dart';
import 'package:one_on_one_learning/features/teacher_detail/widgets/review_tutor_item.dart';
import 'package:one_on_one_learning/model/review_tutor.dart';

class WidgetReviewTutorList extends StatelessWidget {
  final List<ReviewTutorModel> reviewTutors =
      List.generate(5, (index) => ReviewTutorModel.mock);
  WidgetReviewTutorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: reviewTutors.length,
      itemBuilder: (context, index) {
        return ReviewTutorItem(
          reviewTutorModel: reviewTutors[index],
        );
      },
    );
  }
}
