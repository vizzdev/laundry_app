import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Utils/colors.dart';

class LoadingStack {
  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          color: black.withValues(alpha: 0.4),
          child: Center(
            child: SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: green8f,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
