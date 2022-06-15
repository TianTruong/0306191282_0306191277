// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:app_tin_tuc_cao_thang/home/phongban/phongCTCT-HSSV.dart';
import 'package:app_tin_tuc_cao_thang/home/phongban/phongHCQT.dart';
import 'package:app_tin_tuc_cao_thang/home/khoa/cntt.dart';
import 'package:app_tin_tuc_cao_thang/home/khoa/cokhi.dart';
import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChonKhoa extends StatefulWidget {
  const ChonKhoa({Key? key}) : super(key: key);

  @override
  State<ChonKhoa> createState() => _ChonKhoaState();
}

class _ChonKhoaState extends State<ChonKhoa> {
  final Stream<QuerySnapshot> khoa =
      FirebaseFirestore.instance.collection('Khoa').snapshots();

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
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
            padding: const EdgeInsets.only(top: 15.0),
            child: SizedBox(
              child: Center(
                  child: Text('Khoa - Bộ môn',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 24))),
            ),
          ),
          Expanded(
            child: Center(
              child: StreamBuilder<QuerySnapshot>(
                stream: khoa,
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
                                          Text('Điện thoại: ${data.docs[index]['description']}'),
                                          Text('Email: ${data.docs[index]['email']}'),
                                          Text('Website: ${data.docs[index]['web']}'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                if (data.docs[index]['name'] == 'Khoa Cơ Khí') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CoKhi()));
                                } else {
                                  if (data.docs[index]['name'] ==
                                      'Khoa cơ khí Động lực') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PhongHCQT()));
                                  } else {
                                    if (data.docs[index]['name'] ==
                                        'Khoa Điện - Điện tử') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PhongCTCT_HSSV()));
                                    } else {
                                      if (data.docs[index]['name'] ==
                                          'Khoa Công nghệ thông tin') {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => CNTT()));
                                      } else {
                                        if (data.docs[index]['name'] ==
                                            'Khoa Công nghệ Nhiệt - Lạnh') {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PhongCTCT_HSSV()));
                                        } else {
                                          if (data.docs[index]['name'] ==
                                              'Khoa giáo dục đại cương') {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PhongCTCT_HSSV()));
                                          } else {
                                            if (data.docs[index]['name'] ==
                                                'Bộ môn Kinh tế') {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PhongCTCT_HSSV()));
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }),
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
