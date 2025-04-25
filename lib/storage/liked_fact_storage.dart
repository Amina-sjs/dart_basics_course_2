import 'package:shared_preferences/shared_preferences.dart';

class LikedFactStorage {
  static late SharedPreferences _prefs;
  static const _key = 'liked_facts';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static List<String> getFacts() {
    return _prefs.getStringList(_key) ?? [];
  }

  static void addFact(String fact) {
    final current = getFacts();
    current.add(fact);
    _prefs.setStringList(_key, current);
  }

  static void clear() {
    _prefs.remove(_key);
  }
}
