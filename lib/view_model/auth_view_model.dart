import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/general_utils.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setBool('islogin', true);
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

  bool _logoutloading = false;
  bool get logoutloading => _logoutloading;
  setlogoutloadig(bool value) {
    _logoutloading = value;
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    setlogoutloadig(true);
    _myrepo
        .logout()
        .then((value) {
          setlogoutloadig(false);
          if (kDebugMode) {
            GeneralUtils.flushbarerrormessage("logout successfully", context);
          }
        })
        .onError((error, stackTrace) {
          setlogoutloadig(false);
          if (kDebugMode) {
            GeneralUtils.flushbarerrormessage(error.toString(), context);
          }
        });
  }
}
