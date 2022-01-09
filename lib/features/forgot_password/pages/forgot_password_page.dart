import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:one_on_one_learning/core/core.dart';
import 'package:one_on_one_learning/core/server_failure.dart';
import 'package:one_on_one_learning/core/widgets/widget_logo_text.dart';
import 'package:one_on_one_learning/core/widgets/widget_rounded_button.dart';
import 'package:one_on_one_learning/core/widgets/widget_rounded_text_field.dart';
import 'package:one_on_one_learning/features/forgot_password/controller/password_controller.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final forgotPasswordController = Get.put(ForgotPasswordController());
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: kBlackColor,
          ),
        ),
        title: Text(
          'Quên mật khẩu',
          style: kFontSemiboldBlack_16,
        ),
      ),
      body: GetBuilder<ForgotPasswordController>(builder: (logic) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      WidgetLogoText(),
                      SizedBox(height: 32),
                      Text(
                        'Nhập địa chỉ email của bạn. Chúng tôi sẽ gửi cho bạn một đường link để đặt lại mật khẩu',
                        style: kFontRegularDefault_14,
                      ),
                      SizedBox(height: 64),
                      WidgetRoundedTextField(
                        controller: emailController,
                        hint: 'Nhập địa chỉ email',
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Vui lòng nhập email';
                          } else if (!GetUtils.isEmail(value!)) {
                            return 'Vui lòng nhập đúng định dạng email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 64),
                      WidgetRoundedButton(
                        text: 'Gửi',
                        onPressed: () async {
                          if (_formKey.currentState?.validate() == true) {
                            try {
                              String message = await forgotPasswordController.forgotPassword(emailController.text);
                              _showToast(context, message);
                            } on ServerFailure catch (e) {
                              _showToast(context, e.message);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (logic.isLoading)
              Container(
                color: kBlackColor.withOpacity(0.2),
                child: Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                ),
              )
          ],
        );
      }),
    );
  }

  void _showToast(BuildContext context, String text) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
        duration: Duration(milliseconds: 1000),
      ),
    );
  }
}
