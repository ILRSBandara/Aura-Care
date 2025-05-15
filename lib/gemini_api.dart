import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiAPI {
  static final String _apiKey = dotenv.env['GEMINI_API_KEY']!;
  static final String _url =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$_apiKey';

  static Future<String> sendMessage(String message) async {
    final response = await http.post(
      Uri.parse(_url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": message}
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json["candidates"][0]["content"]["parts"][0]["text"];
    } else {
      return "Error: ${response.reasonPhrase}";
    }
  }
}
