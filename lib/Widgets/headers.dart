import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Utils/colors.dart';
import '../Utils/helpers.dart';

class Header extends StatelessWidget {
  final double paddingHorizontal;
  final double paddingVertical;
  final String rightIcon;
  final String leftIcon;
  final String text;
  final double fontsize;
  final bool showRightIcon;
  final bool showLeftIcon;
  const Header(
      {super.key,
      this.paddingHorizontal = 20,
      this.paddingVertical = 20,
      this.rightIcon = "back.svg",
      this.leftIcon = "back.svg",
      this.text = "Title",
      this.showRightIcon = false,
      this.showLeftIcon = false,
      this.fontsize = 20});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: paddingVertical, horizontal: paddingHorizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showLeftIcon ? SvgPicture.asset(getImg(leftIcon), height: 20,) : SizedBox(),
          Text(
            text,
            style: TextStyle(
                fontSize: fontsize, color: black, fontWeight: FontWeight.bold),
          ),
          showRightIcon ? SvgPicture.asset(getImg(rightIcon), height: 20) : SizedBox(),

        ],
      ),
    );
  }
}
