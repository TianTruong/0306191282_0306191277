import 'package:app_tin_tuc_cao_thang/home/phongban/phongCTCT-HSSV.dart';
import 'package:app_tin_tuc_cao_thang/home/phongban/phongHCQT.dart';
import 'package:app_tin_tuc_cao_thang/home/phongban/phongdaotao.dart';
import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Departments extends StatefulWidget {
  const Departments({Key? key}) : super(key: key);

  @override
  State<Departments> createState() => _DepartmentsState();
}

class _DepartmentsState extends State<Departments> {
  final Stream<QuerySnapshot> departments =
      FirebaseFirestore.instance.collection('departments').snapshots();

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
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: departments,
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
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          return InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(data.docs[index]['name']),
                                decoration: BoxDecoration(
                                    // color: Colors.amber,
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              onTap: () {
                                if (data.docs[index]['name'] ==
                                    'Phòng đào tạo') {
                                  print(data.docs[index].reference.id);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PhongDaoTao(
                                              idPhong: data
                                                  .docs[index].reference.id)));
                                } else {
                                  if (data.docs[index]['name'] ==
                                      'Phòng Hành chính - Quản trị') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PhongHCQT(
                                                id: data.docs[index].reference
                                                    .id)));
                                  } else {
                                    if (data.docs[index]['name'] ==
                                        'Phòng CTCT - HSSV') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PhongCTCT_HSSV(
                                                      id: data.docs[index]
                                                          .reference.id)));
                                    }
                                  }
                                }
                              });
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
