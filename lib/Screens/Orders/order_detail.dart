import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Orders/get_orders_model.dart';
import 'package:laundry_app_laundry/Screens/Orders/order_provider.dart';
import 'package:laundry_app_laundry/Utils/helpers.dart';
import 'package:laundry_app_laundry/Widgets/button.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../Utils/colors.dart';
import '../../Widgets/background.dart';
import '../../Widgets/screen_background.dart';

class OrderDetail extends StatefulWidget {
  final OrderData orderData;
  const OrderDetail({super.key, required this.orderData});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  var trackOrderText = [
    "Pending",
    "Confirm",
    "In-Progress",
    "Delivered",
    "Completed"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var orderProvider = Provider.of<OrderProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      orderProvider.setOrderStatus = widget.orderData.status;
      orderProvider.setProceedOrderButtonText(context, "");
      orderProvider.setOrderId = widget.orderData.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      body: ScreenBackground(
        text: "Order Details",
        showLeftIcon: true,
        child: Consumer<OrderProvider>(builder: (context, orderdata, child) {
          return VisibilityDetector(
            onVisibilityChanged: (info) {
              print("info...${info}");

              var visiblePercentage = info.visibleFraction * 100;
              if (visiblePercentage > 80.0) {
                orderdata.screenVisibility = 1;
              } else {
                orderdata.screenVisibility = 0;
              }
            },
            key: const Key('visibiltydetector'),
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
                      Text(
                          "#${widget.orderData.id.substring(widget.orderData.id.length - 10)}",
                          style: TextStyle(fontSize: 16, color: black)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(color: greybd),
                  Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              netImg(
                                  widget.orderData.orderBy?.profileImage ?? ""),
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
                  Divider(color: greybd),
                  SizedBox(height: 10),
                  detailRow(
                    lefttext: "Category",
                    rightText: "${widget.orderData.category?.title}",
                  ),
                  detailRow(
                    lefttext: "Items Weight",
                    rightText: "${widget.orderData.weight} Kilo",
                  ),
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
                  SizedBox(height: 30),
                  Text("Tracking :",
                      style: TextStyle(
                          fontSize: 18,
                          color: black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: trackOrderText.length,
                    itemBuilder: (context, index) {
                      return trackOrder(
                          showbar: index == 0 ? false : true,
                          text: trackOrderText[index],
                          textColor: getStatusIndex(orderdata) >= index
                              ? green8f
                              : greybd,
                          progressColor: getStatusIndex(orderdata) >= index
                              ? green8f
                              : greybd);
                    },
                  ),
                  SizedBox(height: 60),
                  Consumer<OrderProvider>(builder: (context, data, child) {
                    return data.orderStatus != "reviewed" &&
                            data.orderStatus != "completed"
                        ? Button(
                            text: data.proceedOrderButtonText,
                            onTap: () {
                              data.setProceedOrderButtonText(
                                  context, widget.orderData.id);
                            },
                          )
                        : SizedBox();
                  }),
                  SizedBox(height: 20)
                ],
              ),
            ),
          );
        }),
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

  int getStatusIndex(OrderProvider data) {
    switch (data.orderStatus.toLowerCase()) {
      case 'pending':
        return 0;
      case 'confirmed':
        return 1;
      case 'in-progress':
        return 2;
      case 'delivered':
        return 3;
      case 'completed':
        return 4;
      case 'reviewed':
        return 4;
      default:
        return 0;
    }
  }
}
