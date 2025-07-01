import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:laundry_app_laundry/ApiData/api_data.dart';
import 'package:laundry_app_laundry/Modela/notification_model.dart';
import 'package:laundry_app_laundry/Utils/common_provider.dart';
import 'package:provider/provider.dart';

class NotificationProvider extends ChangeNotifier {
  List<NotificationsData> notificationData = [];
  bool notificationLoading = false;
  bool notificationHashMoreData = true;
  int notificationCurrentPage = 1;

  Future<void> getNotifications(
    BuildContext context,
  ) async {
    if (notificationLoading || !notificationHashMoreData) return;

    notificationLoading = true;
    notifyListeners();
    try {
      var commonProvider = Provider.of<CommonProvider>(context, listen: false);
      Response response = await getCall("notifications",
          "?page=$notificationCurrentPage&user_id=${commonProvider.userId}");

      print(response.body);
      NotificationModel notificationModel =
          NotificationModel.fromJson(jsonDecode(response.body));
      print(response.body);

      if (notificationModel.status == 200) {
        if (notificationModel.data.isNotEmpty) {
          notificationData = [];
          notificationData.addAll(notificationModel.data);
          if (notificationData.length >= 10) {
            notificationCurrentPage++;
          }
        } else {
          notificationHashMoreData = false;
        }
        notifyListeners();
      } else {
        notificationHashMoreData = false;
      }
    } catch (e) {
      print("Error fetching events: ${e.toString()}");
    } finally {
      notificationLoading = false;
      notifyListeners();
    }
  }
}
