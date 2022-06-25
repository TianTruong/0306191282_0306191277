// ignore_for_file: file_names, camel_case_types, prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers, deprecated_member_use

import 'package:app_tin_tuc_cao_thang/home/phongban/PDFView.dart';
import 'package:app_tin_tuc_cao_thang/home/phongban/PhongCTCT-HSSV/lichphonghoc.dart';
import 'package:app_tin_tuc_cao_thang/home/phongban/PhongCTCT-HSSV/lichtiepsv.dart';
import 'package:app_tin_tuc_cao_thang/home/phongban/PhongCTCT-HSSV/shcn.dart';
import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:app_tin_tuc_cao_thang/home/tintuc/chitietbaiviet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhongCTCT_HSSV extends StatefulWidget {
  const PhongCTCT_HSSV({Key? key}) : super(key: key);

  @override
  State<PhongCTCT_HSSV> createState() => _PhongCTCT_HSSVState();
}

class _PhongCTCT_HSSVState extends State<PhongCTCT_HSSV> {
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
          children: [
            NutBam(),
            _buildDR(),
            SoTaySinhVien(),
            SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Tin tức',
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
                      child: Text('SHCN',
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SHCN()));
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
                      child: Text('Lịch phòng học',
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LichPhongHoc()));
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
                      child: Text('Lịch tiếp SV',
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LichTiepSV()));
                      })),
              _NutNho('Thông báo khác'),
            ],
          ),
        ],
      ),
    );
  }
}

class SoTaySinhVien extends StatelessWidget {
  const SoTaySinhVien({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: const [
            Text(
              'Sổ tay sinh viên',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Card(
              child: ListTile(
                title: Text('Sổ tay sinh viên'),
                trailing: Icon(Icons.arrow_forward, color: Colors.black),
              ),
            ),
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
    Stream<QuerySnapshot> posts = FirebaseFirestore.instance
        .collection('posts')
        .where('type', isEqualTo: 'CTCT - HSSV')
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
