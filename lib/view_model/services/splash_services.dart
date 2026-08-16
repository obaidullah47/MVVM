import 'package:flutter/cupertino.dart';
import 'package:mvvm/models/User_model.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getuserData() => UserViewModel().getuser();
  void checkAuthentication(BuildContext context) async {
    getuserData()
        .then((value) async {
          if (value.token == 'null' || value.token == '') {
            await Future.delayed(Duration(seconds: 3));
            Navigator.pushReplacementNamed(context, RoutesNames.LoginScreen);
          } else {
            await Future.delayed(Duration(seconds: 3));

            Navigator.pushReplacementNamed(context, RoutesNames.Home);
          }
        })
        .onError((error, stackTrace) {
          print(error.toString());
        });
  }
}
