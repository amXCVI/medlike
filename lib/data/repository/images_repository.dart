import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/utils/api/dio_client.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

/// Использую для загрузки картинок, которые в приложении показываем
/// просто как NetworkImage или Image.network
/// (аватарки, слайдер)
class ImagesRepository {
  static Future<Uint8List> downloadImageFile({required String url}) async {
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
      Uint8List decodedbytes1 = base64Decode(response.data);
      return decodedbytes1;
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
