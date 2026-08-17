import 'package:flutter/foundation.dart';
import 'package:mvvm/data/response/api_respone.dart';
import 'package:mvvm/models/movies_list_model.dart';

import '../repository/movies_home_repository.dart';

class MovieHomeModel with ChangeNotifier {
  final _mymovrepo = MoviesHomeRepository();
  ApiResponse<MoviesListModel> moviesList = ApiResponse.loading();
  setMoviesList(ApiResponse<MoviesListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> getmoviedata() async {
    setMoviesList(ApiResponse.loading());
    _mymovrepo
        .getmoviedata()
        .then((value) {
          setMoviesList(ApiResponse.complete(value));
        })
        .onError((error, stackTrace) {
          setMoviesList(ApiResponse.error(error.toString()));
        });
  }
}
