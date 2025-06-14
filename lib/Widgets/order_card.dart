import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Orders/get_orders_model.dart';
import 'package:laundry_app_laundry/Widgets/button.dart';
import 'package:laundry_app_laundry/Widgets/update_invoice_sheet.dart';

import '../Utils/colors.dart';
import '../Utils/helpers.dart';

class OrderCard extends StatefulWidget {
  final VoidCallback onpressed;
  final OrderData orderData;
  const OrderCard(
      {super.key, this.onpressed = defaultCallBack, required this.orderData});

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
                  "#${widget.orderData.id.substring(widget.orderData.id.length - 10)}",
                  style: TextStyle(
                      fontSize: 12, color: black, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  widget.orderData.category?.title ?? "",
                  style: TextStyle(
                      fontSize: 14, color: red, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                detailRow(
                  lefttext: "Items Weight",
                  rightText: "${widget.orderData.weight} kilos",
                ),
                detailRow(
                    lefttext: "Staus",
                    rightText: capitalize(widget.orderData.status),
                    rightTextColor: getStatusColor(widget.orderData.status)),
                detailRow(
                    lefttext: "Pickup",
                    rightText: widget.orderData.pickupDatetime),
                detailRow(
                    lefttext: "Address",
                    rightText: widget.orderData.pickupLocation),
                detailRow(
                    lefttext: "Delivery",
                    rightText: widget.orderData.dropoffDatetime),
                detailRow(
                    lefttext: "Address",
                    rightText: widget.orderData.dropoffLocation),
                SizedBox(height: 10),
                Divider(color: greybd),
                SizedBox(height: 10),
                detailRow(
                    lefttext: "Sub Total",
                    rightText: "\$${widget.orderData.invoice}"),
                detailRow(lefttext: "Discount", rightText: "\$0.0"),
                SizedBox(height: 10),
                detailRow(
                    lefttext: "Total",
                    rightText: "\$${widget.orderData.invoice}",
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

  Color getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return Colors.orange;
    case 'confirmed':
      return Colors.blue;
    case 'in-progress':
      return Colors.amber;
    case 'delivered':
      return Colors.teal;
    case 'received':
      return Colors.green;
    case 'reviewed':
      return Colors.deepOrange;    
    case 'cancel':
      return Colors.red;
    default:
      return Colors.grey;
  }
}
String capitalize(String s) => s.isNotEmpty ? '${s[0].toUpperCase()}${s.substring(1)}' : s;
}
