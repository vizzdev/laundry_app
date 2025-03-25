import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Utils/colors.dart';

class ProfileImage extends StatefulWidget {
  final double width;
  final double height;
  final double radius;
  const ProfileImage({super.key,this.height = 150, this.width = 150, this.radius = 20});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          border: Border.all(color: green8f)),
      child: Icon(Icons.add_a_photo_outlined,color: green8f,size: 30),
    );
  }
}
