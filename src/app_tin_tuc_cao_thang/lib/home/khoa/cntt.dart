import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CNTT extends StatefulWidget {
  const CNTT({Key? key}) : super(key: key);

  @override
  State<CNTT> createState() => _CNTTState();
}

class _CNTTState extends State<CNTT> {
  final Stream<QuerySnapshot> cntt =
      FirebaseFirestore.instance.collection('cntt').snapshots();

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
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
                  stream: cntt,
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
                                    child:
                                        Text(data.docs[index]['description']),
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
