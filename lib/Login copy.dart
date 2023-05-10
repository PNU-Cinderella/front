import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_cinderella_test3/Register.dart';
import 'package:project_cinderella_test3/user.dart';
import 'package:http/http.dart' as http;

// var myBackgroundColor = const Color(0xff000D2F);
// var buttonBackgroundColor = const Color.fromRGBO(217, 217, 217, 0.2);
// var textLeftUp = const Text(
//   "We just\nproviding\ntaxi...",
//   style: TextStyle(color: Colors.white),
// );
// var textRightDown = const Text(
//   "Have a comfi\n-safe time",
//   style: TextStyle(color: Colors.white),
// );
// var buttonGoogleLogin = Container(
//   width: 249,
//   height: 53,
//   child: OutlinedButton(
//     onPressed: () {},
//     child: const Text(
//       "구글로 로그인",
//       style: TextStyle(
//         color: Colors.white,
//         fontSize: 22,
//       ),
//     ),
//     style: OutlinedButton.styleFrom(
//       backgroundColor: buttonBackgroundColor,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
//     ),
//   ),
// );
// var buttonAppleLogin = Container(
//   width: 249,
//   height: 53,
//   child: OutlinedButton(
//     onPressed: () {},
//     child: const Text(
//       "애플로 로그인",
//       style: TextStyle(
//         color: Colors.white,
//         fontSize: 22,
//       ),
//     ),
//     style: OutlinedButton.styleFrom(
//       backgroundColor: buttonBackgroundColor,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
//     ),
//   ),
// );
// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           body: Container(
//         color: myBackgroundColor,
//         height: double.infinity,
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             textLeftUp,
//             const SizedBox(
//               height: 100.0,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               decoration: BoxDecoration(
//                 color: Colors.amber,
//               ),
//             ),
//             const SizedBox(
//               height: 100.0,
//             ),
//             textRightDown,
//             buttonGoogleLogin,
//             buttonAppleLogin,
//           ],
//         ),
//       )),
//     );
//   }
// }

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

// 클래스랑 함수가 있다.

class _LoginState extends State<Login> {
  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn().signIn(); // 이게 함수의 끝

    if (googleUser != null) {
      Map data = {
        'email': googleUser.email,
        'id': googleUser.id,
      };
    }
  }

  final _formKey = GlobalKey<FormState>(); //여기쪽을 위에 함수에 올려서 사용하기
  User user = User("", "");
  final url = Uri.parse("http://localhost:8080/login");

  Future save() async {
    Map data = {
      'email': user.email,
      'password': user.password,
    };
    var body = json.encode(data);
    // var res = await http.post(
    //   // 나중에 여기 주석처리 해제해서 사용.
    //   url,
    //   headers: {'Context-Type': 'application/json'},
    //   body: body,
    // );
    print(body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              height: 700,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromRGBO(233, 65, 82, 1),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: Colors.black,
                      offset: Offset(1, 5)),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      "Login",
                      style: GoogleFonts.pacifico(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email",
                        style: GoogleFonts.roboto(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: TextEditingController(text: user.email),
                      onChanged: (val) {
                        user.email = val;
                      },
                      validator: (value) {
                        // 나중에 여따가 email정규식 끼워넣기
                        if (value!.isEmpty) {
                          return "Email is Empty";
                        }
                        return "";
                      },
                      style: TextStyle(fontSize: 30, color: Colors.white),
                      decoration: InputDecoration(
                        // errorStyle:
                        //     TextStyle(fontSize: 30, color: Colors.white),
                        hintText: "Write your Email",
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          fontSize: 24.0,
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                    Container(
                      height: 7,
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "PassWord",
                        style: GoogleFonts.roboto(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: TextEditingController(text: user.password),
                      onChanged: (val) {
                        user.password = val;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is Empty";
                        }
                        return "";
                      },
                      style: TextStyle(fontSize: 30, color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Write your Pwd",
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          fontSize: 24.0,
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                    Container(
                      height: 7,
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Register(),
                            ),
                          );
                        },
                        child: Text(
                          "Don't you have Account?",
                          style: GoogleFonts.roboto(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 90,
              width: 90,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(233, 65, 82, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  // if (_formKey.currentState.validate()) {
                  save();
                  // }
                },
                child: Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SignInButton(
              Buttons.Google,
              text: "Google Login",
              onPressed: () {
                signInWithGoogle();
              },
            ),
          ],
        ),
      ),
    );
  }
}
