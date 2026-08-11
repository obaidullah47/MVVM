import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_buttons.dart';
import 'package:mvvm/utils/general_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecurepass = ValueNotifier<bool>(true);
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  FocusNode _emailfocus = FocusNode();
  FocusNode _passwordfocus = FocusNode();
  late final height = MediaQuery.of(context).size.height * 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailcontroller,
                focusNode: _emailfocus,
                decoration: InputDecoration(
                  hint: Text("Enter Your Email"),
                  label: Text("Email"),
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
            SizedBox(height: 10),
            ValueListenableBuilder(
              valueListenable: _obsecurepass,
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    focusNode: _passwordfocus,
                    controller: _passwordcontroller,
                    decoration: InputDecoration(
                      hint: Text("Enter Your Password"),
                      labelText: "Password",
                      suffixIcon: InkWell(
                        onTap: () {
                          _obsecurepass.value = !_obsecurepass.value;
                        },
                        child: Icon(
                          _obsecurepass.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      prefixIcon: Icon(Icons.lock_open_outlined),
                    ),
                    obscureText: _obsecurepass.value,
                    obscuringCharacter: '*',
                  ),
                );
              },
            ),
            RoundButtons(title: "Login", onPress: () {}),
          ],
        ),
      ),
    );
  }
}
