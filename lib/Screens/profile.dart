import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Google%20Maps/map_provider.dart';
import 'package:laundry_app_laundry/Widgets/anaytics_card.dart';
import 'package:laundry_app_laundry/Widgets/review_card.dart';
import 'package:provider/provider.dart';
import '../Utils/colors.dart';
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
                    child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15), color: green8f),
                        child: Icon(Icons.edit_rounded, size: 20, color: white)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      Row(
                        children: [
                          ProfileImage(height: 100, width: 100),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Washy Wash",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: black,
                                      fontWeight: FontWeight.bold)),
                              Text("washywash@gmail.com",
                                  style: TextStyle(fontSize: 16, color: black)),
                              Consumer<MapProvider>(
                                builder: (context, data, child) {
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.pin_drop_outlined,
                                        size: 20,
                                      ),
                                      Text(
                                          data.locationName.text == ""
                                              ? "Add location"
                                              : data.locationName.text,
                                          style:
                                              TextStyle(fontSize: 14, color: black)),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(color: greybd),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnayticsCard(text1: "90%", text2: "Success"),
                          AnayticsCard(
                            text1: "200",
                            text2: "0rders",
                          ),
                          AnayticsCard(
                            text1: "4.8⭐",
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
                            fontSize: 20, color: black, fontWeight: FontWeight.bold),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        padding: EdgeInsets.only(top: 10),
                        itemBuilder: (context, index) {
                        
                        return ReviewCard();
                      },)
                      
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
  }
}
