import 'package:flutter/material.dart';
import 'package:mvvm/res/appcolors.dart';

class RoundButtons extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool loading;

  const RoundButtons({
    super.key,
    required this.title,
    required this.onPress,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,

      child: Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          color: Appcolors.ButtonColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: loading
              ? CircularProgressIndicator(color: Colors.white)
              : Text(title, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
