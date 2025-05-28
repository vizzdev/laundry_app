import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:laundry_app_laundry/Utils/common_provider.dart';
import 'package:laundry_app_laundry/Widgets/loading_stack.dart';
import 'package:provider/provider.dart';

import '../../ApiData/api_data.dart';
import '../../Modela/get_users_model.dart';
import '../../Modela/user_model.dart';
import '../../Utils/helpers.dart';
import '../main_page.dart';

class AuthProvider extends ChangeNotifier {
  bool obscureText = true;
  Userdata userdata = Userdata(
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

  set setobscureText(bool value) {
    obscureText = value;
    notifyListeners();
  }

  signIn(BuildContext context, String email, String password) async {
    LoadingStack().show(context);

    try {
      var body = {"email": email, "password": password};

      Response response = await postCall("auth", body);
      UserModel userModel = UserModel.fromJson(jsonDecode(response.body));
      CommonProvider commonProvider =
          Provider.of<CommonProvider>(context, listen: false);
      if (userModel.data?.role == 1 || userModel.data?.role == 2) {
        showErrorBar(context, "User not found");
        Navigator.pop(context);
      } else if (response.statusCode == 200) {
        commonProvider.setToken = userModel.data?.token ?? "";
        commonProvider.setUserId = userModel.data?.id ?? "";
        Userdata user = userdatahelper;
        user.name = userModel.data?.name ?? "";
        user.email = userModel.data?.email ?? "";
        user.address = userModel.data?.address ?? "";
        user.location = userModel.data?.location;
        user.profileImage = userModel.data!.profileImage;
        userdata = userdatahelper;
        notifyListeners();
        Navigator.pop(context);
        showSuccessBar(context, userModel.message);

        pushAuth(context, MainPage());
      } else {
        Navigator.pop(context);
        showErrorBar(context, userModel.message);
      }
    } catch (e) {
      print(e.toString());
      Navigator.pop(context);
    }
  }

  signUp(BuildContext context,
      {required File imageFile,
      required String name,
      required String address,
      required String email,
      required String password,
      bool isUpdate = false,
      required LatLng location}) async {
    LoadingStack().show(context);

    try {
      CommonProvider commonProvider =
          Provider.of<CommonProvider>(context, listen: false);
      MultipartRequest request =
          mutlipartCall('users', req: isUpdate ? "PATCH" : "POST");

      if (imageFile.path != '') {
        var length = await imageFile.length();
        request.files.add(MultipartFile(
            'profile_image', imageFile.openRead(), length,
            filename: '${imageFile.path}.png'));
      }

      request.fields['name'] = name;
      request.fields['email'] = email;
      if (!isUpdate) request.fields['password'] = password;
      if (!isUpdate) request.fields['role'] = "3";
      request.fields['address'] = address;
      request.fields['lat'] = location.latitude.toString();
      request.fields['long'] = location.longitude.toString();

      var response = await Response.fromStream(await request.send());
      UserModel userModel = UserModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        commonProvider.setToken = userModel.data?.token ?? "";
        commonProvider.setUserId = userModel.data?.id ?? "";
        Userdata user = userdatahelper;
        user.name = userModel.data?.name ?? "";
        user.email = userModel.data?.email ?? "";
        user.profileImage = userModel.data!.profileImage;
        user.address = userModel.data?.address ?? "";
        user.location = userModel.data?.location;
        userdata = userdatahelper;
        notifyListeners();
        Navigator.pop(context);
        showSuccessBar(context, userModel.message);
        if (isUpdate) {
          Navigator.pop(context);
        } else {
          pushAuth(context, MainPage());
        }
      } else {
        Navigator.pop(context);
        showErrorBar(context, userModel.message);
      }
    } catch (e) {
      Navigator.pop(context);
      print(e);
    }
  }

  updateFcmToken(BuildContext context, Future<String> token) async {
    try {
      var body = {"token": await token};

      Response response = await patchCall("users/updateToken", body);

      if (response.statusCode == 200) {
        print("reponse ${response.body}");
      } else {
        print("error ${response.body}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  getUser(BuildContext context, String id) {
    getCall("users", "?id=$id").then((response) {
      GetUsersModel usersModel =
          GetUsersModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        Userdata user = userdatahelper;
        user.name = usersModel.data.first.name;
        user.email = usersModel.data.first.email;
        user.profileImage = usersModel.data.first.profileImage;
        user.address = usersModel.data.first.address;
        user.location = usersModel.data.first.location;
        userdata = userdatahelper;
        notifyListeners();
      } else {}
    });
  }
}
