import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHelper {
  static Future<Map<String, dynamic>> getData(
    String url, [
    Map<String, String> headers,
  ]) async {
    try {
      final res = await http.get(url, headers: headers ?? {});
      if (res.statusCode == 200) {
        return Future.value(jsonDecode(res.body) as Map<String, dynamic>);
      } else {
        throw 'Error';
      }
    } catch (e) {
      rethrow;
    }
  }
}
