import 'package:shared_preferences/shared_preferences.dart';

class DatabaseService {
  final SharedPreferences _preferences;

  DatabaseService(this._preferences);
  String? getString(String key) => _preferences.getString(key);
  void setString(String key, String value) =>
      _preferences.setString(key, value);

  void setBool(String key, bool value) => _preferences.setBool(key, value);
  bool getBool(String key) => _preferences.getBool(key) ?? false;

  void clear() => _preferences.clear();
}
