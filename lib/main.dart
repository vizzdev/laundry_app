import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Google%20Maps/map_provider.dart';
import 'package:laundry_app_laundry/Screens/Orders/order_provider.dart';
import 'package:provider/provider.dart';
import 'Screens/Auth/auth_provider.dart';
import 'Screens/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: ((context) => AuthProvider()),
        ),
        ChangeNotifierProvider<MapProvider>(
          create: ((context) => MapProvider()),
        ),
         ChangeNotifierProvider<OrderProvider>(
          create: ((context) => OrderProvider()),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: "poppins"),
          home: SplashScreen()),
    );
  }
}
