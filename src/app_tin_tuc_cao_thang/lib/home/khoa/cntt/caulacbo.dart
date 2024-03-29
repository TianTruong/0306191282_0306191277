// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CauLacBo extends StatefulWidget {
  const CauLacBo({Key? key}) : super(key: key);

  @override
  State<CauLacBo> createState() => _CauLacBoState();
}

class _CauLacBoState extends State<CauLacBo> {
  final Stream<QuerySnapshot> caulacbo = FirebaseFirestore.instance
      .collection('caulacbo')
      .orderBy('time', descending: true)
      .snapshots();

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
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Center(
                  child: Text('Khoa Công nghệ thông tin',
                      style: TextStyle(
                        color: Colors.red,
                      )))),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: caulacbo,
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
                                maxCrossAxisExtent: 400,
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
                                    alignment: Alignment.topLeft,
                                    child: Text(data.docs[index]['des']),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: Image.asset(
                                      data.docs[index]['image'],
                                      cacheHeight: 170,
                                      cacheWidth: 320,
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          );
                        });
                  },
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: const [
                Text('Điện thoại: 028.38212360 (33)',
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                Text('Email: nvdzung@caothang.edu.vn',
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                Text('Website: cntt.caothang.edu.vn',
                    style: TextStyle(fontSize: 16, color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
