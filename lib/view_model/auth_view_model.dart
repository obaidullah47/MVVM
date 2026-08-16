import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm/models/User_model.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/general_utils.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/view_model/user_view_model.dart';

class AuthViewModel with ChangeNotifier {
  final _myrepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> login(dynamic data, BuildContext context) async {
    setLoading(true);
    _myrepo
        .login(data)
        .then((value) async {
          setLoading(false);
          final userprefrences = UserViewModel();
          userprefrences.saveuser(UserModel(token: value['token'].toString()));
          GeneralUtils.flushbarerrormessage("Login successfully", context);
          Navigator.pushNamed(context, RoutesNames.Home);
          if (kDebugMode) {
            print(value.toString());
          }
        })
        .onError((error, stackTrace) {
          setLoading(false);
          GeneralUtils.flushbarerrormessage(error.toString(), context);
          if (kDebugMode) {
            print(error.toString());
          }
        });
  }

  //signup api call//
  bool _singunloading = false;
  bool get signuploading => _singunloading;
  setsignuploading(bool value) {
    _singunloading = value;
    notifyListeners();
  }

  Future<void> signup(dynamic data, BuildContext context) async {
    setsignuploading(true);
    _myrepo
        .signup(data)
        .then((value) {
          setsignuploading(false);
          GeneralUtils.flushbarerrormessage("Signup done", context);
          Navigator.pushNamed(context, RoutesNames.Home);
          if (kDebugMode) {
            print(value.toString());
          }
        })
        .onError((error, stackTrace) {
          setsignuploading(false);
          GeneralUtils.flushbarerrormessage(error.toString(), context);
          if (kDebugMode) {
            print(error.toString());
          }
        });
  }
}
