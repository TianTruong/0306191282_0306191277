// ignore_for_file: prefer_const_constructors

import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:app_tin_tuc_cao_thang/home/doanhoi/bieumau.dart';
import 'package:app_tin_tuc_cao_thang/home/doanhoi/muahexanh.dart';
import 'package:app_tin_tuc_cao_thang/home/doanhoi/anhhoatdong.dart';
import 'package:app_tin_tuc_cao_thang/home/doanhoi/khpt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DoanHoi extends StatefulWidget {
  const DoanHoi({Key? key}) : super(key: key);

  @override
  State<DoanHoi> createState() => _DoanHoiState();
}

class _DoanHoiState extends State<DoanHoi> {
  final Stream<QuerySnapshot> doanhoi = FirebaseFirestore.instance
      .collection('doanhoi')
      .orderBy('number', descending: true)
      .snapshots();
  final PageController _controller = PageController();
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
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Center(
                  child: Text('Đoàn Hội ',
                      style: TextStyle(
                        color: Colors.red,
                      )))),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: doanhoi,
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

                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 250,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          return InkWell(
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        data.docs[index]['title'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      child: Image.network(
                                        data.docs[index]['image'],
                                        cacheHeight: 120,
                                        cacheWidth: 270,
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    // color: Colors.amber,
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              onTap: () {
                                switch (int.parse(data.docs[index]['number'])) {
                                  case 1:
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AnhHoatDong()));

                                    break;
                                  case 2:
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BieuMau()));

                                    break;
                                  case 3:
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MuaHeXanh()));

                                    break;
                                  case 4:
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => KHPT()));

                                    break;
                                }
                              });
                        });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
