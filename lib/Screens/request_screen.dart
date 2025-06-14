import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Orders/order_provider.dart';
import 'package:laundry_app_laundry/Screens/Orders/order_shimmer.dart';
import 'package:laundry_app_laundry/Utils/common_provider.dart';
import 'package:laundry_app_laundry/Utils/helpers.dart';
import 'package:laundry_app_laundry/Widgets/background.dart';
import 'package:laundry_app_laundry/Widgets/request_card.dart';
import 'package:laundry_app_laundry/Widgets/screen_background.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    var orderProvider = Provider.of<OrderProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getRequests(orderProvider);
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        orderProvider.getOrdersRequest(context);
      }
    });
  }

  getRequests(OrderProvider data) {
    data.orderRequestData = [];
    data.orderRequestLoading = false;
    data.orderRequestHashMoreData = true;
    data.orderRequestCurrentPage = 1;
    data.getOrdersRequest(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      body: ScreenBackground(
          text: "Order Requests",
          child: Column(
            children: [
              SizedBox(height: 5),
              Consumer2<OrderProvider, CommonProvider>(
                  builder: (context, orderData, commonProvider, child) {
                if (orderData.orderRequestLoading &&
                    orderData.orderRequestData.isEmpty) {
                  return Expanded(
                      child: OrdersShimmer(
                    height: 250,
                  ));
                }

                return orderData.orderRequestData.isEmpty
                    ? Expanded(child: Center(child: Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: Lottie.asset(getImg("waiting.json")),
                    )))
                    : Expanded(
                      child: VisibilityDetector(
                          onVisibilityChanged: (info) {
                            print("info...${info}");
                      
                            var visiblePercentage = info.visibleFraction * 100;
                            if (visiblePercentage > 80.0) {
                              orderData.setScreenVisibility = 1;
                            } else {
                              orderData.setScreenVisibility = 0;
                            }
                          },
                          key: const Key('visibiltydetector'),
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount: orderData.orderRequestData.length,
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 30, bottom: 100),
                            itemBuilder: (context, index) {
                              return RequestCard(
                                  onAccept: () {
                                    orderData.updateOrder(
                                        context,
                                        {
                                          "status": "confirmed",
                                          "received_by": commonProvider.userId
                                        },
                                        orderData.orderRequestData[index].id,
                                        "Order accepted successfully",
                                        callback: () {
                                      getRequests(orderData);
                                    });
                                  },
                                  onReject: () {
                                    orderData.orderRequestData.removeAt(index);
                                    setState(() {});
                                  },
                                  orderdata: orderData.orderRequestData[index]);
                            },
                          ),
                        ),
                    );
              }),
            ],
          )),
    );
  }
}
