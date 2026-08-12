import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/data/network/baseApiservice.dart';
import 'package:mvvm/res/app_urls.dart';

class AuthRepository {
  Baseapiservice _apiservices = Networkapiservice();
  Future<dynamic> login(dynamic data) async {
    try {
      dynamic response = await _apiservices.getPostResponse(
        AppUrls.loginUrl,
        data,
      );
    } catch (e) {
      throw e;
    }
  }
}
