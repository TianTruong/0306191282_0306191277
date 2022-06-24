// ignore_for_file: prefer_const_constructors

import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HocPhi extends StatefulWidget {
  const HocPhi({Key? key}) : super(key: key);

  @override
  State<HocPhi> createState() => _HocPhiState();
}

class _HocPhiState extends State<HocPhi> {
  final Stream<QuerySnapshot> hocphi = FirebaseFirestore.instance
      .collection('hocphi')
      .orderBy('number', descending: true)
      .snapshots();
  final Stream<QuerySnapshot> hocbong = FirebaseFirestore.instance
      .collection('hocbong')
      .orderBy('number', descending: true)
      .snapshots();
  final Stream<QuerySnapshot> vayvon = FirebaseFirestore.instance
      .collection('vayvon')
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
                  child: Text('Học phí',
                      style: TextStyle(
                        color: Colors.red,
                      )))),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 10, 4, 0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: hocphi,
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          backgroundColor: Colors.blue),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.topLeft,
                                      child: ListTile(
                                          title: Text(
                                            data.docs[index]['des1'],
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          subtitle: Column(
                                            children: [
                                              Text(
                                                data.docs[index]['hocphinganh'],
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Text(
                                                data.docs[index]['hocphinghe'],
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Text(
                                                data.docs[index]['ketoan'],
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ))),
                                  Container(
                                      padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.topLeft,
                                      child: ListTile(
                                          title: Text(
                                            data.docs[index]['des2'],
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          subtitle: Column(
                                            children: [
                                              Text(
                                                data.docs[index]['hocphinganh'],
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Text(
                                                data.docs[index]['hocphinghe'],
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Text(
                                                data.docs[index]['ketoan'],
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ))),
                                  Container(
                                      padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.topLeft,
                                      child: ListTile(
                                          title: Text(
                                            data.docs[index]['des3'],
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          subtitle: Column(
                                            children: [
                                              Text(
                                                data.docs[index]['hocphinganh'],
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Text(
                                                data.docs[index]['hocphinghe'],
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Text(
                                                data.docs[index]['ketoan'],
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ))),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  // color: Colors.amber,
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
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 6, 4, 0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: hocbong,
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          backgroundColor: Colors.blue),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        data.docs[index]['des1'],
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  Container(
                                      padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        data.docs[index]['des2'],
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  Container(
                                      padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        data.docs[index]['des3'],
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  Container(
                                      padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        data.docs[index]['des4'],
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  Container(
                                      padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        data.docs[index]['des5'],
                                        style: TextStyle(fontSize: 15),
                                      )),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  // color: Colors.amber,
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
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 6, 4, 0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: vayvon,
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          backgroundColor: Colors.blue),
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        data.docs[index]['des1'],
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  Container(
                                      padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        data.docs[index]['des2'],
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  Container(
                                      padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        data.docs[index]['des3'],
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  Container(
                                      padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        data.docs[index]['des4'],
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  Container(
                                      padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        data.docs[index]['des5'],
                                        style: TextStyle(fontSize: 15),
                                      )),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  // color: Colors.amber,
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
        ],
      ),
    );
  }
}
