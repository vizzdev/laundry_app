import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_app_laundry/Screens/Google%20Maps/map_provider.dart';
import 'package:provider/provider.dart';
import '../../Utils/colors.dart';
import '../../Utils/helpers.dart';
import '../Google Maps/maps.dart';
import '../Notifications/notifications.dart';

class DashboardProfileDetail extends StatefulWidget {
  const DashboardProfileDetail({super.key});

  @override
  State<DashboardProfileDetail> createState() => _DashboardProfileDetailState();
}

class _DashboardProfileDetailState extends State<DashboardProfileDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(getImg("laundry_logo.png"),
                      fit: BoxFit.cover),
                )),
            Spacer(),
            GestureDetector(
                onTap: () {
                  pushAuth(context, Notifications(showLeftIcon: true));
                },
                child: SvgPicture.asset(getImg("bell.svg")))
          ],
        ),
        SizedBox(height: 10),
        Text(
          "Welcome Back",
          style: TextStyle(
              fontSize: 18, color: white, fontWeight: FontWeight.w400),
        ),
        Text(
          "Washy Wash",
          style: TextStyle(
              fontSize: 18, color: white, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Consumer<MapProvider>(builder: (context, data, child) {
          return GestureDetector(
            onTap: () {
              if (data.laundryLocation == null) {
                data.getCurrentLocation(callback: () {
                  pushAuth(context, Googlemaps());
                });
              } else {
                pushAuth(context, Googlemaps());
              }
            },
            child: Row(
              children: [
                Icon(Icons.pin_drop_rounded),
                SizedBox(width: 4),
                Text(
                  data.locationName.text == "" ? "Choose location" : data.locationName.text,
                  style: TextStyle(fontSize: 14, color: black),
                ),
              ],
            ),
          );
        })
      ],
    );
  }
}
