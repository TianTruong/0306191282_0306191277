// ignore_for_file: avoid_unnecessary_containers, camel_case_types, prefer_const_constructors, sized_box_for_whitespace

import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhongCTCT_HSSV extends StatefulWidget {
  const PhongCTCT_HSSV({Key? key, required this.id}) : super(key: key);
  final String id;

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
                Container(
                  height: 200,
                  child: Image.asset(
                    'images/TuyenSinh.jpg',
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
                _buildDR(),
                SoTaySinhVien(),
                SizedBox(height: 15),
                TinMoiCapNhat(id: widget.id),
                SizedBox(height: 15),
                TinNoiBat(
                  id: widget.id,
                ),
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

class TinMoiCapNhat extends StatefulWidget {
  const TinMoiCapNhat({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<TinMoiCapNhat> createState() => _TinMoiCapNhatState();
}

class _TinMoiCapNhatState extends State<TinMoiCapNhat> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> posts = FirebaseFirestore.instance
        .collection('departments')
        .doc(widget.id)
        .collection('posts')
        .orderBy('time', descending: true)
        .snapshots();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Tin mới cập nhật',
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
                                      'Title: ${data.docs[index]['title']}'),
                                  // subtitle: Padding(
                                  //   padding: const EdgeInsets.only(top: 5, bottom: 5),
                                  //   child: Text('${data.docs[index]['status']}',
                                  //       style: const TextStyle(fontSize: 16)),
                                  // ),
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

class TinNoiBat extends StatefulWidget {
  const TinNoiBat({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<TinNoiBat> createState() => _TinNoiBatState();
}

class _TinNoiBatState extends State<TinNoiBat> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> posts = FirebaseFirestore.instance
        .collection('departments')
        .doc(widget.id)
        .collection('posts')
        .orderBy('time', descending: true)
        .snapshots();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Thông tin hoạt động',
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
                                      'Title: ${data.docs[index]['title']}'),
                                  // subtitle: Padding(
                                  //   padding: const EdgeInsets.only(top: 5, bottom: 5),
                                  //   child: Text('${data.docs[index]['status']}',
                                  //       style: const TextStyle(fontSize: 16)),
                                  // ),
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
          Text('Điện thoại: 028.38212360 (12)',
              style: TextStyle(fontSize: 16, color: Colors.black)),
          Text('Email: ctct.hssv@caothang.edu.vn',
              style: TextStyle(fontSize: 16, color: Colors.black)),
          Text('Website: ctct.caothang.edu.vn',
              style: TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    );
  }
}
