// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, deprecated_member_use, avoid_print, prefer_final_fields, sized_box_for_whitespace

import 'dart:ui';

import 'package:app_tin_tuc_cao_thang/login/set_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _gmailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();

  @override
  void dispose() {
    _gmailController.dispose();
    _passController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // height: double.infinity,
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
                  return SetInfor();
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 125,
                    ),
                    Container(
                      width: 150,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        shape: BoxShape.rectangle,
                      ),
                      child: const Image(
                        image: AssetImage('images/LogoChinh.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            controller: _gmailController,
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
                            obscureText: true,
                            controller: _passController,
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
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: _confirmController,
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
                                hintText: 'Xác nhận mật khẩu'),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 61, 97, 216),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Text(
                                'Đăng ký',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            onPressed: CheckSignUp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CupertinoButton(
                                padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                                child: const Text('Đã có tài khoản',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 61, 97, 216),
                                        fontSize: 20)),
                                onPressed: () {
                                  Navigator.pop(context);
                                })
                          ],
                        )
                      ],
                    ))
                  ],
                );
              },
            ),
          )),
    );
  }

  Future CheckSignUp() async {
    if (_gmailController.text == '' ||
        _passController.text == '' ||
        _confirmController.text == '' ||
        _gmailController.text.isEmpty ||
        _passController.text.isEmpty ||
        _confirmController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text('Please enter some text'),
                actions: [
                  FlatButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ));
    } else {
      if (_passController.text != _confirmController.text) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text('xác nhận mật khẩu không đúng'),
                  actions: [
                    FlatButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ));
      } else {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _gmailController.text.trim(),
              password: _passController.text.trim());
        } on FirebaseAuthException catch (e) {
          print(e);
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Text(e.toString().trim()),
                    actions: [
                      FlatButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ));
        }
      }
    }
  }
}
