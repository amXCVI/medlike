part of '../local_preferences.dart';

class _LocalManager {
  late _LocalManager _instance;
  _LocalManager._init();

  _LocalManager get instance {
    _instance ??= _LocalManager._init();
    return _instance;
  }

  late SharedPreferences _preferences;
  Future<SharedPreferences> get preferences async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences;
  }

  Future<bool> writeModelInJson(
      dynamic body, String url, Duration duration) async {
    final _pref = await preferences;
    if (duration == null) {
      return false;
    } else {
      BaseLocal local =
          BaseLocal(model: body, time: DateTime.now().add(duration));
      final json = jsonEncode(local.toJson());
      if (body != null && json.isNotEmpty) {
        return await _pref.setString(url, json);
      }
      return false;
    }
  }

  Future<String> getModelString(String url) async {
    final _pref = await preferences;
    final jsonString = _pref.getString(url);
    if (jsonString != null) {
      final jsonModel = jsonDecode(jsonString);
      final model = BaseLocal.fromJson(jsonModel);
      if (DateTime.now().isAfter(model.time)) {
        return BaseLocal.fromJson(jsonModel).model;
      } else {
        await removeModel(url);
      }
    }

    throw ('getModelString ERROR');
  }

  Future<bool> removeAllLocalData(String url) async {
    final _pref = await preferences;
    _pref.getKeys().removeWhere((element) => element.contains(url));
    return true;
  }

  Future<bool> removeModel(String url) async {
    final _pref = await preferences;
    return await _pref.remove(url);
  }
}
