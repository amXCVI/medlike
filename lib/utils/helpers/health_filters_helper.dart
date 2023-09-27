import 'dart:convert';

import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';

class HealthFiltersHelper {
  static Future<Map<String, List<String>>> loadFilters(List<String> userIds) async {
    /// Получить JSON строку из UserSecureStorage
    /// Спарсить и преобразовать в Map<String, List<String>> 
    /// Вернуть Map<String, List<String>>
    final json = await UserSecureStorage.getField(AppConstants.healthFilters) ?? "{}";
    final filters = jsonDecode(json) as Map<String, dynamic>;
    final result = filters.map((key, value) => MapEntry(key, List<String>.from(value)));
    //TODO: copy whole filter list if no filter was uploaded before
    return result;
  }

  static Future<void> setFilters(Map<String, List<String>> filters) async {
    /// Преобразовать filters в JSON строку
    /// Сохранить в UserSecureStorage
    final json = jsonEncode(filters);
    await UserSecureStorage.setField(AppConstants.healthFilters, json);
  }

  static void cleanFilters()  {
    /// Удалить из UserSecureStorage
    UserSecureStorage.deleteField(AppConstants.healthFilters);
  }
}
