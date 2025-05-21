import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laundry_app_laundry/Modela/user_model.dart';
import 'package:laundry_app_laundry/Screens/Auth/auth_provider.dart';
import 'package:laundry_app_laundry/Screens/Google%20Maps/map_provider.dart';
import 'package:laundry_app_laundry/Screens/Google%20Maps/maps.dart';
import 'package:laundry_app_laundry/Utils/helpers.dart';
import 'package:laundry_app_laundry/Widgets/background.dart';
import 'package:laundry_app_laundry/Widgets/button.dart';
import 'package:laundry_app_laundry/Widgets/inputfield.dart';
import 'package:laundry_app_laundry/Widgets/profile_image.dart';
import 'package:laundry_app_laundry/Widgets/screen_background.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  final Userdata data;
  const EditProfile({super.key, required this.data});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? imageFile;
  final ImagePicker _picker = ImagePicker();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  late LatLng location;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var mapProvider = Provider.of<MapProvider>(context, listen: false);
    name.text = widget.data.name;
    email.text = widget.data.email;
    mapProvider.locationName.text = widget.data.address;

    location = LatLng(widget.data.location?.coordinates.last ?? 0,
        widget.data.location?.coordinates.first ?? 0);
    mapProvider.setlaundryLocation = location;

    setState(() {});
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile =
        await _picker.pickImage(source: source, imageQuality: 80);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Background(
        body: ScreenBackground(
      text: "Edit Profile",
      showLeftIcon: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 50),
            ProfileImage(
              imagepath: imageFile?.path ?? "",
              onTap: () {
                showImagePickerOptions(context, pickGalleryImage: () {
                  _pickImage(ImageSource.gallery);
                }, pickCameraImage: () {
                  _pickImage(ImageSource.camera);
                });
              },
              networkImage: widget.data.profileImage,
            ),
            SizedBox(height: 20),
            InputField(
              title: "Name",
              hintText: "Name",
              controller: name,
            ),
            SizedBox(height: 20),
            InputField(
              title: "Email",
              leftIcon: "mail.svg",
              hintText: "Email",
              controller: email,
              readOnly: true,
            ),
            SizedBox(height: 20),
            Consumer<MapProvider>(builder: (context, mapProvider, child) {
              return InputField(
                title: "Location",
                hintText: "Location",
                rightIcon: "map.svg",
                controller: mapProvider.locationName,
                readOnly: true,
                onTap: () {
                  pushAuth(context, Googlemaps());
                },
              );
            }),
            SizedBox(height: 40),
            Consumer2<AuthProvider, MapProvider>(
                builder: (context, authProvider, mapProvider, child) {
              return Button(
                text: "Save",
                onTap: () {
                  authProvider.signUp(context,
                      isUpdate: true,
                      imageFile: imageFile ?? File(""),
                      name: name.text,
                      address: mapProvider.locationName.text,
                      email: email.text,
                      password: "",
                      location: mapProvider.laundryLocation ?? LatLng(0, 0));
                },
              );
            })
          ],
        ),
      ),
    ));
  }
}
