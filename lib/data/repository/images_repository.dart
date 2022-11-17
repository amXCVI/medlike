import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/utils/api/dio_client.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

/// Использую для загрузки картинок, которые в приложении показываем
/// просто как NetworkImage или Image.network
/// (аватарки, слайдер)
class ImagesRepository {
  static Future<Uint8List> downloadImageFile({required String url}) async {
    Dio _dioClient = Api().dio;

    try {
      var response = await _dioClient.get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Authorization':
                'Bearer ${await UserSecureStorage.getField(AppConstants.accessToken)}'
          },
        ),
      );
      return Uint8List.fromList(response.data);
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
