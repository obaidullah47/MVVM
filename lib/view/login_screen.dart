import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_buttons.dart';
import 'package:mvvm/utils/general_utils.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  @override
  void dispose() {
    _obsecurepass.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _emailfocus.dispose();
    _passwordfocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Login"), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
          SizedBox(height: 40),

          RoundButtons(
            loading: authprovider.loading,
            title: "Login",
            onPress: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.setString("email", _emailcontroller.text.toString());
              sp.setString('password', _passwordcontroller.text.toString());
              sp.setBool('islogin', true);
              if (_emailcontroller.text.isEmpty) {
                GeneralUtils.flushbarerrormessage("Enter the email ", context);
              } else if (_passwordcontroller.text.isEmpty) {
                GeneralUtils.flushbarerrormessage(
                  "Eneter your password",
                  context,
                );
              } else if (_passwordcontroller.text.length < 6) {
                GeneralUtils.flushbarerrormessage(
                  "Password must be more than 6 digits",
                  context,
                );
              } else {
                Map data = {
                  'email': _emailcontroller.text.toString(),

                  'password': _passwordcontroller.text.toString(),
                };
                authprovider.login(data, context);
                GeneralUtils.flushbarerrormessage("Your api hit", context);
                Navigator.pushNamed(context, RoutesNames.Home);
              }
            },
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Didn't have an Account", style: TextStyle(fontSize: 15)),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesNames.signup);
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 18, color: Color(0xFF361981)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
