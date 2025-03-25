import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Dashboard/dashboard_profile_detail.dart';
import 'package:laundry_app_laundry/Screens/request_screen.dart';
import 'package:laundry_app_laundry/Utils/helpers.dart';
import 'package:laundry_app_laundry/Widgets/request_card.dart';
import '../../Utils/colors.dart';
import '../../Widgets/background.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> imgList = ["wash.png", "iron.png", "laundry.png", "machine.png"];
  List<String> text = ["Washing", "Ironing", "Dry Cleaning", "Wash & Iron"];
  @override
  Widget build(BuildContext context) {
    return Background(
      body: Column(
        children: [
          Container(height: 30, color: green8f),
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            green8f,
                            green8f.withOpacity(0.4)
                          ], // Gradient shades
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 40, bottom: 100),
                    child: Column(
                      children: [
                        DashboardProfileDetail(),
                        SizedBox(height: 50),
                        Row(
                          children: [
                            Text(
                              "Requests",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                pushAuth(context, RequestScreen());
                              },
                              child: Text("View All",
                                  style: TextStyle(fontSize: 14, color: green8f)),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        ListView.builder(
                          padding: EdgeInsets.only(top: 20),
                            itemCount: 5,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return RequestCard();
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
