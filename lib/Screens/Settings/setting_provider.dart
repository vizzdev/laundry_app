import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:laundry_app_laundry/ApiData/api_data.dart';
import 'package:laundry_app_laundry/Modela/common_model.dart';
import 'package:laundry_app_laundry/Utils/helpers.dart';
import 'package:laundry_app_laundry/Widgets/loading_stack.dart';

class SettingProvider extends ChangeNotifier {
  addSupportTicket(BuildContext context, String userId, String subject,
      String message, {callback = defaultCallBack}) async {
    LoadingStack().show(context);

    try {
      var body = {"user_id": userId, "subject": subject, "message": message};

      Response response = await postCall("support", body);
      Common common = Common.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        showSuccessBar(context, common.message ?? "");
        Navigator.pop(context);
        callback();
      } else {
        showErrorBar(context, common.message ?? "");
        Navigator.pop(context);
      }
    } catch (e) {
      print(e.toString());
      Navigator.pop(context);
    }
  }


  withdrawRequest(BuildContext context, String userId, String amount,{callback = defaultCallBack}) async {
    LoadingStack().show(context);

    try {
      var body = {"laundryId": userId, "amount": amount};

      Response response = await postCall("withdraw", body);
      Common common = Common.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        showSuccessBar(context, common.message ?? "");
        Navigator.pop(context);
       callback();
      } else {
        showErrorBar(context, common.message ?? "");
        Navigator.pop(context);
      }
    } catch (e) {
      print(e.toString());
      Navigator.pop(context);
    }
  }
}
