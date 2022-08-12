import 'package:dio/dio.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/utils/api/dio_client.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

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
    String? synFilter,
    String? userId,
    DateTime? dateFrom,
    DateTime? dateTo, 
  }) async {
    try {
      String url = '/api/v1.0/diary?Project=$project&Platform=$platform&Groping=$grouping';

      /// TODO: получать таймзону в параметре
      if(dateFrom != null) {
        url += '&dateFrom=${dateTimeToDate(dateFrom)}';
      }
      if(dateTo != null) {
        url += '&dateFrom=${dateTimeToDate(dateTo)}';
      }
      if(synFilter != null) {
        url += '&SynFilter=$synFilter';
      }
      if(userId != null) {
        url += '&UserId=$userId';
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

  Future<void> postDiaryEntry({
    required String date,
    required String syn,
    String? userId,
    required List<double> values
  }) async {
    try {
      await _dioClient.post('/api/v1.0/diary',
        data: {
          'DateTime': date,
          'Synonim': syn,
          'UserID' : userId,
          'Values': values
        },
        options: Options(
          headers: {
            'Authorization':
              'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}'
          },
        )
      );
    } catch (error) {
      rethrow;
    }
  }
}
