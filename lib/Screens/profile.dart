import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_app_laundry/Screens/Auth/auth_provider.dart';
import 'package:laundry_app_laundry/Screens/Auth/login.dart';
import 'package:laundry_app_laundry/Screens/Google%20Maps/map_provider.dart';
import 'package:laundry_app_laundry/Utils/common_provider.dart';
import 'package:laundry_app_laundry/Widgets/anaytics_card.dart';
import 'package:laundry_app_laundry/Widgets/review_card.dart';
import 'package:laundry_app_laundry/edit_profile.dart';
import 'package:provider/provider.dart';
import '../Utils/colors.dart';
import '../Utils/helpers.dart';
import '../Widgets/background.dart';
import '../Widgets/profile_image.dart';
import '../Widgets/screen_background.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Consumer3<AuthProvider, MapProvider, CommonProvider>(
        builder: (context, authProvider, mapProvider, commonProvider, child) {
      return Background(
          body: Center(
              child: ScreenBackground(
        text: "Profile",
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                      right: 0,
                      top: 50,
                      child: Consumer<CommonProvider>(
                          builder: (context, commonProvider, child) {
                        return Row(
                          children: [
                            GestureDetector(
                                onTap: () async {
                                  var authProvider = Provider.of<AuthProvider>(
                                      context,
                                      listen: false);
                                  Future<String> empty = Future.value("");

                                  authProvider.updateFcmToken(context, empty,
                                      callBack: () {
                                    token = "";
                                    commonProvider.setToken = "";
                                  });

                                  pushReplaceAuth(context, LoginScreen());
                                },
                                child: SvgPicture.asset(getImg("logout.svg"))),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                pushAuth(context,
                                    EditProfile(data: authProvider.userdata),
                                    callBack: () {
                                  authProvider.getUser(
                                      context, commonProvider.userId);
                                });
                              },
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: green8f),
                                  child: Icon(Icons.edit_rounded,
                                      size: 20, color: white)),
                            ),
                          ],
                        );
                      }),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50),
                        Row(
                          children: [
                            ProfileImage(
                              height: 100,
                              width: 100,
                              networkImage: authProvider.userdata.profileImage,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(authProvider.userdata.name,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: black,
                                          fontWeight: FontWeight.bold)),
                                  Text(authProvider.userdata.email,
                                      style: TextStyle(
                                          fontSize: 16, color: black)),
                                  SizedBox(height: 2),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.pin_drop_outlined,
                                        size: 20,
                                      ),
                                      Expanded(
                                        child: Text(
                                            authProvider.userdata.address,
                                            style: TextStyle(
                                                fontSize: 14, color: black)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(color: greybd),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnayticsCard(
                              text1: authProvider.userdata.orders.toString(),
                              text2: "0rders",
                            ),
                            SizedBox(width: 20),
                            AnayticsCard(
                              text1:
                                  "${authProvider.userdata.rating.toString()}⭐",
                              text2: "Rating",
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Divider(color: greybd),
                        SizedBox(height: 10),
                        Text(
                          "Reviews",
                          style: TextStyle(
                              fontSize: 20,
                              color: black,
                              fontWeight: FontWeight.bold),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          padding: EdgeInsets.only(top: 10),
                          itemBuilder: (context, index) {
                            return ReviewCard();
                          },
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 100)
              ],
            ),
          ),
        ),
      )));
    });
  }
}
