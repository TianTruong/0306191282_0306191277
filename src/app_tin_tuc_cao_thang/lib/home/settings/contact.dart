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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          'images/logo.png',
          cacheHeight: 40,
          cacheWidth: 180,
        ),
        actions: [
          Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 40,
                  height: 40,
                  child: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => TinTuc(),
                        //     ));
                      })),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: ClipOval(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Information()));
                  },
                  child: user.photoURL != null
                      ? Image.network(
                          user.photoURL.toString(),
                          fit: BoxFit.fill,
                          cacheHeight: 40,
                          cacheWidth: 40,
                        )
                      : Image.asset(
                          'images/intro.jpg',
                          fit: BoxFit.fill,
                          cacheHeight: 40,
                          cacheWidth: 40,
                        ),
                )),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        children: [
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
