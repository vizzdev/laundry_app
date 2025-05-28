import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Utils/colors.dart';

class OrderProvider extends ChangeNotifier {
  int orderStatus = 1;
  String proceedOrderButtonText = "Start Working";

  void setProceedOrderButtonText() {
    switch (orderStatus) {
      case 1:
        {
          proceedOrderButtonText = "Deliver Order";
          orderStatus =2;
          break;
        }
      case 2:
        {
          proceedOrderButtonText = "Waiting";
          orderStatus = 3;
          break;
        }

      default:{
        proceedOrderButtonText = "Waiting";
        break;
      }
    }
    notifyListeners();
  }

  set setOrderStatus(int newStatus) {
    orderStatus = newStatus;
    notifyListeners();
  }

  Color changeOrderStatus(int index) {
    if (orderStatus >= index) {
      return green8f;
    } else {
      return greybd;
    }
  }


  getOrderRequest(){
    
  }
}
