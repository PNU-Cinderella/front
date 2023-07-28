import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(clientId: 'qqlw5g439b');
  runApp(NaverMAPTest());
}

class NaverMAPTest extends StatefulWidget {
  const NaverMAPTest({super.key});

  @override
  State<NaverMAPTest> createState() => _NaverMAPTestState();
}

class _NaverMAPTestState extends State<NaverMAPTest> {
  @override
  late double lat = 35.232525;
  late double long = 129.08307844472995;
  late NCameraUpdate ascancled;
  late NaverMapController _controller;
  String locationMessage = "지금 유저의 위치";
  final cameraUpdate = NCameraUpdate.withParams(
  target: NLatLng(37.5666102, 126.9783881),
  bearing: 180,
);
  final cameraUpdate1 = NCameraUpdate.withParams(
  target: NLatLng(35.232525, 129.08307844472995),
  bearing: 180,
);
  final marker = NMarker(id: "test", position: NLatLng(37.5666102, 126.9783881));
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: 300,
              height: 400,
              child: NaverMap(
                options: NaverMapViewOptions(
                  initialCameraPosition: NCameraPosition(
                      target: NLatLng(lat, long),
                      zoom: 13,
                      bearing: 0,
                      tilt: 0),
                ),
                onMapReady: (controller) {
                  _controller = controller;
                  controller.addOverlay(marker);
                  controller.addOverlay(NMarker(id: "test", position: NLatLng(35.232525, 129.08307844472995),icon: NOverlayImage.fromAssetImage("assets/images/TaxiList/taxi_2.png")));
                  controller.addOverlay(NMarker(id: "응애", position: NLatLng(35.23560335286283, 129.08639730711354)));
                  controller.addOverlay(NMarker(id: "응애2", position: NLatLng(35.23274589527866, 129.08644492419526)));
                  // controller.updateCamera(cameraUpdate);
                  // controller.updateCamera(ascancled);
                  // print(ascancled);
                  print("네이버 맵 로딩됨!");
                },
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  _determinePosition();
                },
                child: Text("권한 받기")),
            OutlinedButton(
              onPressed: () {
                // getCurrentLocation().then((position) {
                //   lat = position.latitude;
                //   long = position.longitude;
                // print('${lat}${long}');
                setState(() {
                  _controller.updateCamera(cameraUpdate);
                  // NaverMapController.updateCamera()
                  // NCameraUpdate.fromCameraPosition(NCameraPosition(target: NLatLng(123, 123),zoom: 10));
                  // NCameraUpdate.withParams(target: NLatLng(123, 123), zoom: 10);
                  // locationMessage =
                  // 'Latitude : ${lat} / Longitude : ${long}';
                });
              },
              child: Text("위치바꾸기"),
            ),
            OutlinedButton(
              onPressed: () {
                // getCurrentLocation().then((position) {
                //   lat = position.latitude;
                //   long = position.longitude;
                // print('${lat}${long}');
                setState(() {
                  _controller.updateCamera(cameraUpdate1);
                  // NaverMapController.updateCamera()
                  // NCameraUpdate.fromCameraPosition(NCameraPosition(target: NLatLng(123, 123),zoom: 10));
                  // NCameraUpdate.withParams(target: NLatLng(123, 123), zoom: 10);
                  // locationMessage =
                  // 'Latitude : ${lat} / Longitude : ${long}';
                });
              },
              child: Text("부산대 돌아가기"),
            )
          ],
        ),
      ),
    );
  }
}
