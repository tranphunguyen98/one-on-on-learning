import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:one_on_one_learning/core/core.dart';
import 'package:one_on_one_learning/model/teacher.dart';

class WidgetTeacherItem extends StatelessWidget {
  const WidgetTeacherItem({Key? key, required this.teacherModel}) : super(key: key);

  final TeacherModel teacherModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    teacherModel.imageUrl,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                teacherModel.name,
                                style: kFontRegularDefault_16,
                              ),
                              SizedBox(height: 8),
                              RatingBarIndicator(
                                rating: teacherModel.star,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                                unratedColor: Colors.amber.withAlpha(50),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              splashRadius: 24,
                              icon: Icon(
                                teacherModel.isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: teacherModel.isFavorite ? kRedColor : kPrimaryColor,
                                size: 24,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 32,
                        width: double.infinity,
                        child: ListView.separated(
                          itemCount: teacherModel.fields.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Chip(
                              backgroundColor: kBlueColor.withOpacity(0.2),
                              label: Text(
                                teacherModel.fields[index],
                                style: kFontRegularBlue_12,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(width: 4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              teacherModel.description,
              style: kFontRegularDefault_14,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
