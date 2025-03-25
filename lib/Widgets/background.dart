import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final bool safeLeft;
  final bool safeRight;
  final bool safeTop;
  final bool safeBottom;
  final Widget body;
  final bool resizableBottomInsert;
  final Color? backgroundColor;

  const Background({
    super.key,
    this.safeLeft = false,
    this.safeRight = false,
    this.safeTop = false,
    this.safeBottom = false,
    this.resizableBottomInsert = false,
    this.body = const SizedBox(),
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).focusedChild?.unfocus();
      },
      child: SafeArea(
          left: safeLeft,
          right: safeRight,
          top: safeTop,
          bottom: safeBottom,
          child: Scaffold(
            backgroundColor: backgroundColor,
            resizeToAvoidBottomInset: resizableBottomInsert,
            body: body,
          )),
    );
  }
}
