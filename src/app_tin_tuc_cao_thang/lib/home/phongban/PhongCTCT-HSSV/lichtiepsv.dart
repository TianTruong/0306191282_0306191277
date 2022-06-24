import 'package:app_tin_tuc_cao_thang/home/phongban/PDFView.dart';
import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LichTiepSV extends StatefulWidget {
  const LichTiepSV({Key? key}) : super(key: key);

  @override
  State<LichTiepSV> createState() => _LichTiepSVState();
}

class _LichTiepSVState extends State<LichTiepSV> {
  final user = FirebaseAuth.instance.currentUser!;

  final Stream<QuerySnapshot> posts = FirebaseFirestore.instance
      .collection('posts')
      .where('type', isEqualTo: 'Lịch đào tạo')
      .orderBy('time', descending: true)
      .snapshots();

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: Text(
                  'Xác nhận sinh viên',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
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
                                      data.docs[index]['title'],
                                    ),
                                    onTap: () {
                                      print(data.docs[index].id);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PDFView(
                                                    url: data.docs[index]
                                                        ['link'],
                                                  )));
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
            ),
          ],
        ),
      ),
    );
  }
}
