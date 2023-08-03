import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:project_cinderella_test3/jjh/TaxiList/CreateGroup.dart';
import 'package:project_cinderella_test3/jjh/TaxiList/TaxiList.dart';
import 'package:project_cinderella_test3/msp/login.dart';
import 'package:project_cinderella_test3/msp/sign_up.dart';
import 'package:project_cinderella_test3/msp/TaxiMainPages/taxi_history.dart';
import 'package:project_cinderella_test3/msp/TaxiMainPages/taxi_main.dart';
import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/Components/functions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(clientId: 'qqlw5g439b');
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Cinderella_front",
        home: LoginPage()),
  );
  initNotification();
}
// void main() {
//   runApp(
//     MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: "Cinderella_front",
//         home: TaxiList()),
//   );
//   // initNotification();
// }
