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
    DateTime? updateSince
  }) async {
    try {
      var queryParams = {
        'Project': project,
        'Platform': platform      
      };

      if(updateSince != null) {
        queryParams.addAll({
          'updateSince': dateTimeToServerFormat(updateSince, 3),
        });
      }

      final response = await _dioClient.get(
        '/api/v1.0/diary/category-list',
        queryParameters: queryParams
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
      String url = '/api/v1.0/diary';
      var queryParams = {
        'Project': project,
        'Platform': platform,
        'Grouping': grouping
      };

      if(synFilter != null) {
        queryParams.addAll({
          'SynFilter': synFilter
        });
      }

      if(userId != null) {
        queryParams.addAll({
          'UserId': userId
        });
      }

      if(dateFrom != null) {
        queryParams.addAll({
          'DateFrom': dateTimeToServerFormat(dateFrom, 3),
        });
      }

      if(dateTo != null) {
        queryParams.addAll({
          'DateTo': dateTimeToServerFormat(dateTo, 3)
        });
      }
      
      final response = await _dioClient.get(url, 
        queryParameters: queryParams);

      final List list = response.data;
      
      final List<DiaryModel> diaries =
        list.map((e) => DiaryModel.fromJson(e)).toList();
      
      return diaries;
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> postDiaryEntry({
    required DateTime date,
    required String syn,
    String? userId,
    required List<double> values
  }) async {
    try {
      final response = await _dioClient.post('/api/v1.0/diary',
        data: {
          'dateTime': dateTimeToServerFormat(date, 3),
          'synonim': syn,
          'userID' : userId,
          'values': values
        },
        options: Options(
          headers: {
            'Authorization':
              'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}'
          },
        )
      );
      final res = response.statusCode ?? 0;

      return res >= 200 && res < 300;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> putDiaryEntry({
    required DateTime date,
    required DateTime oldDate,
    required String syn,
    String? userId,
    required List<double> values
  }) async {
    try {
      final response = await _dioClient.put('/api/v1.0/diary',
        data: {
          'dateTime': dateTimeToServerFormat(date, 0),
          'oldDatetime': dateTimeToServerFormat(oldDate, 0),
          'synonim': syn,
          'userID' : userId,
          'values': values
        },
        options: Options(
          headers: {
            'Authorization':
              'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}'
          },
        )
      );

      final res = response.statusCode ?? 0;

      return res >= 200 && res < 300;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> deleteDiaryEntry({
    required DateTime date,
    required String syn,
    String? userId,
  }) async {
    try {
      var queryParams = {
        'DateTime': dateTimeToServerFormat(date, 3),
        'Synonim': syn
      };

      if(userId != null) {
        queryParams.addAll({
          'UserId': userId
        });
      }

      final response = await _dioClient.delete('/api/v1.0/diary',
        queryParameters: queryParams,
        options: Options(
          headers: {
            'Authorization':
              'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}'
          },
        )
      );

      final res = response.statusCode ?? 0;

      return res >= 200 && res < 300;
    } catch (error) {
      rethrow;
    }
  }
}
