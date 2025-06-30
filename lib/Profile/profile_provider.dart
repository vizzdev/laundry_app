import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:laundry_app_laundry/ApiData/api_data.dart';
import 'package:laundry_app_laundry/Modela/review_model.dart';
import 'package:laundry_app_laundry/Utils/common_provider.dart';
import 'package:provider/provider.dart';

class ProfileProvider extends ChangeNotifier {
  List<ReviewData> reviewData = [];
  bool reviewLoading = false;
  bool reviewHashMoreData = true;
  int reviewCurrentPage = 1;

  Future<void> getReview(BuildContext context) async {
    if (reviewLoading || !reviewHashMoreData) return;
var commonProvider = Provider.of<CommonProvider>(context, listen: false);
    reviewLoading = true;
    notifyListeners();
    try {
      Response response = await getCall("review", "?page=$reviewCurrentPage&receiverid=${commonProvider.userId}");

      print(response.body);
      ReviewModel reviewModel = ReviewModel.fromJson(jsonDecode(response.body));

      print(response.body);

      if (reviewModel.status == 200) {
        if (reviewModel.data.isNotEmpty) {
          reviewData = [];
          reviewData.addAll(reviewModel.data);
          if (reviewData.length >= 10) {
            reviewCurrentPage++;
          }
        } else {
          reviewHashMoreData = false;
        }
        notifyListeners();
      } else {
        reviewHashMoreData = false;
      }
    } catch (e) {
      print("Error fetching events: ${e.toString()}");
    } finally {
      reviewLoading = false;
      notifyListeners();
    }
  }
}
