import 'dart:io';

import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Utils/colors.dart';

import '../Utils/helpers.dart';

class ProfileImage extends StatefulWidget {
  final double width;
  final double height;
  final double radius;
  final String imagepath;
  final VoidCallback onTap;
  final String networkImage;
  const ProfileImage(
      {super.key,
      this.height = 150,
      this.width = 150,
      this.radius = 20,
      this.onTap = defaultCallBack,
      this.networkImage = "",
      this.imagepath = ""});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            border: Border.all(color: green8f)),
        child: widget.imagepath != ""
            ? ClipRRect(
                borderRadius: BorderRadius.circular(widget.radius),
                child: Image.file(
                  File(widget.imagepath),
                  fit: BoxFit.cover,
                ))
            : widget.networkImage != ""
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(widget.radius),
                    child: Image.network(
                      widget.networkImage,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(getImg("laundry_logo.png"));
                      },
                    ))
                : Icon(Icons.add_a_photo_outlined, color: green8f, size: 30),
      ),
    );
  }
}
