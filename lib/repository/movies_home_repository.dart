import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/data/network/baseApiservice.dart';
import 'package:mvvm/models/movies_list_model.dart';
import 'package:mvvm/res/app_urls.dart';

class MoviesHomeRepository {
  Baseapiservice _apiservice = Networkapiservice();
  Future<MoviesListModel> getmoviedata() async {
    try {
      dynamic response = await _apiservice.getGetResponse(
        AppUrls.movieslistendpoint,
      );
      return response= MoviesListModel.fromJson(response);
    } catch (e) {
      throw e.toString();
    }
  }
}
