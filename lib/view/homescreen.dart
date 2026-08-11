import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Homescreen")),
      body: Column(
        children: [
          Center(
            child: Text(
              "HOMESCREEN",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
