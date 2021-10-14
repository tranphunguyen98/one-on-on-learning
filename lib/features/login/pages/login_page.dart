import 'package:flutter/material.dart';
import 'package:one_on_one_learning/core/core.dart';
import 'package:one_on_one_learning/core/widgets/widget_logo_text.dart';
import 'package:one_on_one_learning/core/widgets/widget_rounded_button.dart';
import 'package:one_on_one_learning/core/widgets/widget_rounded_text_field_with_title.dart';
import 'package:one_on_one_learning/core/widgets/widget_row_social.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios_rounded,
          color: kBlackColor,
        ),
        title: Text(
          'Đăng nhập',
          style: kFontSemiboldBlack_16,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            WidgetLogoText(),
            SizedBox(height: 32),
            WidgetRoundedTextFieldWithTitle(
              title: 'Địa chỉ E-mail',
              hint: 'example@gmail.com',
              isRequired: true,
            ),
            SizedBox(height: 32),
            WidgetRoundedTextFieldWithTitle(
              title: 'Mật khẩu',
              isRequired: true,
              hint: '********',
            ),
            SizedBox(height: 32),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Quên mật khẩu',
                style: kFontRegularPrimary_14,
              ),
            ),
            SizedBox(height: 16),
            WidgetRoundedButton(text: 'Log in'),
            SizedBox(height: 16),
            WidgetRowWithSocial(title: 'Hoặc đăng nhập với'),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Chưa có tài khoản?',
                  style: kFontRegularDefault_14,
                ),
                SizedBox(width: 4),
                Text(
                  'Đăng ký',
                  style: kFontRegularBlue_14,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
