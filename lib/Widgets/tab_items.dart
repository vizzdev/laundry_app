import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Utils/colors.dart';
import '../Utils/helpers.dart';

class TabItems extends StatefulWidget {
  final String image;
  final bool isSelected;
  final VoidCallback ontap;
  const TabItems(
      {super.key, this.image = "category.svg", this.isSelected = false, this.ontap = defaultCallBack});

  @override
  State<TabItems> createState() => _TabItemsState();
}

class _TabItemsState extends State<TabItems> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.ontap();
      },
      child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border:
                  widget.isSelected ? Border.all(width: 2, color: white) : null),
          child: Center(child: SvgPicture.asset(getImg(widget.image),height: 25))),
    );
  }
}
