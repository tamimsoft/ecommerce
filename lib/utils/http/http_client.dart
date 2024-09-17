import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import '../constants/api_constants.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  final String baseUrl = ApiConstants.baseUrl;

  // late final Map<String, String> headers;

  // HttpClient() {
  //   final storage = GetStorage();
  //   final token = storage.read<String>('token') ?? '';
  //   headers = {'token': token};
  // }

  ///-- Check Internet connection --------------------------------
  Future<bool> isConnected() async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      return !connectivityResult.contains(ConnectivityResult.none);
    } catch (e) {
      return false;
    }
  }

  ///-- this is Generic Get Method.--------------------------------
  Future<T> get<T>({
    required String endpoint,
    required T Function(dynamic) fromJson,
    Map<String, dynamic>? queryParams,
  }) async {
    if (!await isConnected()) throw Exception('No internet connection');

    Uri uri = Uri.parse(baseUrl + endpoint);
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }
    final response = await http.get(uri);
    // final response = await http.get(uri, headers: headers);
    return fromJson(_handleResponse(response));
  }

  ///-- this is Generic Get Method for auth.--------------------------------
  Future<T> get2<T>({
    required String endpoint,
    required T Function(dynamic) fromJson,
    Map<String, dynamic>? queryParams,
    String? token,
  }) async {
    if (!await isConnected()) throw Exception('No internet connection');

    Uri uri = Uri.parse(ApiConstants.baseUrlAuth + endpoint);
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }
    if (token != null) {
      final headers = {'Authorization': token};
      final response = await http.get(uri, headers: headers);
      return fromJson(_handleResponse(response));
    } else {
      final response = await http.get(uri);
      return fromJson(_handleResponse(response));
    }
  }

  Future<T> post2<T>({
    required String endpoint,
    required T Function(dynamic) fromJson,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body, // Added JSON body parameter
    String? token,
  }) async {
    // Check for internet connection
    if (!await isConnected()) throw Exception('No internet connection');

    // Build the URI with query parameters if any
    Uri uri = Uri.parse(ApiConstants.baseUrlAuth + endpoint);
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }

    // Prepare headers, including Content-Type for JSON
    final headers = <String, String>{
      'Content-Type': 'application/json', // Set the Content-Type to JSON
    };
    if (token != null) {
      headers['Authorization'] = token;
    }

    // Perform the POST request with the JSON-encoded body
    final response = await http.post(
      uri,
      headers: headers,
      body: body != null ? jsonEncode(body) : null, // Encode the body to JSON
    );

    // Error handling for unsuccessful requests
    if (response.statusCode >= 400) {
      throw Exception('Failed to POST data: ${response.statusCode}');
    }

    // Parse the response
    return fromJson(_handleResponse(response));
  }

  ///-- Handle response
  _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to lode data: ${response.statusCode}');
    }
  }
}
