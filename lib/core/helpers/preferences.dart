import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Preferences? _instance;
  late final SharedPreferences _preferences;

  factory Preferences() {
    _instance ??= Preferences._();
    return _instance!;
  }

  Preferences._() {
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  String getString(String key) {
    return _preferences.getString(key) ?? '';
  }

  Future<void> clearAll() async {
    await _preferences.clear();
  }
}
