import 'dart:async';
import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/get_started_screen.dart';
import '../Utils/helpers.dart';
import '../Widgets/background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      pushAuth(context, GetStarted());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      body: Center(
        child: Image.asset(getImg("logo.png"), height: 250),
      ),
    );
  }
}
