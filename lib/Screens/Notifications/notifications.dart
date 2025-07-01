import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Notifications/notification_provider.dart';
import 'package:laundry_app_laundry/Screens/Orders/order_shimmer.dart';
import 'package:provider/provider.dart';

import '../../Widgets/background.dart';
import '../../Widgets/notification_card.dart';
import '../../Widgets/screen_background.dart';

class Notifications extends StatefulWidget {
  final bool showLeftIcon;
  const Notifications({super.key, this.showLeftIcon = false});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    var notificationProvider =
        Provider.of<NotificationProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getOrders(notificationProvider);
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        notificationProvider.getNotifications(context);
      }
    });
  }

  getOrders(NotificationProvider data) {
    data.notificationData = [];
    data.notificationLoading = false;
    data.notificationHashMoreData = true;
    data.notificationCurrentPage = 1;
    data.getNotifications(context);
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
      text: "Updates",
      child: Column(
        children: [
          SizedBox(height: 10),
          Consumer<NotificationProvider>(
              builder: (context, notificationProvider, child) {
            if (notificationProvider.notificationLoading &&
                notificationProvider.notificationData.isEmpty) {
              return Expanded(child: OrdersShimmer(height: 100));
            }

            return notificationProvider.notificationData.isEmpty
                ? Expanded(child: Center(child: Text("No Notifications found")))
                : Expanded(
                    child: ListView.builder(
                        controller: scrollController,
                        padding: EdgeInsets.only(top: 50, bottom: 70),
                        itemCount: notificationProvider.notificationData.length,
                        itemBuilder: (context, index) {
                          return UpdatesCard(
                              notificationsData:
                                  notificationProvider.notificationData[index]);
                        }),
                  );
          }),
        ],
      ),
    ));
  }
}
