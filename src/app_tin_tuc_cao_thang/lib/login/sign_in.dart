import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _gmailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();

  @override
  void dispose() {
    _gmailController.dispose();
    _nameController.dispose();
    _passController.dispose();
    _confirmController.dispose();
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
                  return Text("username");
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 225,
                      child: const Image(
                        image: AssetImage('images/LogoChinh.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
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
                                    color: Color.fromARGB(255, 61, 97, 216), width: 3)),
                            hintText: 'Gmail'),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                      Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 5),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 61, 97, 216), width: 3)),
                            hintText: 'Họ và Tên'),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
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
                                    color: Color.fromARGB(255, 61, 97, 216), width: 3)),
                            hintText: 'Mật khẩu'),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
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
                                    color: Color.fromARGB(255, 61, 97, 216), width: 3)),
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
                        onPressed: () {
                              Navigator.pop(context);
                            }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                            child: const Text('Đã có tài khoản',
                                style: TextStyle(color:  Color.fromARGB(255, 61, 97, 216),fontSize: 20)),
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    )
                  ],
                );
              },
            ),
          )),
    );
  }


}
