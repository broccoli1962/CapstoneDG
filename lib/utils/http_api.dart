import 'dart:convert';
import 'package:http/http.dart' as http;

class JdoodleAPI {
  final String clientId;
  final String clientSecret;

  JdoodleAPI({required this.clientId, required this.clientSecret});

  Future<String> executeCode(String script, String language,
      {int version = 0}) async {
    final url = Uri.parse('https://api.jdoodle.com/v1/execute');
    final data = {
      'clientId': clientId,
      'clientSecret': clientSecret,
      'script': script,
      'language': language,
      'versionIndex': version
    };

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      },
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData['output'] as String;
    } else {
      throw Exception('Failed to execute code : ${response.statusCode}');
    }
  }
}