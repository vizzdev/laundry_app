import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_app_laundry/Screens/Auth/auth_provider.dart';
import 'package:laundry_app_laundry/Screens/Auth/login.dart';
import 'package:laundry_app_laundry/Screens/Settings/support.dart';
import 'package:laundry_app_laundry/Screens/Settings/wallet.dart';
import 'package:laundry_app_laundry/Utils/colors.dart';
import 'package:laundry_app_laundry/Utils/common_provider.dart';
import 'package:laundry_app_laundry/Utils/helpers.dart';
import 'package:laundry_app_laundry/Utils/notification_service.dart';
import 'package:laundry_app_laundry/Widgets/background.dart';
import 'package:laundry_app_laundry/Widgets/screen_background.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    var commonProvider = Provider.of<CommonProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authProvider.getUser(context, commonProvider.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Background(
        body: ScreenBackground(
      text: "Settings",
      showLeftIcon: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 50),
            settingOptions(
                text: "Wallet",
                onTap: () {
                  pushAuth(context, Wallet());
                },
                icon: "wallet.svg"),
            settingOptions(
                text: "Support",
                onTap: () {
                  pushAuth(context, Support());
                },
                icon: "headphone.svg"),
            settingOptions(
                text: "Logout",
                icon: "headphone.svg",
                rightICon: "logout.svg",
                textStyle: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: red),
                rightIconColor: red,
                rightIconSize: 30.0,
                onTap: () {
                  NotificationServices notificationServices =
                      NotificationServices();
                  var authProvider =
                      Provider.of<AuthProvider>(context, listen: false);
                  var commonProvider =
                      Provider.of<CommonProvider>(context, listen: false);
                  final fcmToken = notificationServices.getDeviceToken();

                  authProvider.updateFcmToken(context, fcmToken, callBack: () {
                    token = "";
                    commonProvider.setToken = "";
                  }, param: "remove");

                  pushReplaceAuth(context, LoginScreen());
                },
                showLeftIcon: false,
                showdivider: false),
          ],
        ),
      ),
    ));
  }

  Widget settingOptions(
      {text = "text",
      icon = "order.svg",
      rightICon = "arrow.svg",
      showdivider = true,
      rightIconSize = 40.0,
      rightIconColor = green8f,
      Function? onTap,
      textStyle = const TextStyle(
        fontSize: 15.0,
        color: black,
      ),
      showLeftIcon = true}) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  showLeftIcon
                      ? SvgPicture.asset(getImg(icon),
                          height: 30, color: green8f)
                      : SizedBox(),
                  SizedBox(width: 5),
                  Text(text, style: textStyle),
                  Spacer(),
                  SvgPicture.asset(getImg(rightICon),
                      height: rightIconSize, color: rightIconColor)
                ],
              ),
            ),
            showdivider ? Divider(color: green8f) : SizedBox(),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
