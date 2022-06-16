// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  Contact({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        children: [
          Container(
            color: Colors.blueAccent,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.asset(
                    'images/logo.png',
                    cacheHeight: 60,
                    cacheWidth: 270,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search, size: 45)),
                        ClipOval(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Information()));
                          },
                          child: Builder(builder: (context) {
                            // user.reload;
                            print(user.photoURL);
                            return user.photoURL != null
                                ? Image.network(
                                    user.photoURL.toString(),
                                    fit: BoxFit.fill,
                                    cacheHeight: 45,
                                    cacheWidth: 45,
                                  )
                                : Image.asset(
                                    'images/intro.jpg',
                                    fit: BoxFit.fill,
                                    cacheHeight: 45,
                                    cacheWidth: 45,
                                  );
                          }),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 700,
              child: Column(children: [
                Container(
                  child: Text(
                    'Liên hệ',
                    style: TextStyle(color: Colors.redAccent, fontSize: 24),
                  ),
                ),
                Expanded(
                    child: ListView(
                  children: [
                    Text(
                      'Trường',
                      style: TextStyle(color: Colors.redAccent, fontSize: 20),
                    ),
                    ListTile(
                      title:
                          Text('65 Huỳnh Thúc Kháng, P.Bến Nghé, Q.1, Tp.HCM'),
                      subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Điện thoại: 028 38 212 868 - 028 38 212 360'),
                            Text('Email: ktcaothang@caothang.edu.vn'),
                            Text('Website: caothang.edu.vn'),
                          ]),
                    ),
                    Text(
                      'Phòng ban',
                      style: TextStyle(color: Colors.redAccent, fontSize: 20),
                    ),
                    Text(
                      'Khoa - bộ môn',
                      style: TextStyle(color: Colors.redAccent, fontSize: 20),
                    ),
                  ],
                ))
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
