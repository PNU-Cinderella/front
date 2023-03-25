import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_cinderella_test3/user.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

// 클래스랑 함수가 있다.

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");
  final url = Uri.parse("http://localhost:8080/register");

  Future save() async {
    Map data = {
      'email': user.email,
      'password': user.password,
    };
    var body = json.encode(data);
    var res = await http.post(
      // 나중에 여기 주석처리 해제해서 사용.
      url,
      headers: {'Context-Type': 'application/json'},
      body: body,
    );
    print(body);
    if (res.body != null) {
      Navigator.pop(context);
    }
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
                      "Register",
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
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Already have Account?",
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
                  if (_formKey.currentState!.validate()) {
                    save();
                  }
                },
                child: Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
