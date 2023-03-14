// ignore_for_file: prefer_final_fields, sized_box_for_whitespace, deprecated_member_use, unused_catch_clause

import 'dart:ui';

import 'package:app_tin_tuc_cao_thang/login/set_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  return const SetInfor();
                }
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    children: [
                      Container(
                        width: 150,
                        height: 250,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          shape: BoxShape.rectangle,
                        ),
                        child: const Image(
                          image: AssetImage('images/LogoChinh.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 61, 97, 216),
                                      width: 3)),
                              hintText: 'Email'),
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
                            'Gửi',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        onPressed: resetPassword,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CupertinoButton(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                              child: const Text('Quay lại',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 61, 97, 216),
                                      fontSize: 20)),
                              onPressed: () {
                                Navigator.pop(context);
                              })
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

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: const Text('Gửi mail thành công'),
                actions: [
                  TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ));
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: const Text('Gửi thất bại'),
                actions: [
                  TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ));
    }
  }
}
