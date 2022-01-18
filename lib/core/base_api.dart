import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:one_on_one_learning/core/server_failure.dart';
import 'package:one_on_one_learning/features/root_controller.dart';

class BaseApi {
  static final BaseApi _singleton = BaseApi._internal();

  factory BaseApi() {
    return _singleton;
  }

  BaseApi._internal();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://sandbox.api.lettutor.com',
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": 'Bearer ${Get.find<RootController>().user?.accessToken ?? ''}'
      },
    ),
  );

  Future<Map<String, dynamic>> post(String path, Map<String, dynamic> data) async {
    try {
      final user = Get.find<RootController>().user;
      _dio.options.headers['Authorization'] = 'Bearer ${user?.accessToken ?? ''}';
      final response = await _dio.post(path, data: data);
      final dataReponse = response.data as Map<String, dynamic>;
      print('nguyentp ==> $dataReponse');
      if (dataReponse.isEmpty) {
        throw ServerFailure();
      } else {
        return dataReponse;
      }
    } on DioError catch (e) {
      final response = (e.response?.data ?? {}) as Map<String, dynamic>;
      throw ServerFailure(response['message']);
    } catch (e) {
      throw ServerFailure();
    }
  }
}
