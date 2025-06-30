import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Orders/get_orders_model.dart';
import 'package:laundry_app_laundry/Screens/Orders/order_provider.dart';
import 'package:laundry_app_laundry/Widgets/background.dart';
import 'package:laundry_app_laundry/Widgets/button.dart';
import 'package:laundry_app_laundry/Widgets/inputfield.dart';
import 'package:provider/provider.dart';

class UpdateInvoiceSheet extends StatefulWidget {
  final OrderData orderData;
  const UpdateInvoiceSheet({super.key, required this.orderData});

  @override
  State<UpdateInvoiceSheet> createState() => _UpdateInvoiceSheetState();
}

class _UpdateInvoiceSheetState extends State<UpdateInvoiceSheet> {
  TextEditingController price = TextEditingController();
  TextEditingController reason = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).focusedChild?.unfocus();
      },
      child: Container(
        height: 400,
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
                      controller: price,
                      title: "Price",
                      hintText: "Price",
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    InputField(
                      controller: reason,
                      title: "Reason",
                      hintText: "Add a reason",
                      maxLines: 4,
                    ),
                    SizedBox(height: 20),
                    Consumer<OrderProvider>(
                        builder: (context, orderProvider, child) {
                      return Button(
                        text: "update",
                        onTap: () {
                          orderProvider.updateOrder(
                              context,
                              {
                                "invoice_request.price": price.text,
                                "invoice_request.reason": reason.text
                              },
                              widget.orderData.id,
                              "Invoice updated successfully",
                              updateInvoice: true, callback: () {
                            Navigator.pop(context);
      
                          });
                        },
                      );
                    }),
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
