import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/utils/api/dio_client.dart';

// TODO: добавить доп поля и методы кроме GET

class DiaryRepository {
  final _dioClient = Api().dio;

  Future<List<DiaryCategoryModel>> getDiaryCategories({
    required String phone,
    required String project,
    required String platform,
  }) async {
    try {
      final response = await _dioClient.get(
        '/api/v1.0/DiaryModelModel/category-list?Phone=$phone&Project=$project&Platform=$platform'
      );
      
      final List<DiaryCategoryModel> diaryCategories =
        DiaryCategoryModel.fromJson(response.data)
          as List<DiaryCategoryModel>;
      
      return diaryCategories;
    } catch (err) {
      rethrow;
    }
  }

  Future<List<DiaryModel>> getDiaries({
    required String phone,
    required String project,
    required String platform,
    DateTime? dateFrom,
    DateTime? dateTo, 
  }) async {
    try {
      final response = await _dioClient.get(
        '/api/v1.0/DiaryModelModel?Phone=$phone&Project=$project&Platform=$platform&DateFrom=$dateFrom&DateTo=$dateTo');
      
      final List<DiaryModel> diaryCategories =
        DiaryModel.fromJson(response.data)
          as List<DiaryModel>;
      
      return diaryCategories;
    } catch (err) {
      rethrow;
    }
  }
}
