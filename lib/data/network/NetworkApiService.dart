import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/baseApiservice.dart';

class Networkapiservice extends Baseapiservice {
  Future<dynamic> getGetResponse(String url) async {
    dynamic jsonResponse;

    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 10));
      jsonResponse = retunResponse(response);
    } on SocketException {
      throw FetchDataException('No internet Connection');
    }
  }

  @override
  Future<dynamic> getPostResponse(String url, dynamic data) async {
    dynamic jsonResponse;
    try {
      final respone = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));
    } on SocketException {
      throw FetchDataException("No internet Connection");
    }
    return jsonResponse;
  }
}

dynamic retunResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic jsonRespone = jsonDecode(response.body);
      return jsonRespone;
    case 400:
      throw BadRequestException("Delayed because of network");
    default:
      FetchDataException(
        "Error occurred while communicating with server " +
            "with status code" +
            response.statusCode.toString(),
      );
  }
}
