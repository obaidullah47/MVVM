import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_buttons.dart';
import 'package:mvvm/utils/general_utils.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  final FocusNode _emailfocus = FocusNode();
  final FocusNode _passwordfocus = FocusNode();

  ValueNotifier<bool> _eyenotifier = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _emailfocus.dispose();
    _passwordfocus.dispose();
    _eyenotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
              keyboardType: TextInputType.emailAddress,
              focusNode: _emailfocus,
              decoration: InputDecoration(
                label: const Text("Email"),
                hintText: "Enter your Email", // Fixed property name
                prefixIcon: const Icon(Icons.email_outlined),
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
                    label: const Text("Password"),
                    prefixIcon: const Icon(Icons.lock_open_outlined),
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

          const SizedBox(height: 40),
          RoundButtons(
            loading: authprovider.signuploading,
            title: "Sign Up",

            onPress: () {
              if (_emailcontroller.text.isEmpty) {
                GeneralUtils.flushbarerrormessage("Enter your email", context);
              } else if (_passwordcontroller.text.isEmpty) {
                GeneralUtils.flushbarerrormessage(
                  "Enter your password ",
                  context,
                );
              } else if (_passwordcontroller.text.length < 6) {
                GeneralUtils.flushbarerrormessage(
                  "Password must be at least 6 digits",
                  context,
                );
              } else {
                Map data = {
                  'email': _emailcontroller.text.trim(),
                  'password': _passwordcontroller.text.trim(),
                };
                authprovider.signup(data, context);
              }
            },
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already had an account?",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesNames.LoginScreen);
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 17, color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
