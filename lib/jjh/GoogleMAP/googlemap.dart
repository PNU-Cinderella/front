import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentLocation() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  return position;
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

class GoogleMAP extends StatefulWidget {
  const GoogleMAP({super.key});

  @override
  State<GoogleMAP> createState() => _GoogleMAPState();
}

class _GoogleMAPState extends State<GoogleMAP> {
  late String lat;
  late String long;
  String locationMessage = "지금 유저의 위치";
  @override
  Widget build(BuildContext context) {
    var position;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  _determinePosition();
                },
                child: Text("권한 받기")),
            OutlinedButton(
                onPressed: () {
                  getCurrentLocation().then((position) {
                    lat = '${position.latitude}';
                    long = '${position.longitude}';
                    setState(() {
                      locationMessage =
                          'Latitude : ${lat} / Longitude : ${long}';
                    });
                  });
                },
                child: Text("경도, 위도 받아오기")),
            Text(locationMessage),
          ],
        ),
      ),
    );
  }
}
