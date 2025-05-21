import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../Utils/helpers.dart';

class MapProvider extends ChangeNotifier {
  LatLng? cameraPosition;
  LatLng? laundryLocation;
  LatLng? currentLocation;
  Completer<GoogleMapController> controllermap =
      Completer<GoogleMapController>();
  TextEditingController locationName = TextEditingController();
  final Set<Marker> marker = {};
  PageController pageController = PageController();
  int currentIndex = 0;

  set setCameraPostion(LatLng value) {
    cameraPosition = value;
    notifyListeners();
  }

  set setlocationName(String value) {
    locationName.text = value;
    notifyListeners();
  }

  set setlaundryLocation(LatLng value)
  {
       laundryLocation = value;
       notifyListeners();
  }

  void loadMarkers() async {
    BitmapDescriptor customIcon = await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(20, 20)), // Adjust size if needed
      getImg("map_shop.png"),
    );

    List<LatLng> locations = [
      laundryLocation!,
    ];

    for (int i = 0; i < locations.length; i++) {
      marker.add(Marker(
        markerId: MarkerId('my_Laundry'),
        position: locations[i],
        icon: customIcon,
        onTap: () {},
        infoWindow: InfoWindow(title: locationName.text),
      ));
    }
    notifyListeners();
  }

  void addLocationMarker() async {
    BitmapDescriptor customIcon = await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(20, 20)), // Adjust size if needed
      getImg("map_shop.png"),
    );
    marker.removeWhere((m) => m.markerId.value == 'my_Laundry');

    marker.add(Marker(
      markerId: MarkerId('my_Laundry'),
      position: LatLng(cameraPosition!.latitude + 0.00005,
          cameraPosition!.longitude + 0.00005),
      icon: customIcon,
      consumeTapEvents: false,
      onTap: () {},
    ));

    laundryLocation = cameraPosition!;

    notifyListeners();
  }

  Future<void> getCurrentLocation({Function? callback}) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      debugPrint('Location services are disabled.');
      return;
    }

    // Check location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        debugPrint('Location permission denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      debugPrint('Location permissions are permanently denied.');
      return;
    }

    // Get current position
    Position position = await Geolocator.getCurrentPosition();

    currentLocation = LatLng(position.latitude, position.longitude);
    notifyListeners();
    callback!();
    moveCamera(currentLocation!);
  }

  Future<void> moveCamera(LatLng position) async {
    final GoogleMapController controller = await controllermap.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: position, zoom: 16.0),
    ));
  }

  void goToPage(int index) {
    currentIndex = index;
    notifyListeners();
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
