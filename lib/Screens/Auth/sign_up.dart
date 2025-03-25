import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Auth/login.dart';
import 'package:laundry_app_laundry/Screens/Google%20Maps/map_provider.dart';
import 'package:laundry_app_laundry/Screens/Google%20Maps/maps.dart';
import 'package:laundry_app_laundry/Widgets/profile_image.dart';
import 'package:provider/provider.dart';
import '../../Utils/colors.dart';
import '../../Utils/helpers.dart';
import '../../Widgets/background.dart';
import '../../Widgets/button.dart';
import '../../Widgets/inputfield.dart';
import '../main_page.dart';
import 'auth_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  SizedBox(height: 80),
                  Align(alignment: Alignment.center, child: ProfileImage()),
                  SizedBox(height: 10),
                  InputField(
                    title: "Name",
                    hintText: "Name",
                  ),
                  SizedBox(height: 20),
                  Consumer<MapProvider>(builder: (context, data, child) {
                    return InputField(
                      title: "Location",
                      hintText: "Location",
                      rightIcon: "map.svg",
                      controller: data.locationName,
                      readOnly: true,
                      onTap: () {
                        if (data.laundryLocation == null) {
                          data.getCurrentLocation(callback: () {
                            pushAuth(context, Googlemaps());
                          });
                        } else {
                          pushAuth(context, Googlemaps());
                        }
                      },
                    );
                  }),
                  SizedBox(height: 20),
                  InputField(
                    title: "Email",
                    leftIcon: "mail.svg",
                    hintText: "Email",
                  ),
                  SizedBox(height: 20),
                  Consumer<AuthProvider>(builder: (context, auth, child) {
                    return Column(
                      children: [
                        InputField(
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
                        ),
                        SizedBox(height: 20),
                        InputField(
                          rightIconTap: () {
                            if (auth.obscureText) {
                              auth.setobscureText = false;
                            } else {
                              auth.setobscureText = true;
                            }
                          },
                          title: "Confirm Password",
                          leftIcon: "lock.svg",
                          hintText: "Password",
                          rightIcon: "eye.svg",
                          obscureText: auth.obscureText,
                          maxline: 1,
                        ),
                      ],
                    );
                  }),
                  SizedBox(height: 30),
                  Button(
                    text: "Sign Up",
                    onTap: () {
                      pushAuth(context, MainPage());
                    },
                  ),
                  SizedBox(height: 40),
                  RichText(
                      text: TextSpan(
                    text: "Already have an account.",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(
                          color: green8f,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            pushReplaceAuth(context, LoginScreen());
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
