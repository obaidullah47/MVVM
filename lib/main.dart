import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes.dart';
import 'package:mvvm/utils/routes/routes_names.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesNames.LoginScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
