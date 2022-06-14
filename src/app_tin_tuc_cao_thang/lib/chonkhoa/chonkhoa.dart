import 'package:app_tin_tuc_cao_thang/home/phongban/phongCTCT-HSSV.dart';
import 'package:app_tin_tuc_cao_thang/home/phongban/phongHCQT.dart';
import 'package:app_tin_tuc_cao_thang/home/phongban/phongdaotao.dart';
import 'package:app_tin_tuc_cao_thang/chonkhoa/cntt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChonKhoa extends StatefulWidget {
  const ChonKhoa({Key? key}) : super(key: key);

  @override
  State<ChonKhoa> createState() => _ChonKhoaState();
}

class _ChonKhoaState extends State<ChonKhoa> {
  final Stream<QuerySnapshot> khoa =
      FirebaseFirestore.instance.collection('Khoa').snapshots();

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
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.circle, size: 45)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
               child: 
          Center(child: new Text('Khoa - Bộ môn', style: TextStyle(color: Colors.red,)))
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: khoa,
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
                                if (data.docs[index]['name'] == 'Khoa Cơ Khí') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PhongDaoTao()));
                                } else {
                                  if (data.docs[index]['name'] ==
                                      'Khoa cơ khí Động lực') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PhongHCQT()));
                                  } else {
                                    if (data.docs[index]['name'] ==
                                        'Khoa Điện - Điện tử') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PhongCTCT_HSSV()));
                                    }else{
                                      if(data.docs[index]['name'] ==
                                        'Khoa Công nghệ thông tin'){
                                             Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CNTT()));
                                        }else{
                                          if(data.docs[index]['name'] ==
                                        'Khoa Công nghệ Nhiệt -   Lạnh'){
                                            Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PhongCTCT_HSSV()));
                                        }else{
                                          if(data.docs[index]['name'] ==
                                        'Khoa giáo dục đại cương'){
                                              Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PhongCTCT_HSSV()));
                                          }else{
                                            if(data.docs[index]['name'] ==
                                        'Bộ môn Kinh tế'){
                                                     Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PhongCTCT_HSSV()));
                                            }
                                          }
                                        }
                                        }
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