import 'package:flutter/cupertino.dart';
import 'package:mvvm/models/User_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveuser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getuser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');

    // Fixed: Passing token directly handles null correctly (avoiding "null" string)
    return UserModel(token: token);
  }

  Future<bool> logout() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    notifyListeners();
    return true;
  }
}
