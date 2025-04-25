import 'dart:convert';
import 'package:http/http.dart' as http;

class CatFactService {
  static Future<String> getCatFact(String lang) async {
    try {
      final response = await http.get(Uri.parse('https://catfact.ninja/fact'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return _simulateTranslation(data['fact'], lang);
      } else {
        return 'Failed to fetch fact';
      }
    } catch (_) {
      return 'Error connecting to API';
    }
  }

  static String _simulateTranslation(String fact, String lang) {
    switch (lang) {
      case 'es':
        return '[ES] $fact';
      case 'fr':
        return '[FR] $fact';
      default:
        return '[EN] $fact';
    }
  }
}
