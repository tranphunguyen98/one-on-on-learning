import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:one_on_one_learning/core/core.dart';
import 'package:one_on_one_learning/core/widgets/widget_core_app_bar.dart';
import 'package:one_on_one_learning/core/widgets/widget_logo_text.dart';
import 'package:one_on_one_learning/core/widgets/widget_rounded_button.dart';
import 'package:one_on_one_learning/core/widgets/widget_rounded_text_field_with_title.dart';
import 'package:one_on_one_learning/core/widgets/widget_row_social.dart';
import 'package:one_on_one_learning/utils/router.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: widgetCoreAppBar(title: 'Đăng nhập', context: context),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                WidgetLogoText(),
                SizedBox(height: 32),
                WidgetRoundedTextFieldWithTitle(
                  title: 'Địa chỉ E-mail',
                  hint: 'example@gmail.com',
                  isRequired: true,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Vui lòng nhập email';
                    } else if (!GetUtils.isEmail(value!)) {
                      return 'Vui lòng nhập đúng định dạng email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32),
                WidgetRoundedTextFieldWithTitle(
                  title: 'Mật khẩu',
                  isRequired: true,
                  hint: '********',
                  obscureText: true,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Vui lòng nhập mật khẩu';
                    } else if (value!.length < 6) {
                      return 'Vui lòng nhập mật khẩu lớn hơn 6 ký tư';
                    }
                  },
                ),
                SizedBox(height: 32),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRouter.kForgotPassword);
                    },
                    child: Text(
                      'Quên mật khẩu',
                      style: kFontRegularPrimary_14,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                WidgetRoundedButton(
                  text: 'Đăng nhập',
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.of(context).pushNamed(AppRouter.kHome);
                    }
                  },
                ),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRouter.kRegister);
                      },
                      child: Text(
                        'Đăng ký',
                        style: kFontRegularBlue_14,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
