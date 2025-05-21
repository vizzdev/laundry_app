import 'package:flutter/material.dart';

import '../Utils/colors.dart';

class AnayticsCard extends StatelessWidget {
  final String text1;
  final String text2;
  const AnayticsCard({super.key, this.text1 = "90%", this.text2 = "Success"});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: green8f),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text1,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(text2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              )),
        ],
      ),
    );
  }
}
