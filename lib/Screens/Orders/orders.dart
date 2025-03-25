import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Orders/order_detail.dart';
import '../../Utils/helpers.dart';
import '../../Widgets/background.dart';
import '../../Widgets/order_card.dart';
import '../../Widgets/screen_background.dart';

class OrdersScreen extends StatefulWidget {
  final bool showLeftIcon;
  final String orderStatus;
  const OrdersScreen(
      {super.key, this.showLeftIcon = false, this.orderStatus = "Pending"});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
        body: ScreenBackground(
      showLeftIcon: widget.showLeftIcon,
      text: "Orders",
      child: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 50, bottom: 70),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return OrderCard(
                    orderStatus: widget.orderStatus,
                    onpressed: () {
                      pushAuth(context, OrderDetail());
                    },
                  );
                }),
          ),
        ],
      ),
    ));
  }
}
