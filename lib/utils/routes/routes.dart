import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/view/homescreen.dart';
import 'package:mvvm/view/login_screen.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.Home:
        return MaterialPageRoute(
          builder: (BuildContext context) => Homescreen(),
        );
      case RoutesNames.LoginScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Column(
                children: [Center(child: Text("No Routes are defined"))],
              ),
            );
          },
        );
    }
  }
}
