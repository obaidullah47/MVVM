import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_buttons.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final userviewmodel = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Homescreen")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "HOMESCREEN",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          RoundButtons(
            title: "logout",
            onPress: () {
              userviewmodel.logout();
              Navigator.pushReplacementNamed(context, RoutesNames.LoginScreen);
            },
          ),
        ],
      ),
    );
  }
}
