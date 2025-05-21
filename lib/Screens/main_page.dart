import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/notifications.dart';
import 'package:laundry_app_laundry/Screens/Orders/orders.dart';
import 'package:laundry_app_laundry/Screens/profile.dart';
import 'package:laundry_app_laundry/Screens/request_screen.dart';
import 'package:provider/provider.dart';
import '../Utils/colors.dart';
import '../Utils/common_provider.dart';
import '../Utils/helpers.dart';
import '../Widgets/background.dart';
import '../Widgets/tab_items.dart';
import 'Auth/auth_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  var pages = [RequestScreen(), OrdersScreen(), Notifications(), Profile()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var commonProvider = Provider.of<CommonProvider>(context, listen: false);
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (token == "") {
        token = commonProvider.token;
      }
      authProvider.getUser(context, commonProvider.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      body: Stack(
        children: [
          pages[selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: green8f),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TabItems(
                    image: "category.svg",
                    isSelected: 0 == selectedIndex,
                    ontap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                  TabItems(
                    image: "order.svg",
                    isSelected: 1 == selectedIndex,
                    ontap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                  TabItems(
                    image: "bell.svg",
                    isSelected: 2 == selectedIndex,
                    ontap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                  ),
                  TabItems(
                    image: "profile.svg",
                    isSelected: 3 == selectedIndex,
                    ontap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
