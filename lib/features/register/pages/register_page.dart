import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_on_one_learning/core/core.dart';
import 'package:one_on_one_learning/core/server_failure.dart';
import 'package:one_on_one_learning/core/widgets/widget_rounded_button.dart';
import 'package:one_on_one_learning/core/widgets/widget_rounded_text_field_with_title.dart';
import 'package:one_on_one_learning/core/widgets/widget_row_social.dart';
import 'package:one_on_one_learning/features/register/controller/register_controller.dart';
import 'package:one_on_one_learning/utils/router.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final registerController = Get.put<RegisterController>(RegisterController());

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
          'Đăng ký',
          style: kFontSemiboldBlack_16,
        ),
      ),
      body: GetBuilder<RegisterController>(builder: (logic) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _widgetForm(),
                    WidgetRoundedButton(
                      text: 'Đăng ký',
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          try {
                            await registerController.register(emailController.text, passwordController.text);
                            Navigator.of(context).pushReplacementNamed(AppRouter.kHome);
                          } on ServerFailure catch (e) {
                            _showToast(context, e.message);
                          }
                        }
                      },
                    ),
                    SizedBox(height: 16),
                    WidgetRowWithSocial(title: 'Hoặc đăng ký với'),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Bạn đã có tài khoản?',
                          style: kFontRegularDefault_14,
                        ),
                        SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(AppRouter.kLogin);
                          },
                          child: Text(
                            'Đăng nhập',
                            style: kFontRegularBlue_14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            if (logic.isLoading)
              Positioned.fill(
                child: Container(
                  color: kBlackColor.withOpacity(0.2),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              )
          ],
        );
      }),
    );
  }

  Widget _widgetForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          WidgetRoundedTextFieldWithTitle(
            controller: emailController,
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
            controller: passwordController,
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
          WidgetRoundedTextFieldWithTitle(
            title: 'Xác nhận Mật khẩu',
            isRequired: true,
            hint: '********',
            controller: confirmPasswordController,
            obscureText: true,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Vui lòng nhập mật khẩu';
              } else if (value!.length < 6) {
                return 'Vui lòng nhập mật khẩu lớn hơn 6 ký tư';
              } else if (passwordController.text != confirmPasswordController.text) {
                return 'Mật khẩu xác nhận không khớp với mật khẩu';
              }
            },
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  void _showToast(BuildContext context, String text) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
        duration: Duration(milliseconds: 600),
      ),
    );
  }
}
