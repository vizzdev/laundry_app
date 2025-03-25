import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Orders/order_provider.dart';
import 'package:laundry_app_laundry/Widgets/button.dart';
import 'package:provider/provider.dart';
import '../../Utils/colors.dart';
import '../../Widgets/background.dart';
import '../../Widgets/screen_background.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  var trackOrderText = [
    "Pending",
    "Confirm",
    "In-Progress",
    "Delivered",
    "Received"
  ];

  @override
  Widget build(BuildContext context) {
    return Background(
      body: ScreenBackground(
        text: "Order Details",
        showLeftIcon: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Row(
                children: [
                  Text("Order id :",
                      style: TextStyle(
                          fontSize: 16,
                          color: black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(width: 3),
                  Text("#00123FSW2",
                      style: TextStyle(fontSize: 16, color: black)),
                ],
              ),
              SizedBox(height: 10),
              Divider(color: greybd),
              SizedBox(height: 10),
              detailRow(
                lefttext: "Category",
                rightText: "Wash & Iron",
              ),
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
              SizedBox(height: 10),
              Divider(color: greybd),
              SizedBox(height: 30),
              Text("Tracking :",
                  style: TextStyle(
                      fontSize: 18, color: black, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              ListView.builder(
                padding: EdgeInsets.all(0),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: trackOrderText.length,
                itemBuilder: (context, index) {
                  return Consumer<OrderProvider>(
                      builder: (context, data, child) {
                    return trackOrder(
                        showbar: index == 0 ? false : true,
                        text: trackOrderText[index],
                        progressColor: data.changeOrderStatus(index),
                        textColor: data.changeOrderStatus(index));
                  });
                },
              ),
              SizedBox(height: 60),
              Consumer<OrderProvider>(
                builder: (context, data, child) {
                  return Button(text: data.proceedOrderButtonText, onTap: () {
                    data.setProceedOrderButtonText();
                  },);
                }
              )
            ],
          ),
        ),
      ),
    
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

  Widget trackOrder(
      {showbar = true, progressColor, text = "pending", textColor = grey75}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            showbar
                ? Container(height: 42, width: 2, color: progressColor)
                : SizedBox(),
            Container(
              height: 17,
              width: 17,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: progressColor),
            ),
          ],
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(fontSize: 15, color: textColor),
        )
      ],
    );
  }
}
