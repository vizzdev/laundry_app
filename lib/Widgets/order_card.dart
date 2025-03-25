import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Widgets/button.dart';
import 'package:laundry_app_laundry/Widgets/update_invoice_sheet.dart';

import '../Utils/colors.dart';
import '../Utils/helpers.dart';

class OrderCard extends StatefulWidget {
  final String orderStatus;
  final VoidCallback onpressed;
  const OrderCard(
      {super.key,
      this.orderStatus = "Pending",
      this.onpressed = defaultCallBack});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onpressed();
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
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
                Text(
                  "#00123FSW2",
                  style: TextStyle(
                      fontSize: 12, color: black, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Wash & Iron",
                  style: TextStyle(
                      fontSize: 14, color: red, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                detailRow(
                  lefttext: "Items Weight",
                  rightText: "5 kilos",
                ),
                detailRow(
                    lefttext: "Staus",
                    rightText: widget.orderStatus,
                    rightTextColor: widget.orderStatus == "Completed"
                        ? Colors.green
                        : yellow),
                detailRow(
                    lefttext: "Pickup", rightText: "12 Mar 2025, 10:11 PM"),
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
                detailRow(
                    lefttext: "Total",
                    rightText: "\$5.0",
                    leftFontSize: 18.0,
                    leftFontWeight: FontWeight.bold,
                    rightFontSize: 18.0,
                    rightTextColor: red),
                SizedBox(height: 10),
                Button(
                  text: "Update Invoice",
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return UpdateInvoiceSheet();
                      },
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 20)
        ],
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
}
