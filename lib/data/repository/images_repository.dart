import 'package:dio/dio.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/smartapp_models/smartapp_models.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/utils/api/dio_client.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

/// Использую для загрузки картинок, которые в приложении показываем
/// просто как NetworkImage или Image.network
/// (аватарки, слайдер)
class ImagesRepository {
  static Future<SmartappGetFileResponseModel> downloadImageFile(
      {required String url}) async {
    dynamic _dioClient = Api().dio;
    String trimUrl = url.substring(ApiConstants.baseUrl.length);
    try {
      var response = await _dioClient.getImage(
        trimUrl,
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Authorization':
                'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}'
          },
        ),
      );
      print('Картинка в репозитории: ${response.data}');
      try {
        return SmartappGetFileResponseModel.fromJson(response.data);
      } catch (err) {
        print('не удалось сериализовать картинку');
        print(err);
        rethrow;
      }
      // Uint8List decodedbytes1 = base64Decode(response.data);
      // return decodedbytes1;
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
