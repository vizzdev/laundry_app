import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Utils/colors.dart';
import '../Utils/helpers.dart';

class ScreenBackground extends StatelessWidget {
  final bool showLeftIcon;
  final String text;
  final Widget child;
  const ScreenBackground(
      {super.key,
      this.showLeftIcon = false,
      this.text = "Text",
      this.child = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: green8f,
          padding: EdgeInsets.only(top: 60, left: 10, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showLeftIcon ? GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(getImg("back.svg"))) : SizedBox(),
              Text(
                text,
                style: TextStyle(
                    fontSize: 22, color: white, fontWeight: FontWeight.bold),
              ),
              SizedBox()
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 110),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: child,
        )
      ],
    );
  }
}
