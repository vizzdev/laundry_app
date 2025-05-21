import 'dart:async';
import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/get_started_screen.dart';
import 'package:laundry_app_laundry/Screens/main_page.dart';
import 'package:provider/provider.dart';
import '../Utils/common_provider.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      var commonProvider = Provider.of<CommonProvider>(context, listen: false);
      Future.delayed(Duration(seconds: 2), () {
        pushAuth(
            context, commonProvider.token != "" ? MainPage() : GetStarted());
      });
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
