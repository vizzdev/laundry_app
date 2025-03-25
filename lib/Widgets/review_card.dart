import 'package:flutter/material.dart';

import '../Utils/colors.dart';
import '../Utils/helpers.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: green8f)),
          child: Column(
            children: [
              Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(getImg("img.jpg"), fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text("Haseeb",
                          style: TextStyle(
                              fontSize: 14,
                              color: black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    child: Text("4.8⭐",
                        style: TextStyle(
                            fontSize: 14,
                            color: black,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Divider(color: greybd),
              SizedBox(height: 10),
              Text(
                  "Amazing service! My clothes came back fresh, clean, and neatly folded. The pickup and delivery were right on time. Highly recommend!")
            ],
          ),
        ),
        SizedBox(height: 12)
      ],
    );
  }
}
