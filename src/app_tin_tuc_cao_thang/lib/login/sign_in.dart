// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, deprecated_member_use, avoid_print, sized_box_for_whitespace, prefer_final_fields

import 'dart:async';
import 'dart:ui';

import 'package:app_tin_tuc_cao_thang/home/home.dart';
import 'package:app_tin_tuc_cao_thang/login/set_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_tin_tuc_cao_thang/login/sign_up.dart';
import 'package:app_tin_tuc_cao_thang/account/reset_pass.dart';
import 'dart:math';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _gmailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _capchaController = TextEditingController();
  int count = 0;
  var capcha = generateRandomString(6);
  @override
  void dispose() {
    _gmailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }

                if (snapshot.hasData) {
                  if (FirebaseAuth.instance.currentUser!.displayName == null) {
                    return SetInfor();
                  }
                  return HomePage();
                }
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          shape: BoxShape.rectangle,
                        ),
                        child: const Image(
                          image: AssetImage('images/LogoChinh.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          controller: _gmailController,
                          cursorColor: Color(0xFF08C187),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 61, 97, 216),
                                      width: 3)),
                              hintText: 'Gmail'),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          controller: _passController,
                          obscureText: true,
                          enableSuggestions: false,
                         autocorrect: false,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 61, 97, 216),
                                      width: 3)),
                              hintText: 'Mật khẩu'),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      count >= 5
                          ? Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 250,
                                      child: TextFormField(
                                        controller: _capchaController,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 3),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 61, 97, 216),
                                                    width: 3)),
                                            hintText: 'Nhập mã xác nhận ...'),
                                        keyboardType: TextInputType.text,
                                      )),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(width: 1),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.all(15),
                                        child: Text(
                                          capcha,
                                          style: TextStyle(
                                            fontSize: 18,
                                            // color: Color.fromARGB(
                                            //     255, 255, 255, 255),
                                            // backgroundColor: Colors.blue
                                          ),
                                        ),
                                      )),
                                ],
                              ))
                          : Container(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 61, 97, 216),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Text(
                              'Đăng nhập',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          onPressed: CheckSignIn),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 30, 0, 15),
                                child: Text('Bạn chưa có tài khoản?',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15)),
                              ),
                              CupertinoButton(
                                  child: const Text('Đăng kí',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 61, 97, 216),
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUp()));
                                  }),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                           
                              CupertinoButton(
                                  child: const Text('Quên mật khẩu?',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 61, 97, 216),
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ResetPassword()));
                                  }),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          )),
    );
  }

  Future CheckSignIn() async {
    if (_gmailController.text == '' ||
        _passController.text == '' ||
        _gmailController.text.isEmpty ||
        _passController.text.isEmpty) {
      count++;

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text('Please enter some text'),
                actions: [
                  FlatButton(
                      child: const Text('OK'),
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      }),
                ],
              ));
    } else {
      try {
        if (count < 5) {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: _gmailController.text.trim(),
              password: _passController.text.trim()
              );
        } else if (capcha == _capchaController.text.trim()) {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: _gmailController.text.trim(),
              password: _passController.text.trim());
        } else {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Text('Captcha sai'),
                    actions: [
                      FlatButton(
                          child: const Text('OK'),
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          }),
                    ],
                  ));
        }
      } on FirebaseAuthException catch (e) {
        print(e);
        count++;
        print(count);
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text(e.toString().trim()),
                  actions: [
                    FlatButton(
                        child: const Text('OK'),
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        }),
                  ],
                ));
      }
    }
  }
}

String generateRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}
