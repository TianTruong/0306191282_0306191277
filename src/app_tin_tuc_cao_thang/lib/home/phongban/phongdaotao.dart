// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use, prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace

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
            child: Column(
              children: [
                NutBam(),
                SizedBox(height: 15),
                TinTuc(),
                _buildDR(),
                LienHe()
              ],
            ),
          ),
        ],
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
        child: FlatButton(
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
                  child: FlatButton(
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
                  child: FlatButton(
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
                  child: FlatButton(
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

    return Container(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Tin tức',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent),
              ),
            ),
            Expanded(
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
                                      'Title: ${data.docs[index]['title']}',
                                      // style: const TextStyle(fontSize: 20)
                                    ),
                                    // subtitle: Padding(
                                    //   padding: const EdgeInsets.only(top: 5, bottom: 5),
                                    //   child: Text('${data.docs[index]['status']}',
                                    //       style: const TextStyle(fontSize: 16)),
                                    // ),
                                    onTap: () {
                                      print(data.docs[index].id);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChiTietBaiViet(
                                                      idBaiViet:
                                                          data.docs[index].id,
                                                      title: data.docs[index]
                                                          ['title'],
                                                      like: data.docs[index]
                                                          ['like'])));
                                    },
                                  ),
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //       border: Border(
                                  //           bottom: BorderSide(
                                  //               color: Colors.grey.shade500,
                                  //               width: 1))),
                                  //   child: const Center(heightFactor: 1.5),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LienHe extends StatelessWidget {
  const LienHe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
          Text('Điện thoại: 028.38212360 (17)',
              style: TextStyle(fontSize: 16, color: Colors.black)),
          Text('Email: daotao@caothang.edu.vn',
              style: TextStyle(fontSize: 16, color: Colors.black)),
          Text('Website: daotao.caothang.edu.vn',
              style: TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    );
  }
}
