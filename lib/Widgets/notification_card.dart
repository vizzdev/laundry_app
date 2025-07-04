// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_app_laundry/Modela/notification_model.dart';
import 'package:laundry_app_laundry/Screens/main_page.dart';
import '../Utils/colors.dart';
import '../Utils/helpers.dart';

class UpdatesCard extends StatefulWidget {
  final NotificationsData notificationsData;
  const UpdatesCard({super.key, required this.notificationsData});

  @override
  State<UpdatesCard> createState() => _UpdatesCardState();
}

class _UpdatesCardState extends State<UpdatesCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (widget.notificationsData.data?.status == "pending") {
              pushReplaceAuth(context, MainPage(index: 0));
            } else {
              pushReplaceAuth(context, MainPage(index: 1));
            }
          },
          child: Container(
              height: 85,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: green8f.withOpacity(0.5),
                    spreadRadius: 1.5,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    getImg("bell.svg"),
                    height: 40,
                    width: 40,
                    color: green8f,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 250,
                          child: Text(
                            widget.notificationsData.title,
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                              color: black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.notificationsData.body,
                          style: const TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.w500,
                            color: black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
