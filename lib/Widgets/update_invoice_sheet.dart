import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Widgets/background.dart';
import 'package:laundry_app_laundry/Widgets/button.dart';
import 'package:laundry_app_laundry/Widgets/inputfield.dart';

class UpdateInvoiceSheet extends StatefulWidget {
  const UpdateInvoiceSheet({super.key});

  @override
  State<UpdateInvoiceSheet> createState() => _UpdateInvoiceSheetState();
}

class _UpdateInvoiceSheetState extends State<UpdateInvoiceSheet> {
  @override
  Widget build(BuildContext context) {
    return Background(
      resizableBottomInsert: true,
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    InputField(
                      title: "Weight",
                      hintText: "Weight",
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    InputField(
                      title: "Price",
                      hintText: "Price",
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    InputField(
                      title: "Reason",
                      hintText: "Add a reason",
                      maxline: 4,
                    ),
                    SizedBox(height: 20),
                    Button(
                      text: "update",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: 20)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
