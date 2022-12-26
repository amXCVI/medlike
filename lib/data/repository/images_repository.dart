import 'package:dio/dio.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/utils/api/dio_client.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

/// Использую для загрузки картинок, которые в приложении показываем
/// просто как NetworkImage или Image.network
/// (аватарки, слайдер)
class ImagesRepository {
  static Future<String> getPathImageFile({required String url}) async {
    dynamic _dioClient = Api().dio;
    String trimUrl = url.substring(ApiConstants.baseUrl.length);
    try {
      var response = await _dioClient.getStatic(
        trimUrl,
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Authorization':
                'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}'
          },
        ),
      );
      try {
        return response.data;
      } catch (err) {
        print(err);
        rethrow;
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
