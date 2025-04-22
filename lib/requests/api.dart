import 'dart:convert';
import 'package:http/http.dart' as http;

class NasaApi {
  static const String _apodUrl = 'https://api.nasa.gov/planetary/apod';
  static const String _apiKey = 'DEMO_KEY'; // Можно использовать ваш ключ

  static Future<List<String>> getApodImages(int count) async {
    try {
      final url = '$_apodUrl?api_key=$_apiKey&count=$count';
      print('APOD Request URL: $url');
      
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data
            .where((item) => item['media_type'] == 'image')
            .map((item) => item['url'].toString())
            .toList();
      } else {
        throw Exception('APOD request failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('APOD error: $e');
    }
  }
}