import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Settings/setting_provider.dart';
import 'package:laundry_app_laundry/Utils/common_provider.dart';
import 'package:laundry_app_laundry/Widgets/background.dart';
import 'package:laundry_app_laundry/Widgets/button.dart';
import 'package:laundry_app_laundry/Widgets/inputfield.dart';
import 'package:laundry_app_laundry/Widgets/screen_background.dart';
import 'package:provider/provider.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  TextEditingController message = TextEditingController();
  String? selectedValue;
  List<String> dropDownItems = [
    "Order Issue",
    "Payment/Refund",
    "Delivery Issue",
    "Special Request",
    "Damage/Lost Item"
  ];

  @override
  Widget build(BuildContext context) {
    return Background(
        body: ScreenBackground(
      showLeftIcon: true,
      text: "Support",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 50),
            InputField(
                selectedItem: selectedValue,
                title: "Subject",
                hintText: "Select",
                isDropdown: true,
                onDropdownChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
                dropdownItems: dropDownItems),
            SizedBox(height: 30),
            InputField(
              controller: message,
              maxLines: 6,
              title: "Message",
              hintText: "write a message...",
            ),
            SizedBox(height: 30),
            Consumer2<SettingProvider, CommonProvider>(
                builder: (context, settingProvider, commonProvider, child) {
              return Button(
                text: "send",
                onTap: () {
                  settingProvider.addSupportTicket(
                      context,
                      commonProvider.userId,
                      selectedValue ?? "",
                      message.text, callback: () {
                    selectedValue = null;
                    message.text = "";
                    setState(() {});
                  });
                },
              );
            })
          ],
        ),
      ),
    ));
  }
}
