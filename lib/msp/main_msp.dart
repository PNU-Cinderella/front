import 'package:permission_handler/permission_handler.dart';
import 'package:project_cinderella_test3/msp/login.dart';
import 'package:project_cinderella_test3/msp/sign_up.dart';
import 'package:project_cinderella_test3/msp/taxi_history.dart';
import 'package:project_cinderella_test3/msp/taxi_main.dart';
import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/functions.dart';
import 'package:project_cinderella_test3/msp/test/testfunction.dart';

void main() async {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Cinderella_front",
        home: ModalTest()),
  );
  initNotification();
  if (await Permission.notification.request().isGranted) {
  // Either the permission was already granted before or the user just granted it.
  print("Permission granted!");
  }
  else
  {
    Permission.notification.request();
  }
}
