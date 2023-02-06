import 'package:dio/dio.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/diary_models/diary_models.dart';
import 'package:medlike/utils/api/dio_client.dart';
import 'package:medlike/utils/helpers/date_time_helper.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

class DiaryRepository {
  final _dioClient = Api().dio;

  Future<List<DiaryCategoryModel>> getDiaryCategories(
      {DateTime? updateSince}) async {
    try {
      final offsetTz = DateTime.now().timeZoneOffset.inHours;

      Map<String, String> queryParams = {};

      if (updateSince != null) {
        queryParams.addAll({
          'updateSince': dateTimeToServerFormat(updateSince, offsetTz),
        });
      }

      final response = await _dioClient.get('/api/v1.0/diary/category-list',
          queryParameters: queryParams);

      final List list = response.data;

      final List<DiaryCategoryModel> diaryCategories =
          list.map((e) => DiaryCategoryModel.fromJson(e)).toList();

      return diaryCategories;
    } catch (err) {
      rethrow;
    }
  }

  Future<List<DiaryModel>> getDiaries({
    required String grouping,
    String? synFilter,
    String? userId,
    DateTime? dateFrom,
    DateTime? dateTo,
  }) async {
    try {
      final offsetTz = DateTime.now().timeZoneOffset.inHours;

      String url = '/api/v1.0/diary';
      var queryParams = {'Grouping': grouping};

      if (synFilter != null) {
        queryParams.addAll({'SynFilter': synFilter});
      }

      if (userId != null) {
        queryParams.addAll({'UserId': userId});
      }

      if (dateFrom != null) {
        queryParams.addAll({
          'DateFrom': dateTimeToServerFormat(dateFrom, offsetTz),
        });
      }

      if (dateTo != null) {
        queryParams
            .addAll({'DateTo': dateTimeToServerFormat(dateTo, offsetTz)});
      }

      final response = await _dioClient.get(url, queryParameters: queryParams);

      final List list = response.data;

      final List<DiaryModel> diaries =
          list.map((e) => DiaryModel.fromJson(e)).toList();

      return diaries;
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> postDiaryEntry(
      {required DateTime date,
      required String syn,
      String? userId,
      required List<double> values}) async {
    try {
      final offsetTz = DateTime.now().timeZoneOffset.inHours;

      final response = await _dioClient.post(
        '/api/v1.0/diary',
        data: {
          'dateTime': dateTimeToServerFormat(date, offsetTz),
          'synonim': syn,
          'userID': userId,
          'values': values
        },
        // options: Options(
        //   headers: {
        //     'Authorization':
        //       'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}'
        //   },
        // )
      );
      final res = response.statusCode ?? 0;

      return res >= 200 && res < 300;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> putDiaryEntry(
      {required DateTime date,
      required DateTime oldDate,
      required String syn,
      String? userId,
      required List<double> values}) async {
    try {
      final offsetTz = DateTime.now().timeZoneOffset.inHours;

      final response = await _dioClient.put(
        '/api/v1.0/diary',
        data: {
          'DateTime': dateTimeToServerFormat(date, offsetTz),
          'OldDatetime': dateTimeToServerFormat(oldDate, offsetTz),
          'Synonim': syn,
          'UserID': userId,
          'Values': values
        },
        // options: Options(
        //   headers: {
        //     'Authorization':
        //         'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}'
        //   },
        // )
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
      final offsetTz = DateTime.now().timeZoneOffset.inHours;

      var queryParams = {
        'DateTime': dateTimeToServerFormat(date, offsetTz),
        'Synonim': syn
      };

      if (userId != null) {
        queryParams.addAll({'UserId': userId});
      }

      final response = await _dioClient.delete(
        '/api/v1.0/diary',
        queryParameters: queryParams,
        // options: Options(
        //   headers: {
        //     'Authorization':
        //         'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}'
        //   },
        // )
      );

      final res = response.statusCode ?? 0;

      return res >= 200 && res < 300;
    } catch (error) {
      rethrow;
    }
  }
}
