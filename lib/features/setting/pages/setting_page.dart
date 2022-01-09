import 'package:flutter/material.dart';
import 'package:one_on_one_learning/core/core.dart';
import 'package:one_on_one_learning/core/widgets/widget_rounded_button.dart';
import 'package:one_on_one_learning/features/setting/widgets/widget_setting_button.dart';
import 'package:one_on_one_learning/model/user.dart';
import 'package:one_on_one_learning/utils/router.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final UserModel userModel = UserModel.mock;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _widgetHeader(),
            SizedBox(height: 32),
            WidgetSettingButton(
              text: 'Xem đánh giá bản thân',
              leading: Icons.person_outline,
            ),
            SizedBox(height: 16),
            WidgetSettingButton(
              text: 'Danh sách giáo viên ưa thích',
              leading: Icons.favorite_border,
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.kTeacherFavorite);
              },
            ),
            SizedBox(height: 16),
            WidgetSettingButton(
              text: 'Lịch sử đặt lịch',
              leading: Icons.menu,
            ),
            SizedBox(height: 16),
            WidgetSettingButton(
              text: 'Lịch sử học',
              leading: Icons.history,
            ),
            SizedBox(height: 16),
            WidgetSettingButton(
              text: 'Cài đặt nâng cao',
              leading: Icons.settings_outlined,
            ),
            SizedBox(height: 64),
            WidgetSettingButton(
              text: 'Đi đến Website',
              leading: Icons.language,
            ),
            SizedBox(height: 16),
            WidgetSettingButton(
              text: 'Facebook',
              leading: Icons.facebook_outlined,
            ),
            SizedBox(height: 64),
            WidgetRoundedButton(text: 'Đăng xuất'),
          ],
        ),
      ),
    );
  }

  Widget _widgetHeader() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.kUserProfile);
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(userModel.avatar ?? ''),
            radius: 28,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userModel.name,
                style: kFontRegularDefault_16,
              ),
              SizedBox(height: 8),
              Text(
                userModel.email,
                style: kFontRegularDefault_14,
              ),
            ],
          )
        ],
      ),
    );
  }
}
