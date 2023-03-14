// ignore_for_file: unused_element, prefer_const_constructors, non_constant_identifier_names, deprecated_member_use, avoid_unnecessary_containers

import 'package:app_tin_tuc_cao_thang/home/phongban/PDFView.dart';
import 'package:app_tin_tuc_cao_thang/home/phongban/PhongDaoTao/lichdaotao.dart';
import 'package:app_tin_tuc_cao_thang/home/phongban/PhongDaoTao/lichthi.dart';
import 'package:app_tin_tuc_cao_thang/home/phongban/PhongDaoTao/thoikhoabieu.dart';
import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:app_tin_tuc_cao_thang/home/tintuc/chitietbaiviet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhongDaoTao extends StatefulWidget {
  const PhongDaoTao({Key? key}) : super(key: key);

  @override
  State<PhongDaoTao> createState() => _PhongDaoTaoState();
}

class _PhongDaoTaoState extends State<PhongDaoTao> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    _buildDR() {
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
          children: const [
            NutBam(),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Tin tức phòng Đào tạo',
                style: TextStyle(
                    fontSize: 18,
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

class NutBam extends StatelessWidget {
  const NutBam({Key? key}) : super(key: key);

  _NutNho(String label) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 7,
                  offset: const Offset(0, 5))
            ]),
        width: 75,
        height: 100,
        child: TextButton(
            child: Text(label,
                style: TextStyle(color: Colors.black, fontSize: 12)),
            onPressed: () {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 7,
                            offset: const Offset(0, 5))
                      ]),
                  width: 75,
                  height: 100,
                  child: TextButton(
                      child: Text('Thời khóa biểu',
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ThoiKhoaBieu()));
                      })),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 7,
                            offset: const Offset(0, 5))
                      ]),
                  width: 75,
                  height: 100,
                  child: TextButton(
                      child: Text('Lịch thi',
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LichThi()));
                      })),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 7,
                            offset: const Offset(0, 5))
                      ]),
                  width: 75,
                  height: 100,
                  child: TextButton(
                      child: Text('Lịch đào tạo',
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LichDaoTao()));
                      })),
              _NutNho('Chương trình đào tạo'),
            ],
          ),
        ],
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
        .where('type', isEqualTo: 'Đào tạo')
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
                            title: Text(
                              data.docs[index]['title'],
                            ),
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
