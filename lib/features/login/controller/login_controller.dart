import 'package:get/get.dart';
import 'package:one_on_one_learning/core/base_api.dart';
import 'package:one_on_one_learning/features/login/data/login_reponse.dart';
import 'package:one_on_one_learning/features/root_controller.dart';
import 'package:one_on_one_learning/model/user.dart';

class LoginController extends GetxController {
  bool isLoading = false;

  Future<UserModel> login(String email, String password) async {
    isLoading = true;
    update();

    try {
      final response = await BaseApi().post('/auth/login', {
        'email': email,
        'password': password,
      });

      final registerResponse = LoginResponse.fromJson(response);
      final user = registerResponse.user;
      final token = registerResponse.tokens;

      final userModel = UserModel(
        dateOfBirth: user?.birthday ?? '',
        email: user?.email ?? '',
        id: user?.id ?? '',
        name: user?.name ?? '',
        avatar: user?.avatar ?? '',
        accessToken: token?.access?.token ?? '',
      );

      Get.find<RootController>().user = userModel;

      return userModel;
    } catch (e) {
      isLoading = false;
      update();
      rethrow;
    }
  }
}
