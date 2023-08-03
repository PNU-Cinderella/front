import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:project_cinderella_test3/jjh/NaverMAP/Geolocator.dart';
import 'package:project_cinderella_test3/jjh/taxi_history copy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(clientId: 'qqlw5g439b');
  runApp(TaxiHistory());
}

class NaverMAPTest extends StatefulWidget {
  NaverMAPTest({
    super.key,
  });
  // late double lat = 35.232525;

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
  final marker =
      NMarker(id: "test", position: NLatLng(37.5666102, 126.9783881));

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
                  controller.addOverlay(NMarker(
                    id: "test",
                    position: NLatLng(35.232525, 129.08307844472995),
                  ));
                  controller.addOverlay(NMarker(
                      id: "응애",
                      position:
                          NLatLng(35.23560335286283, 129.08639730711354)));
                  controller.addOverlay(NMarker(
                      id: "응애2",
                      position:
                          NLatLng(35.23274589527866, 129.08644492419526)));
                  // controller.updateCamera(cameraUpdate);
                  // controller.updateCamera(ascancled);
                  // print(ascancled);
                  print("네이버 맵 로딩됨!");
                },
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  determinePosition();
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
