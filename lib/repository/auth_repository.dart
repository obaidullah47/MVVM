import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/data/network/baseApiservice.dart';
import 'package:mvvm/res/app_urls.dart';

class AuthRepository {
  final Baseapiservice _apiservices = Networkapiservice();

  Future<dynamic> login(dynamic data) async {
    try {
      dynamic response = await _apiservices.getPostResponse(
        AppUrls.loginUrl,
        data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signup(dynamic data) async {
    try {
      dynamic signupResponse = await _apiservices.getPostResponse(
        AppUrls.signupUrl,
        data,
      );
      return signupResponse; // Added return statement
    } catch (e) {
      rethrow;
    }
  }
}
