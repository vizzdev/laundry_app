import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Auth/auth_provider.dart';
import 'package:laundry_app_laundry/Screens/Settings/setting_provider.dart';
import 'package:laundry_app_laundry/Utils/common_provider.dart';
import 'package:laundry_app_laundry/Utils/helpers.dart';
import 'package:laundry_app_laundry/Widgets/button.dart';
import 'package:laundry_app_laundry/Widgets/inputfield.dart';
import 'package:provider/provider.dart';

class WidhtdrawSheet extends StatefulWidget {
  const WidhtdrawSheet({super.key});

  @override
  State<WidhtdrawSheet> createState() => _WidhtdrawSheetState();
}

class _WidhtdrawSheetState extends State<WidhtdrawSheet> {
  TextEditingController amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).focusedChild?.unfocus();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 200,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            InputField(
                controller: amount,
                title: "Amount",
                hintText: "0",
                textInputType: TextInputType.number),
            SizedBox(height: 10),
            Consumer3<SettingProvider, CommonProvider, AuthProvider>(builder:
                (context, settingProvider, commonProvider, authProvider,
                    child) {
              return Button(
                text: "Withdraw",
                onTap: () {
                  if (authProvider.userdata.wallet < int.parse(amount.text)) {
                    showErrorBar(context, "Insuffient Balance");
                  } else {
                    settingProvider.withdrawRequest(
                        context, commonProvider.userId, amount.text,
                        callback: () {
                      authProvider.getUser(context, commonProvider.userId);
                      Navigator.pop(context);
                    });
                  }
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
