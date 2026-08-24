import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/baseApiservice.dart';

class Networkapiservice extends Baseapiservice {
  @override
  Future<dynamic> getGetResponse(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: {
              'x-api-key':
                  "pub_c65bf259af579cf38bbc8eaace80b5eafda5a8ac688192f2b115bae0fff855e4",
            },
          )
          .timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet Connection');
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> getPostResponse(String url, dynamic data) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            // Crucial: Must use jsonEncode if sending application/json
            body: jsonEncode(data),
            headers: {
              'Content-Type': 'application/json',
              'x-api-key':
                  'pub_c65bf259af579cf38bbc8eaace80b5eafda5a8ac688192f2b115bae0fff855e4',
            },
          )
          .timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet Connection");
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201: // Added 201 for "Created" (common in signup)
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
          "Error occurred while communicating with server with status code ${response.statusCode}",
        );
    }
  }
}
