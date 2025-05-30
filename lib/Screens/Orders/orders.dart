import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Orders/order_detail.dart';
import 'package:laundry_app_laundry/Screens/Orders/order_provider.dart';
import 'package:laundry_app_laundry/Screens/Orders/order_shimmer.dart';
import 'package:provider/provider.dart';
import '../../Utils/helpers.dart';
import '../../Widgets/background.dart';
import '../../Widgets/order_card.dart';
import '../../Widgets/screen_background.dart';

class OrdersScreen extends StatefulWidget {
  final bool showLeftIcon;
  const OrdersScreen({super.key, this.showLeftIcon = false});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    var orderProvider = Provider.of<OrderProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getOrders(orderProvider);
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        orderProvider.getOrders(context);
      }
    });
  }

  getOrders(OrderProvider data) {
    data.orderData = [];
    data.orderLoading = false;
    data.orderHashMoreData = true;
    data.orderCurrentPage = 1;
    data.getOrders(context);
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
      showLeftIcon: widget.showLeftIcon,
      text: "Orders",
      child: Column(
        children: [
          SizedBox(height: 10),
          Consumer<OrderProvider>(builder: (context, orderdata, child) {
            if (orderdata.orderLoading && orderdata.orderData.isEmpty) {
              return Expanded(child: OrdersShimmer());
            }

            return orderdata.orderData.isEmpty
                ? Expanded(child: Center(child: Text("no orders found")))
                : Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: 50, bottom: 70),
                        itemCount: orderdata.orderData.length,
                        itemBuilder: (context, index) {
                          return OrderCard(
                            orderData: orderdata.orderData[index],
                            onpressed: () {
                              pushAuth(
                                  context,
                                  OrderDetail(
                                      orderData: orderdata.orderData[index]),
                                  callBack: () {
                                orderdata.getOrders(context);
                              });
                            },
                          );
                        }),
                  );
          }),
        ],
      ),
    ));
  }
}
