import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Modela/review_model.dart';

import '../Utils/colors.dart';
import '../Utils/helpers.dart';

class ReviewCard extends StatelessWidget {
  final ReviewData reviewData;
  const ReviewCard({super.key, required this.reviewData});

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            child: Image.network(
                              netImg(reviewData.senderId?.profileImage ?? ""),
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(getImg("profile.png"),
                                    fit: BoxFit.cover, height: 40, width: 40);
                              },
                            )),
                      ),
                      SizedBox(width: 10),
                      Text(reviewData.senderId?.name ?? "",
                          style: TextStyle(
                              fontSize: 14,
                              color: black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    child: Text("${reviewData.rating.toDouble()}⭐",
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
              Text(reviewData.review)
            ],
          ),
        ),
        SizedBox(height: 12)
      ],
    );
  }
}
