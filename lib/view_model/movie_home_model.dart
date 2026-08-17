import 'package:flutter/foundation.dart';

import '../repository/movies_home_repository.dart';

class MovieHomeModel with ChangeNotifier {
  final _mymovrepo = MoviesHomeRepository();
  Future<void> getmoviedata() async {
    _mymovrepo.getmoviedata().then((value) {}).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
