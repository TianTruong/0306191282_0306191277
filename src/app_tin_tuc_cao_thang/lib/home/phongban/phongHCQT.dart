// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, sized_box_for_whitespace

import 'package:app_tin_tuc_cao_thang/home/phongban/PDFView.dart';
import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:app_tin_tuc_cao_thang/home/tintuc/chitietbaiviet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhongHCQT extends StatefulWidget {
  const PhongHCQT({Key? key}) : super(key: key);

  @override
  State<PhongHCQT> createState() => _PhongHCQTState();
}

class _PhongHCQTState extends State<PhongHCQT> {
  final user = FirebaseAuth.instance.currentUser!;

  _DuongKeNgang() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.grey.shade500, width: 1))),
        child: const Center(heightFactor: 1.5),
      ),
    );
  }

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
                      onPressed: () {})),
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: Image.asset(
                'images/TuyenSinh.jpg',
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
            _DuongKeNgang(),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Tin tức',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent),
              ),
            ),
            TinTuc(),
          ],
        ),
      ),
    );
  }
}

class TinTuc extends StatefulWidget {
  const TinTuc({Key? key}) : super(key: key);
  @override
  State<TinTuc> createState() => _TinTucState();
}

class _TinTucState extends State<TinTuc> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> posts = FirebaseFirestore.instance
        .collection('posts')
        .where('type', isEqualTo: 'Hành chính - Quản trị')
        .orderBy('time', descending: true)
        .snapshots();

    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: posts,
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(data.docs[index]['title']),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => data.docs[index]
                                                  ['link'] ==
                                              ''
                                          ? ChiTietBaiViet(
                                              idBaiViet: data.docs[index].id,
                                              title: data.docs[index]['title'],
                                              like: data.docs[index]['like'],
                                              content: data.docs[index]
                                                  ['content'],
                                              image: data.docs[index]['image'],
                                            )
                                          : PDFView(
                                              url: data.docs[index]['link'])));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
