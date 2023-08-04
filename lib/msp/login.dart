import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/Components/functions.dart';
import 'package:project_cinderella_test3/msp/TaxiMainPages/taxi_main.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';
import 'package:project_cinderella_test3/msp/sign_up.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

String cookieRecieved = '';
String currentSessionID = '';

class LoginButton extends StatelessWidget {
  BuildContext? myContext;
  double? myWidth;
  double? myHeight;
  Function? funcOnPressed;
  ButtonStyle? myButtonStyle = OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
      side: BorderSide(color: colorDarkGray, width: 1.4));
  late Widget myIcon;
  late Widget myText;

  LoginButton(BuildContext? context, double? width, double? height, Widget icon,
      Widget text) {
    myContext = context;
    myWidth = width;
    myHeight = height;
    myIcon = icon;
    myText = text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: myWidth,
      height: myHeight,
      child: OutlinedButton.icon(
        onPressed: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen()));
        },
        style: myButtonStyle,
        icon: myIcon,
        label: myText,
      ),
    );
  }
}



class WebViewScreen extends StatefulWidget {
  const WebViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    super.initState();
  }


  late WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setUserAgent("random")
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {},
        onPageStarted: (String url) {
        },
        onPageFinished: (String url) {
        },
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) async{
          // {
          //   final cookie = await webViewController.runJavaScriptReturningResult('document.cookie');
          //   print(cookie);
          // }
          final cookieManager = WebviewCookieManager();


          print("url is " + request.url);

          if(request.url == "http://10.0.2.2.nip.io:8080/check")
          {
            final gotCookies = await cookieManager.getCookies(request.url);
            for (var item in gotCookies) {
              print(item);
              cookieRecieved = item.toString();
              print(item.value);
              currentSessionID = item.value;
            }
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
            }
            else if(request.url == "http://10.0.2.2.nip.io:8080/login")
            {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));}
            else if(request.url == "http://10.0.2.2.nip.io:8080/success")
            {Navigator.push(context, MaterialPageRoute(builder: (context) => TaxiMain()));}
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('http://10.0.2.2.nip.io:8080/oauth2/authorization/google'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
            child: WebViewWidget(
              controller: webViewController,
            ),
          ),
      ),
    );
  }
}


class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: colorBackground,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 85),
              rowLoginPageSub,
              // SizedBox(height: 98),
              SizedBox(height: 192.38),
              // rowLoginLogoSub,
              textLogoShadow,
              textLogoMain,
              SizedBox(
                height: 150.58,
              ),
              LoginButton(
                  context,
                  249,
                  53,
                  Image.asset("assets/images/icon_google_black.png"),
                  Text("구글로 로그인", style: textstyleLoginButton)),
              SizedBox(
                height: 31,
              ),
              LoginButton(
                  context,
                  249,
                  53,
                  Image.asset("assets/images/icon_apple_black.png"),
                  Text("애플로 로그인", style: textstyleLoginButton))
            ],
          ),
        ),
      ),
    );
  }
}
