import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Google%20Maps/map_provider.dart';
import 'package:laundry_app_laundry/Screens/Orders/order_provider.dart';
import 'package:laundry_app_laundry/Utils/common_provider.dart';
import 'package:laundry_app_laundry/Utils/notification_service.dart';
import 'package:provider/provider.dart';
import 'Screens/Auth/auth_provider.dart';
import 'Screens/splash_screen.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    NotificationServices notificationServices = NotificationServices();
    notificationServices.firebaseInit(context);
    final token =  notificationServices.getDeviceToken();
    print("my token is ${token}");
  }

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
        ChangeNotifierProvider<CommonProvider>(
          create: ((context) => CommonProvider()),
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
