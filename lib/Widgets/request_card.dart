import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Orders/get_orders_model.dart';
import 'package:laundry_app_laundry/Utils/helpers.dart';
import 'package:laundry_app_laundry/Widgets/button.dart';
import '../Utils/colors.dart';

class RequestCard extends StatefulWidget {
  final OrderData? orderdata;
  final VoidCallback onReject;
  final VoidCallback onAccept;
  const RequestCard(
      {super.key,
      this.orderdata,
      this.onReject = defaultCallBack,
      this.onAccept = defaultCallBack});

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
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          getImg(widget.orderdata?.orderBy?.profileImage ?? ""),
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(getImg("profile.png"),
                                fit: BoxFit.cover, height: 50, width: 50);
                          },
                        )),
                  ),
                  SizedBox(width: 8),
                  Text("Haseeb",
                      style: TextStyle(
                          fontSize: 14,
                          color: black,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Divider(),
              detailRow(
                  lefttext: "Category",
                  rightText: widget.orderdata?.category?.title,
                  rightTextColor: red),
              detailRow(
                lefttext: "Items Weight",
                rightText: "${widget.orderdata?.weight} kilo",
              ),
              detailRow(
                  lefttext: "Pickup",
                  rightText: widget.orderdata?.pickupDatetime),
              detailRow(
                  lefttext: "Address",
                  rightText: widget.orderdata?.pickupLocation),
              detailRow(
                  lefttext: "Delivery",
                  rightText: widget.orderdata?.dropoffDatetime),
              detailRow(
                  lefttext: "Address",
                  rightText: widget.orderdata?.dropoffLocation),
              detailRow(
                  lefttext: "Total",
                  rightText: "\$${widget.orderdata?.invoice}",
                  rightTextColor: red),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Button(
                      text: "Accept",
                      height: 45,
                      fontSize: 16,
                      onTap: () {
                        widget.onAccept();
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                      child: Button(
                    text: "Reject",
                    fontColor: red,
                    btnColor: Colors.transparent,
                    borderWidth: 0.9,
                    borderColor: red,
                    height: 45,
                    fontSize: 16,
                    onTap: () {
                      widget.onReject();
                    },
                  )),
                ],
              )
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
