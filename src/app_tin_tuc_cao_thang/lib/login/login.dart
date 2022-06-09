import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginGmail extends StatefulWidget {
  const LoginGmail({Key? key}) : super(key: key);

  @override
  State<LoginGmail> createState() => _LoginGmailState();
}

class _LoginGmailState extends State<LoginGmail> {
  TextEditingController _gmailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

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
                    return Text("dsss");
                  }
                  return Text("hshsh");
                }
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                                          color:Color.fromARGB(255, 61, 97, 216), width: 3)),
                                  hintText: 'Gmail'),
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
                                  hintText: 'Password'),
                              keyboardType: TextInputType.text,
                            ),
                          ),
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
                                  'Sign In',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Text("dsddd")));
                                  }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('No account?'),
                              CupertinoButton(
                                  child: const Text('Sign Up',
                                      style:
                                          TextStyle(color:  Colors.black)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Text("dsddd")));
                                  })
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )),
    );
  }

 
}