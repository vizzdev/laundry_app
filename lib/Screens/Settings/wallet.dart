import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Screens/Auth/auth_provider.dart';
import 'package:laundry_app_laundry/Utils/colors.dart';
import 'package:laundry_app_laundry/Widgets/background.dart';
import 'package:laundry_app_laundry/Widgets/button.dart';
import 'package:laundry_app_laundry/Widgets/screen_background.dart';
import 'package:laundry_app_laundry/Widgets/widhtdraw_sheet.dart';
import 'package:provider/provider.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Background(
      body: ScreenBackground(
          showLeftIcon: true,
          text: "Wallet",
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                SizedBox(height: 50),
                Container(
                  height: 200,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [green8f, Color(0xFFA8E063)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .15),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_balance_wallet,
                        size: 40,
                        color: Colors.white,
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Wallet Balance",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white.withValues(alpha: .9),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 8),
                      Consumer<AuthProvider>(
                          builder: (context, authProvider, child) {
                        return Text(
                          "\$${authProvider.userdata.wallet}",
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Button(
                  text: "Withdraw",
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: WidhtdrawSheet(),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          )),
    );
  }
}
