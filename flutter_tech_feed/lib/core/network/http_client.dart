import 'dart:convert';
import 'package:http/http.dart' as http;

class AppHttpClient {
  const AppHttpClient();

  Future<dynamic> getJson(Uri uri, {Map<String, String>? headers}) async {
    final response = await http.get(uri, headers: headers);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    }
    throw HttpException('GET ${uri.toString()} failed: ${response.statusCode}');
  }

  Future<String> getText(Uri uri, {Map<String, String>? headers}) async {
    final response = await http.get(uri, headers: headers);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    }
    throw HttpException('GET ${uri.toString()} failed: ${response.statusCode}');
  }
}

class HttpException implements Exception {
  HttpException(this.message);
  final String message;
  @override
  String toString() => message;
}

