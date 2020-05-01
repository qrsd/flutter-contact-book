import 'dart:convert';

import 'package:http/http.dart' as http;

/// API client handles calls to endpoints and returns response
class ApiClient {
  /// [httpClient] needs to be injected.
  final http.Client httpClient;

  /// Constructor
  ApiClient({this.httpClient});

  /// Sends out a get request with [url] and [key]
  Future<Map<String, dynamic>> getData(String url, String key) async {
    final response = await httpClient.get(url, headers: {'x-api-key': '$key'});

    if (response.statusCode != 200) {
      throw Exception('Error getting data');
    } else {
      return jsonDecode(response.body);
    }
  }

  /// Sends out a get request with [url] and [key]
  void postData(String url, String postMessage) async {
    final response = await httpClient.post(url, body: postMessage);
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
  }
}
