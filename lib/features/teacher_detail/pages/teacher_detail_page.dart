import 'package:flutter/material.dart';
import 'package:one_on_one_learning/core/core.dart';
import 'package:one_on_one_learning/core/widgets/widget_chip.dart';
import 'package:one_on_one_learning/core/widgets/widget_favorite.dart';
import 'package:one_on_one_learning/core/widgets/widget_icon_text_column.dart';
import 'package:one_on_one_learning/core/widgets/widget_rating_bar_indicator.dart';
import 'package:one_on_one_learning/core/widgets/widget_rounded_button.dart';
import 'package:one_on_one_learning/core/widgets/widget_video_player.dart';
import 'package:one_on_one_learning/features/teacher_detail/widgets/report_dialog.dart';
import 'package:one_on_one_learning/features/teacher_detail/widgets/review_tutor_list.dart';
import 'package:one_on_one_learning/features/teacher_detail/widgets/widget_choose_date_bottom_sheet.dart';
import 'package:one_on_one_learning/model/teacher.dart';

class TeacherDetailPage extends StatelessWidget {
  final TeacherModel teacherModel = TeacherModel.mock;
  TeacherDetailPage({Key? key}) : super(key: key);

  late BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          WidgetVideoPlayer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _widgetInfoHeader(),
                SizedBox(height: 16),
                Builder(
                  builder: (context) {
                    return WidgetRoundedButton(
                      text: 'Đặt lịch ngay',
                      onPressed: () => _showChooseDateBottomSheet(context),
                    );
                  },
                ),
                SizedBox(height: 16),
                _widgetRowFunction(),
                SizedBox(height: 24),
                Text(
                  teacherModel.description,
                  style: kFontRegularDefault_14,
                ),
                SizedBox(height: 8),
                _widgetTitleChipsColumn('Ngôn ngữ', [teacherModel.language]),
                _widgetTitleTextColumn('Học vấn', teacherModel.education),
                _widgetTitleTextColumn('Kinh nghiêm', teacherModel.experience),
                _widgetTitleTextColumn('Sở thích', teacherModel.hobby),
                _widgetTitleTextColumn('Nghề nghiệp', teacherModel.career),
                _widgetTitleChipsColumn('Chuyên môn', teacherModel.fields),
                SizedBox(height: 16),
                _widgetViewReview(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _widgetViewReview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Đánh giá và bình luận (5)',
          style: kFontRegularPrimary_14,
        ),
        SizedBox(height: 16),
        WidgetReviewTutorList(),
      ],
    );
  }

  Column _widgetTitleTextColumn(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(
          title,
          style: kFontRegularPrimary_14,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 8.0),
          child: Text(
            text,
            style: kFontRegularGray_14,
          ),
        ),
      ],
    );
  }

  Column _widgetTitleChipsColumn(String title, List<String> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(
          title,
          style: kFontRegularPrimary_14,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0),
          child: Container(
            height: 32,
            width: double.infinity,
            child: ListView.separated(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return WidgetChip(text: data[index]);
              },
              separatorBuilder: (context, index) => SizedBox(width: 4),
            ),
          ),
        ),
      ],
    );
  }

  Row _widgetRowFunction() {
    return Row(
      children: [
        SizedBox(width: 64),
        WidgetIconTextColumn(
          iconData: Icons.message,
          text: 'Nhắn tin',
        ),
        Spacer(),
        WidgetIconTextColumn(
          iconData: Icons.info,
          text: 'Báo cáo',
          onTap: _showReportDialog,
        ),
        SizedBox(width: 64),
      ],
    );
  }

  Row _widgetInfoHeader() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(teacherModel.imageUrl),
          radius: 42,
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              teacherModel.name,
              style: kFontRegularDefault_16,
            ),
            SizedBox(height: 8),
            Text(
              'Tutor',
              style: kFontRegularDefault_14,
            ),
            Text(
              teacherModel.nation,
              style: kFontRegularDefault_14,
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            WidgetRatingBarIndicator(star: teacherModel.star),
            SizedBox(height: 8),
            WidgetFavorite(isFavorite: teacherModel.isFavorite),
          ],
        ),
      ],
    );
  }

  void _showReportDialog() {
    showDialog<void>(
      context: _context,
      builder: (BuildContext dialogContext) {
        return ReportDialog(teacherName: teacherModel.name);
      },
    );
  }

  void _showChooseDateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return WidgetChooseDateBottomSheet();
      },
    );
  }
}
