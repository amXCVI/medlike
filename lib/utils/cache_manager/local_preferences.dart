import 'dart:convert';

import 'package:medlike/utils/cache_manager/i_file_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/local_data.dart';

part 'core/preferences.dart';

class LocalPreferences implements IFileManager {
  late _LocalManager manager = _LocalManager._init();
  @override
  Future<String> getUserRequestDataOnString(String key) async {
    return await manager.getModelString(key);
  }

  @override
  Future<bool> removeUserRequestCache(String key) async {
    return await manager.removeAllLocalData(key);
  }

  @override
  Future<bool> removeUserRequestSingleCache(String key) async {
    return await manager.removeModel(key);
  }

  @override
  Future<bool> writeUserRequestDataWithTime(
      String key, Object model, Duration time) async {
    if (time == null) {
      return false;
    } else {
      return await manager.writeModelInJson(model, key, time);
    }
  }
}
