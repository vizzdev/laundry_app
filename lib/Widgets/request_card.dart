import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Widgets/button.dart';
import '../Utils/colors.dart';

class RequestCard extends StatefulWidget {
  final String orderStatus;
  const RequestCard({super.key, this.orderStatus = "Pending"});

  @override
  State<RequestCard> createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: green8f.withOpacity(0.5),
                  spreadRadius: 1.5,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              detailRow(
                  lefttext: "Category",
                  rightText: "Wash & Iron",
                  rightTextColor: red),
              detailRow(
                lefttext: "Items Weight",
                rightText: "5 kilos",
              ),
              detailRow(lefttext: "Pickup", rightText: "12 Mar 2025, 10:11 PM"),
              detailRow(
                  lefttext: "Address",
                  rightText: "44c Civic Center, Islamabad"),
              detailRow(
                  lefttext: "Delivery", rightText: "14 Mar 2025, 10:11 PM"),
              detailRow(
                  lefttext: "Address",
                  rightText: "44c Civic Center, Islamabad"),
              detailRow(
                  lefttext: "Total", rightText: "\$5.0", rightTextColor: red),
                  SizedBox(height: 10),
                  Row(children: [
                    Expanded(child: Button(
                      text: "Accept",
                      height: 45,
                      fontSize: 16,
                    )),
                    SizedBox(width: 20),
                    Expanded(child: Button(
                      text: "Reject",
                      fontColor: red,
                      btnColor: Colors.transparent,
                      borderWidth: 0.9,
                      borderColor: red,
                      height: 45,
                      fontSize: 16,
                    )),
                  ],)
            ],
          ),
        ),
        SizedBox(height: 20)
      ],
    );
  }

  Widget detailRow(
      {lefttext = "LeftText",
      rightText = "RightText",
      rightTextColor = black,
      leftFontWeight = FontWeight.w500,
      leftFontSize = 14.0,
      rightFontSize = 14.0}) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Text(
              lefttext,
              style: TextStyle(
                  fontSize: leftFontSize,
                  color: black,
                  fontWeight: leftFontWeight),
            )),
            SizedBox(width: 5),
            Expanded(
              flex: 2,
              child: Text(
                rightText,
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: rightTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: rightFontSize),
              ),
            )
          ],
        ),
        SizedBox(height: 5)
      ],
    );
  }
}
