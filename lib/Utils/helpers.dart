import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Utils/colors.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../Modela/user_model.dart';

defaultCallBack() {}

getImg(String img) {
  return "assets/images/$img";
}

netImg(String img) {
  return "http://51.21.132.147/$img";
}

pushAuth(BuildContext context, Widget route,
    {Function callBack = defaultCallBack}) {
  return Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
    return route;
  })).then((_) {
    callBack();
  });
}

pushReplaceAuth(BuildContext context, Widget route,
    {Function callBack = defaultCallBack}) {
  return Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (BuildContext context) {
    return route;
  })).then((_) {
    callBack();
  });
}

Future<void> selectDateTime(BuildContext context,
    {bool ispickup = true}) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null) {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input, // Forces manual input UI
    );

    if (pickedTime != null) {
      // Format Date & Time in 12-hour format with AM/PM

      if (ispickup) {
      } else {}
    }
  }
}

showSuccessBar(BuildContext context, String text) {
  showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
          message: text,
          textStyle: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          backgroundColor: green8f),
      animationDuration: Duration(milliseconds: 700),
      displayDuration: Duration(milliseconds: 900));
}

showErrorBar(BuildContext context, String text) {
  showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: text,
        textStyle: TextStyle(
            fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        maxLines: 4,
      ),
      animationDuration: Duration(milliseconds: 700),
      displayDuration: Duration(milliseconds: 900));
}

void showImagePickerOptions(BuildContext context,
    {required VoidCallback pickGalleryImage,
    required VoidCallback pickCameraImage}) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(
                Icons.photo_library,
                color: green8f,
              ),
              title: Text("Choose from Gallery"),
              onTap: () {
                Navigator.pop(context);
                pickGalleryImage();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.camera_alt,
                color: green8f,
              ),
              title: Text("Take a Photo"),
              onTap: () {
                Navigator.pop(context);
                pickCameraImage();
              },
            ),
          ],
        ),
      );
    },
  );
}

String token = "";
Userdata userdatahelper = Userdata(
    email: "",
    name: "",
    profileImage: "",
    address: "",
    role: 0,
    rating: 0,
    orders: 0,
    id: "",
    v: 0,
    token: '',
    deviceToken: [],
    location: Location(type: "Point", coordinates: []));
