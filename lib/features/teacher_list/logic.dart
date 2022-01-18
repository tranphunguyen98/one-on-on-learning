import 'package:get/get.dart';
import 'package:one_on_one_learning/core/base_api.dart';
import 'package:one_on_one_learning/features/teacher_list/data/teacher_response.dart';
import 'package:one_on_one_learning/model/teacher.dart';

enum ETeacherFilter { Default, Favorite, Rating }

class TeacherListController extends GetxController {
  ETeacherFilter teacherFilter = ETeacherFilter.Favorite;
  String specialize = '';
  String keyword = '';
  bool isLoading = false;

  List<TeacherModel> _teachers = [];

  late List<TeacherModel> displayedTeachers;

  List<TeacherModel> get favoriteTeachers => _teachers.where((element) => element.isFavorite).toList() ?? [];

  TeacherListController() {
    displayedTeachers = _teachers;
  }

  Future<List<TeacherModel>> search(String key, String specialty) async {
    isLoading = true;
    update();

    List<String> specialties = <String>[];
    if (specialty.isNotEmpty) {
      specialties = [specialty];
    }
    try {
      final response = await BaseApi().post('/tutor/search', {
        'search': key,
        'filters': {
          'specialties': specialties,
        },
      });

      final teachersResponse = TeacherListResponse.fromJson(response);

      final teachersModel = teachersResponse.teachers
          .map(
            (response) => TeacherModel(
                isFavorite: false,
                description: response.bio ?? '',
                name: response.name ?? '',
                imageUrl: response.avatar ?? '',
                id: response.id ?? '',
                nation: response.country ?? '',
                hobby: response.interests ?? '',
                career: '',
                education: '',
                experience: '',
                fields: [''],
                languages: response.languages != null ? response.languages!.split(',') : [],
                star: 1),
          )
          .toList();
      _teachers = teachersModel;
      displayedTeachers = _teachers;
      isLoading = false;
      update();
      return teachersModel;
    } catch (e) {
      isLoading = false;
      update();
      rethrow;
    }
  }

  void updateFavorite(bool isFavorite, String id) {
    final favoriteIndex = _teachers.indexWhere((element) => element.id == id);
    if (favoriteIndex >= 0) {
      _teachers[favoriteIndex] = _teachers[favoriteIndex].copyWith(isFavorite: isFavorite);
      update();
    }
  }

  void changeFilter(ETeacherFilter filter) {
    teacherFilter = filter;
    updateTeacher();
  }

  void changeSpecialize(String specialize) {
    this.specialize = specialize;
    updateTeacher();
  }

  void changeKeyword(String keyword) {
    this.keyword = keyword.toLowerCase();
    updateTeacher();
  }

  void updateTeacher() {
    switch (teacherFilter) {
      case ETeacherFilter.Default:
        displayedTeachers = _teachers;
        break;
      case ETeacherFilter.Favorite:
        List<TeacherModel> result = [];
        result.addAll(_teachers);
        result.sort((a, b) {
          if (b.isFavorite) {
            return 1;
          } else {
            return -1;
          }
        });
        displayedTeachers = result;
        break;
      case ETeacherFilter.Rating:
        List<TeacherModel> result = [];
        result.addAll(_teachers);
        result.sort((a, b) {
          return b.star.compareTo(a.star);
        });
        displayedTeachers = result;
        break;
    }

    if (specialize.isNotEmpty) {
      List<TeacherModel> result = [];
      result.addAll(displayedTeachers);
      result.removeWhere((element) => !element.fields.contains(specialize));
      displayedTeachers = result;
    }

    if (keyword.isNotEmpty) {
      List<TeacherModel> result = [];
      result.addAll(displayedTeachers);
      result.removeWhere((element) =>
          !element.name.toLowerCase().contains(keyword) && !element.nation.toLowerCase().contains(keyword));
      displayedTeachers = result;
    }
    update();
  }
}
