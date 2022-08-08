import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/utils/api/dio_client.dart';

// TODO: добавить доп поля и методы кроме GET

class DiaryRepository {
  final _dioClient = Api().dio;

  Future<List<DiaryCategoryModel>> getDiaryCategories({
    required String project,
    required String platform,
  }) async {
    try {
      final response = await _dioClient.get(
        '/api/v1.0/diary/category-list?Project=$project&Platform=$platform'
      );

      final List list = response.data;
      
      final List<DiaryCategoryModel> diaryCategories =
        list.map((e) => DiaryCategoryModel.fromJson(e)).toList();
      
      return diaryCategories;
    } catch (err) {
      rethrow;
    }
  }

  Future<List<DiaryModel>> getDiaries({
    required String project,
    required String platform,
    required String grouping, 
    DateTime? dateFrom,
    DateTime? dateTo, 
  }) async {
    try {
      String url = '/api/v1.0/diary?Project=$project&Platform=$platform&Groping=$grouping';

      if(dateFrom != null) {
        url += '&dateFrom=$dateFrom';
      }
      if(dateTo != null) {
        url += '&dateTo=$dateTo';
      }
      
      final response = await _dioClient.get(url);

      final List list = response.data;
      
      final List<DiaryModel> diaries =
        list.map((e) => DiaryModel.fromJson(e)).toList();
      
      return diaries;
    } catch (err) {
      rethrow;
    }
  }
}
