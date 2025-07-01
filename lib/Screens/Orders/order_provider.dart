import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:laundry_app_laundry/Screens/Orders/get_orders_model.dart';
import 'package:laundry_app_laundry/Screens/Orders/single_order_model.dart';
import 'package:laundry_app_laundry/Utils/helpers.dart';
import 'package:laundry_app_laundry/Widgets/loading_stack.dart';
import 'package:provider/provider.dart';

import '../../ApiData/api_data.dart';
import '../../Utils/common_provider.dart';

class OrderProvider extends ChangeNotifier {
  String orderStatus = "";
  String proceedOrderButtonText = "Start Working";
  int screenVisibility = 0;
  String orderid = "";

  set setOrderId(String value) {
    orderid = value;
  }

  set setOrderStatus(String value) {
    orderStatus = value;
    notifyListeners();
  }

  set setScreenVisibility(int value) {
    screenVisibility = value;
    notifyListeners();
  }

  set setProceedButton(String value) {
    proceedOrderButtonText = value;
    notifyListeners();
  }

  void setProceedOrderButtonText(BuildContext context, String orderId) {
    switch (orderStatus) {
      case "confirmed":
        {
          if (orderId != "") {
            updateOrder(context, {"status": "in-progress"}, orderId,
                "Order is in progress", callback: () {
              proceedOrderButtonText = "Deliver Order";
            });
          } else {
            proceedOrderButtonText = "Start Working";
          }

          break;
        }
      case "in-progress":
        {
          if (orderId != "") {
            updateOrder(context, {"status": "delivered"}, orderId,
                "Order deliviered SuccessFully", callback: () {
              proceedOrderButtonText = "Waiting";
            });
          } else {
            proceedOrderButtonText = "Deliver Order";
          }

          break;
        }
      case "delivered":
        {
          if (proceedOrderButtonText != "complete") {
            proceedOrderButtonText = "Waiting";
          } else {
            if (orderId != "") {
              updateOrder(context, {"status": "completed"}, orderId,
                  "Order completed SuccessFully",
                  callback: () {});
            }
          }

          break;
        }
      case "completed":
        {
          proceedOrderButtonText = "Add Review";
          break;
        }

      default:
        {
          proceedOrderButtonText = "Waiting";
          break;
        }
    }
    notifyListeners();
  }

  updateOrder(BuildContext context, Map<String, dynamic> body, String orderId,
      String message,
      {callback = defaultCallBack, updateInvoice = false}) async {
    LoadingStack().show(context);
    Response response = updateInvoice
        ? await patchCall("orders?id=$orderId", body)
        : await patchCall("orders/$orderId", body);
    SingleOrderModel ordersModel =
        SingleOrderModel.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      showSuccessBar(context, message);
      orderStatus = ordersModel.data?.status ?? "pending";

      notifyListeners();
      Navigator.pop(context);
      callback();
    } else {
      showErrorBar(context, "Please try again");
      print("response ${response.body}");
      Navigator.pop(context);
    }
  }

  List<OrderData> orderRequestData = [];
  bool orderRequestLoading = false;
  bool orderRequestHashMoreData = true;
  int orderRequestCurrentPage = 1;

  Future<void> getOrdersRequest(
    BuildContext context,
  ) async {
    if (orderRequestLoading || !orderRequestHashMoreData) return;

    orderRequestLoading = true;
    notifyListeners();
    try {
      Response response = await getCall(
          "orders", "?page=$orderRequestCurrentPage&status=pending");

      print(response.body);
      GetOrdersModel ordersModel =
          GetOrdersModel.fromJson(jsonDecode(response.body));
      print(response.body);

      if (ordersModel.status == 200) {
        print("gggg${response.body}");
        if (ordersModel.data.isNotEmpty) {
          orderRequestData = [];
          orderRequestData.addAll(ordersModel.data);
          if (orderRequestData.length >= 10) {
            orderRequestCurrentPage++;
          }
        } else {
          orderRequestHashMoreData = false;
        }
        notifyListeners();
      } else {
        orderRequestHashMoreData = false;
      }
    } catch (e) {
      print("Error fetching events: ${e.toString()}");
    } finally {
      orderRequestLoading = false;
      notifyListeners();
    }
  }

  List<OrderData> orderData = [];
  bool orderLoading = false;
  bool orderHashMoreData = true;
  int orderCurrentPage = 1;

  Future<void> getOrders(BuildContext context, {isloading = true}) async {
    var commonProvider = Provider.of<CommonProvider>(context, listen: false);
    if (orderLoading || !orderHashMoreData) return;

    orderLoading = true;
    notifyListeners();
    try {
      Response response = await getCall("orders",
          "?page=$orderCurrentPage&receivedby=${commonProvider.userId}");

      print(response.body);
      GetOrdersModel ordersModel =
          GetOrdersModel.fromJson(jsonDecode(response.body));

      print(response.body);

      if (ordersModel.status == 200) {
        if (ordersModel.data.isNotEmpty) {
          orderData = [];
          orderData.addAll(ordersModel.data);
          if (orderData.length >= 10) {
            orderCurrentPage++;
          }
        } else {
          orderHashMoreData = false;
        }
        notifyListeners();
      } else {
        orderHashMoreData = false;
      }
    } catch (e) {
      print("Error fetching events: ${e.toString()}");
    } finally {
      orderLoading = false;
      notifyListeners();
    }
  }
}
