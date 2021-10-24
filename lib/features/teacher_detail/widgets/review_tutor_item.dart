import 'package:flutter/material.dart';
import 'package:one_on_one_learning/core/core.dart';
import 'package:one_on_one_learning/core/widgets/widget_rating_bar_indicator.dart';
import 'package:one_on_one_learning/model/review_tutor.dart';

class ReviewTutorItem extends StatelessWidget {
  final ReviewTutorModel reviewTutorModel;
  ReviewTutorItem({Key? key, required this.reviewTutorModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(reviewTutorModel.imageUrl),
              radius: 24,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        reviewTutorModel.name,
                        style: kFontRegularDefault_14,
                      ),
                      Spacer(),
                      WidgetRatingBarIndicator(
                        star: reviewTutorModel.star,
                        itemSize: 16,
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    reviewTutorModel.comment,
                    style: kFontRegularDefault_12,
                  ),
                  SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      reviewTutorModel.date,
                      style: kFontRegularGray_10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
