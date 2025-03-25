import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Widgets/background.dart';
import 'package:laundry_app_laundry/Widgets/request_card.dart';
import 'package:laundry_app_laundry/Widgets/screen_background.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      body: ScreenBackground(
          text: "Order Requests",
          child: Column(
            children: [
              SizedBox(height: 5),
              Expanded(
                child: ListView.builder(
                       itemCount: 10,
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 100),
                  itemBuilder: (context, index) {
                    return RequestCard();
                  },
                ),
              ),
            ],
          )),
    );
  }
}
