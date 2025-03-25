import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:laundry_app_laundry/Screens/Google%20Maps/map_provider.dart';
import 'package:laundry_app_laundry/Widgets/background.dart';
import 'package:laundry_app_laundry/Widgets/button.dart';
import 'package:laundry_app_laundry/Widgets/screen_background.dart';
import 'package:provider/provider.dart';

class Googlemaps extends StatefulWidget {
  const Googlemaps({super.key});

  @override
  State<Googlemaps> createState() => GooglemapsState();
}

class GooglemapsState extends State<Googlemaps> {
  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(-20.0, 80.0), // Nairobi, Kenya
    zoom: 10.0,
  );

  bool isAddressFetched = false;
  double radiusValue = 2;

  @override
  void initState() {
    super.initState();
    final addOrderProvider = Provider.of<MapProvider>(context, listen: false);
    addOrderProvider.loadMarkers();
    print(
        "addOrderProvider.laundryLocation ${addOrderProvider.laundryLocation}");

    if (addOrderProvider.laundryLocation == null) {
      addOrderProvider.moveCamera(addOrderProvider.currentLocation!);
    } else {
      addOrderProvider.moveCamera(addOrderProvider.laundryLocation!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      body: ScreenBackground(
        text: "Choose Location",
        showLeftIcon: true,
        child: Stack(
          children: [
            Consumer<MapProvider>(builder: (context, data, child) {
              return GoogleMap(
                markers: data.marker,
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: data.laundryLocation != null
                      ? data.laundryLocation!
                      : data.currentLocation!,
                  zoom: 14.0,
                ),
                onMapCreated: (GoogleMapController controller) {
                  data.controllermap.complete(controller);
                },
                onCameraIdle: () async {
                  List<Placemark> placemarks = await placemarkFromCoordinates(
                    data.cameraPosition!.latitude,
                    data.cameraPosition!.longitude,
                  );

                  if (placemarks.isNotEmpty) {
                    Placemark place = placemarks.first;

                    data.setlocationName =
                        "${place.street}, ${place.subLocality}";
                    isAddressFetched = true;
                  } else {
                    print("No placemarks found.");
                  }
                },
                onCameraMove: (CameraPosition position) {
                  try {
                    data.setCameraPostion = position.target;
                  } catch (e) {
                    print("Error fetching location name: $e");
                  }
                },
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
              );
            }),
            Center(
              child: Icon(Icons.location_on, size: 30, color: Colors.red),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                child: Consumer<MapProvider>(builder: (context, data, child) {
                  return Button(
                    text: "Save Location",
                    onTap: () {
                      data.addLocationMarker();
                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.pop(context);
                      });
                    },
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
