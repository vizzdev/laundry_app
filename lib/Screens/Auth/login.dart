import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Auth/sign_up.dart';
import 'package:laundry_app_laundry/Widgets/button.dart';
import 'package:provider/provider.dart';

import '../../Utils/colors.dart';
import '../../Utils/helpers.dart';
import '../../Widgets/background.dart';
import '../../Widgets/inputfield.dart';
import '../main_page.dart';
import 'auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      resizableBottomInsert: true,
      body: Column(
        children: [
          SizedBox(height: 40),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset(getImg("logo.png"), height: 200)),
                  SizedBox(height: 30),
                  InputField(
                    title: "Email",
                    leftIcon: "mail.svg",
                    hintText: "Email",
                  ),
                  SizedBox(height: 20),
                  Consumer<AuthProvider>(builder: (context, auth, child) {
                    return InputField(
                      rightIconTap: () {
                        if (auth.obscureText) {
                          auth.setobscureText = false;
                        } else {
                          auth.setobscureText = true;
                        }
                      },
                      title: "Password",
                      leftIcon: "lock.svg",
                      hintText: "Password",
                      rightIcon: "eye.svg",
                      obscureText: auth.obscureText,
                      maxline: 1,
                    );
                  }),
                  SizedBox(height: 30),
                  Button(text: "Sign In",onTap: () {
                    pushAuth(context, MainPage());
                  },),
                  SizedBox(height: 40),
                  RichText(
                      text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: green8f,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            pushReplaceAuth(context, SignUpScreen());
                          },
                      ),
                    ],
                  )),
                  SizedBox(height: 30)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
