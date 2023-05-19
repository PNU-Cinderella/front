import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';
import 'package:project_cinderella_test3/msp/sign_up.dart';

//For PlaceHolding
Container MakeContainer(double? myWidth, double? myHeight)
{
  return Container(
    width: myWidth,
    height: myHeight,
    color: Colors.lightGreen,
  );
}

//Return Real Width from Figma's Widget width
double GetRealWidth({required double pixel, required BuildContext context, })
{
  double PX = MediaQuery.of(context).size.width / 393;
  return pixel * PX;
}

//Return Real Height from Figma's Widget height
double GetRealHeight({required double pixel, required BuildContext context, })
{
  double PX = MediaQuery.of(context).size.width / 852;
  return pixel * PX;
}

//Return Status Bar Height
double GetStatusBarHeight({required BuildContext context})
{
  return MediaQuery.of(context).viewPadding.top;
}


/// Flutter code sample for [showModalBottomSheet].

void main() => runApp(const BottomSheetApp());

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Bottom Sheet Sample')),
        body: const BottomSheetExample(),
      ),
    );
  }
}

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
