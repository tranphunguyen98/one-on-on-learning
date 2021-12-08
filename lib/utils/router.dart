import 'package:flutter/material.dart';
import 'package:one_on_one_learning/features/forgot_password/pages/forgot_password_page.dart';
import 'package:one_on_one_learning/features/home/pages/home_page.dart';
import 'package:one_on_one_learning/features/login/pages/login_page.dart';
import 'package:one_on_one_learning/features/profile/pages/profile_page.dart';
import 'package:one_on_one_learning/features/register/pages/register_page.dart';
import 'package:one_on_one_learning/features/teacher_detail/pages/teacher_detail_page.dart';
import 'package:one_on_one_learning/features/teacher_list/pages/teacher_list_page.dart';
import 'package:one_on_one_learning/model/teacher.dart';

class AppRouter {
  static const String kHome = '/home';
  static const String kSplash = '/splash';
  static const String kLoading = '/loading';
  static const String kLogin = '/login';
  static const String kRegister = '/register';
  static const String kChangePassword = '/changePassword';
  static const String kForgotPassword = '/forgotPassword';
  static const String kSetting = '/setting';
  static const String kTeacherList = '/teacherList';
  static const String kTeacherDetail = '/teacherDetail';
  static const String kUserProfile = '/userProfile';

  static const String kArgumentTask = '/argumentTask';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case kSplash:
      //   return MaterialPageRoute(builder: (_) => SplashScreen());
      // case kLoading:
      //   return MaterialPageRoute(builder: (_) => LoadingScreen());
      case kHome:
        return MaterialPageRoute(builder: (_) => HomePage());
      case kLogin:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case kRegister:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case kForgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      case kTeacherList:
        return MaterialPageRoute(builder: (_) => TeacherListPage());
      case kTeacherDetail:
        return MaterialPageRoute(builder: (_) => TeacherDetailPage(teacherModel: settings.arguments as TeacherModel));
      case kUserProfile:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      // case kChangePassword:
      //   return MaterialPageRoute(builder: (_) => ChangePasswordScreen());
      // case kSetting:
      //   return MaterialPageRoute(builder: (_) => SettingScreen());
    }
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
    );
  }
}
