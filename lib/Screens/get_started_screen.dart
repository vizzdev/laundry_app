import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Auth/login.dart';
import '../Utils/colors.dart';
import '../Utils/helpers.dart';
import '../Widgets/background.dart';
import '../Widgets/button.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Background(
        body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 200),
          Align(
              alignment: Alignment.center,
              child: Image.asset(getImg("get_started.png"), height: 250)),
          SizedBox(height: 80),
          Text(
            "Grow your laundry business with ease! Manage orders, track pickups, and deliver freshness to your customers—all in one place",
            style: TextStyle(
                fontSize: 16, color: black, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          Button(
            text: "Get Started",
            onTap: () {
              pushAuth(context, LoginScreen());
            },
          ),
        ],
      ),
    ));
  }
}
