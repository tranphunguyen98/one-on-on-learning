import 'package:get/get.dart';
import 'package:one_on_one_learning/core/base_api.dart';
import 'package:one_on_one_learning/features/register/data/register_response.dart';
import 'package:one_on_one_learning/model/user.dart';

class RegisterController extends GetxController {
  bool isLoading = false;

  Future<UserModel?> register(String email, String password) async {
    isLoading = true;
    update();

    try {
      final response = await BaseApi().post('/auth/register', {
        'email': email,
        'password': password,
      });

      final registerResponse = RegisterResponse.fromJson(response);
      final user = registerResponse.user;
      final token = registerResponse.tokens;

      return UserModel(
        dateOfBirth: user?.birthday ?? '',
        email: user?.email ?? '',
        id: user?.id ?? '',
        name: user?.name ?? '',
        avatar: user?.avatar ?? '',
        accessToken: token?.access?.token ?? '',
      );
    } catch (e) {
      isLoading = false;
      update();
      rethrow;
    }
  }
}
