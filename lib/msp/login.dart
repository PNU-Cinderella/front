import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/functions.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';
import 'package:project_cinderella_test3/msp/sign_up.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
          showNotification();
          MakeToast(msg: "Login Button Pressed.");
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
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          print("url is " + request.url);
          if(request.url.contains('check'))
            {Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));}
          else if(request.url.contains('login'))
            {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));}
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
