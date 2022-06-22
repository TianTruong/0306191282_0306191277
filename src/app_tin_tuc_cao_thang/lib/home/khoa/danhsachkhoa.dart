// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:app_tin_tuc_cao_thang/home/khoa/gddc.dart';
import 'package:app_tin_tuc_cao_thang/home/khoa/cntt.dart';
import 'package:app_tin_tuc_cao_thang/home/khoa/cokhi.dart';
import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:app_tin_tuc_cao_thang/home/khoa/bomonkinhte.dart';
import 'package:app_tin_tuc_cao_thang/home/khoa/ckdl.dart';
import 'package:app_tin_tuc_cao_thang/home/khoa/ddt.dart';
import 'package:app_tin_tuc_cao_thang/home/khoa/nhietlanh.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChonKhoa extends StatefulWidget {
  const ChonKhoa({Key? key}) : super(key: key);

  @override
  State<ChonKhoa> createState() => _ChonKhoaState();
}

class _ChonKhoaState extends State<ChonKhoa> {
  final Stream<QuerySnapshot> faculty = FirebaseFirestore.instance
      .collection('faculty')
      .orderBy('number', descending: false)
      .snapshots();

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading : false,
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: SizedBox(
              child: Center(
                  child: Text('Khoa - Bộ môn',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontFamily: 'AidaSerifObliqueMedium'))),
            ),
          ),
          Expanded(
            child: Center(
              child: StreamBuilder<QuerySnapshot>(
                stream: faculty,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong.');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Loading');
                  }

                  final data = snapshot.requireData;

                  return ListView.builder(
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ListTile(
                                    title: Text(data.docs[index]['name'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    subtitle: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'Điện thoại: ${data.docs[index]['phone']}'),
                                          Text(
                                              'Email: ${data.docs[index]['email']}'),
                                          Text(
                                              'Website: ${data.docs[index]['website']}'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                switch (int.parse(data.docs[index]['number'])) {
                                  case 1:
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CoKhi()));

                                    break;
                                  case 2:
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CKDL()));

                                    break;
                                  case 3:
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DDT()));

                                    break;
                                  case 4:
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => NhietLanh()));

                                    break;
                                  case 5:
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CNTT()));

                                    break;
                                  case 6:
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GDDC()));

                                    break;
                                  case 7:
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BoMonKinhTe()));

                                    break;
                                }
                              }
                              ),
                        );
                      });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
