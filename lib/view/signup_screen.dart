import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_buttons.dart';
import 'package:mvvm/utils/general_utils.dart';
import 'package:mvvm/utils/routes/routes_names.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  FocusNode _emailfocus = FocusNode();
  FocusNode _passwordfocus = FocusNode();
  ValueNotifier<bool> _eyenotifier = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SignUp",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _emailcontroller,
              focusNode: _emailfocus,
              decoration: InputDecoration(
                label: Text("Email"),
                hint: Text("Enter your Email"),
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onFieldSubmitted: (val) {
                GeneralUtils.Focusnode(context, _emailfocus, _passwordfocus);
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _eyenotifier,
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordcontroller,
                  focusNode: _passwordfocus,
                  obscureText: _eyenotifier.value,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    hintText: "Enter Your password",
                    label: Text("Password"),
                    prefixIcon: Icon(Icons.lock_open_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        _eyenotifier.value = !_eyenotifier.value;
                      },
                      child: Icon(
                        _eyenotifier.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 40),
          RoundButtons(
            title: "Sign Up",
            onPress: () {
              if (_emailcontroller.text.isEmpty) {
                GeneralUtils.flushbarerrormessage(
                  "Your email is not entered",
                  context,
                );
              } else if (_passwordcontroller.text.isEmpty) {
                GeneralUtils.flushbarerrormessage(
                  "Enter your password",
                  context,
                );
              } else if (_passwordcontroller.text.length < 6) {
                GeneralUtils.flushbarerrormessage(
                  "Password must be greater than 6 digit",
                  context,
                );
              } else {
                print('sign up done');
              }
            },
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already had an account?", style: TextStyle(fontSize: 14)),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesNames.LoginScreen);
                },
                child: Text("Login", style: TextStyle(fontSize: 17)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
