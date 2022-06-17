// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use, prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace

import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:app_tin_tuc_cao_thang/home/tintuc/chitietbaiviet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhongDaoTao extends StatefulWidget {
  const PhongDaoTao({Key? key, required this.idPhong}) : super(key: key);
  final String idPhong;

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
            child: Column(
              children: [
                // Container(
                //   height: 200,
                //   child: Image.asset(
                //     'images/TuyenSinh.jpg',
                //     height: 200,
                //     fit: BoxFit.fill,
                //   ),
                // ),
                // _buildDR(),
                NutBam(),
                SizedBox(height: 15),
                TinTuc(idPhong: widget.idPhong),
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
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        width: 75,
        height: 100,
        child: FlatButton(
            child: Text(label,
                style: TextStyle(color: Colors.black, fontSize: 12)),
            onPressed: () {}));
  }

  _NutLon(String label) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        width: 160,
        height: 120,
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
              _NutNho('Thời khóa biểu'),
              _NutNho('Lịch thi'),
              _NutNho('Lịch đào tạo'),
              _NutNho('Chương trình đào tạo'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NutLon('Đăng ký học kỳ phụ hè 2021'),
              _NutLon('Lịch phát bằng tốt nghiệp - Cấp bảng điểm'),
            ],
          ),
        ],
      ),
    );
  }
}

class TinTuc extends StatefulWidget {
  const TinTuc({Key? key, required this.idPhong}) : super(key: key);
  final String idPhong;

  @override
  State<TinTuc> createState() => _TinTucState();
}

class _TinTucState extends State<TinTuc> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> posts = FirebaseFirestore.instance
        .collection('departments')
        .doc(widget.idPhong)
        .collection('posts')
        .orderBy('time', descending: true)
        .snapshots();

    return Container(
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.grey, width: 2),
      //   borderRadius: BorderRadius.circular(5),
      // ),
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
                          child: Card(
                              // color: Colors.grey.shade200,
                              child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                      'Title: ${data.docs[index]['title']}',
                                      style: const TextStyle(fontSize: 20)),
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
                                                  idPhong: widget.idPhong,
                                                  idBaiViet: data.docs[index].id,
                                                  title: data.docs[index]
                                                      ['title'],
                                                )));
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
                          )),
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
