import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Utils/colors.dart';
import '../Utils/helpers.dart';

class InputField extends StatefulWidget {
  final double radius;
  final double borderWidth;
  final Color borderColor;
  final double contentpaddingvertical;
  final double contentpaddinghorizontal;
  final String? rightIcon;
  final String? leftIcon;
  final String hintText;
  final String title;
  final bool showTitle;
  final bool readOnly;
  final bool obscureText;
  final VoidCallback rightIconTap;
  final VoidCallback onTap;
  final TextEditingController? controller;
  final String? rightText;
  final int? maxline;
  final TextInputType textInputType;
  const InputField(
      {super.key,
      this.radius = 10,
      this.borderWidth = 1,
      this.borderColor = green8f,
      this.contentpaddinghorizontal = 7,
      this.contentpaddingvertical = 10,
      this.hintText = "Hint",
      this.title = "Title",
      this.showTitle = true,
      this.readOnly = false,
      this.obscureText = false,
      this.rightIconTap = defaultCallBack,
      this.onTap = defaultCallBack,
      this.controller,
      this.rightIcon,
      this.rightText,
      this.maxline,
      this.textInputType = TextInputType.text,
      this.leftIcon});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool showLoader = false;

  void handleTap() {
    setState(() {
      showLoader = true;
    });

    widget.rightIconTap();

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        showLoader = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showTitle
            ? Text(
                widget.title,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: black),
              )
            : SizedBox(),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radius),
              border: Border.all(
                  width: widget.borderWidth, color: widget.borderColor)),
          child: Row(
            children: [
              SizedBox(width: 10),
              widget.leftIcon != null
                  ? SvgPicture.asset(
                      getImg(widget.leftIcon!),
                      color: greybd,
                    )
                  : SizedBox(),
              Expanded(
                child: TextFormField(
                  onTap: () {
                    widget.onTap();
                  },
                  controller: widget.controller,
                  keyboardType: widget.textInputType,
                  cursorHeight: 18,
                  maxLines: widget.maxline,
                  style: TextStyle(fontSize: 16, color: black),
                  cursorColor: black,
                  readOnly: widget.readOnly,
                  obscureText: widget.obscureText,
                  decoration: InputDecoration(
                      hintText: widget.hintText,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: widget.contentpaddinghorizontal,
                          vertical: widget.contentpaddingvertical),
                      hintStyle: TextStyle(fontSize: 16, color: greybd),
                      border: InputBorder.none),
                ),
              ),
              widget.rightText != null
                  ? GestureDetector(
                      onTap: () {
                        handleTap();
                      },
                      child: showLoader
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: green8f,
                              ),
                            )
                          : Text(
                              widget.rightText!,
                              style: TextStyle(
                                fontSize: 16,
                                color: green8f,
                              ),
                            ),
                    )
                  : widget.rightIcon != null
                      ? GestureDetector(
                          onTap: () {
                            widget.rightIconTap();
                          },
                          child: SvgPicture.asset(getImg(widget.rightIcon!),
                              color: widget.obscureText ? greybd : green8f))
                      : SizedBox(),
              SizedBox(width: 10)
            ],
          ),
        ),
      ],
    );
  }
}
