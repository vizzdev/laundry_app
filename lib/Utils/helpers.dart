import 'package:flutter/material.dart';

defaultCallBack() {}

getImg(String img) {
  return "assets/images/$img";
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
