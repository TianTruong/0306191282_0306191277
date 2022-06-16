// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NhietLanh extends StatefulWidget {
  const NhietLanh({Key? key}) : super(key: key);

  @override
  State<NhietLanh> createState() => _NhietLanhState();
}

class _NhietLanhState extends State<NhietLanh> {
  final Stream<QuerySnapshot> nhietlanh=
      FirebaseFirestore.instance.collection('nhietlanh').snapshots();
  final PageController _controller = PageController();
  int i=0;
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
              child: Center(
                  child: Text('Khoa Cơ khí Điện - Lạnh',
                      style: TextStyle(
                        color: Colors.red,
                      )))),
          SizedBox(
            height: 200,
            child:
                Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              PageView(
                controller: _controller,
                children: <Widget>[
                  Image.asset(
                    'images/slider8.jpg',
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'images/slider9.jpg',
                    height: 150,
                  ),
                 Image.asset(
                    'images/slider7.png',
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'images/slider4.jpg',
                    height: 150,
                  ),
            
                ],
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 4,
                effect: JumpingDotEffect(
                  activeDotColor: Colors.grey,
                  dotColor: Colors.grey.shade300,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
            ]),
          ),
            
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: nhietlanh,
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
                          return Card(
                            child: ListTile(
                             leading:   Image.asset(
                                      data.docs[index]['image'],
                                      cacheHeight: 60,
                                      cacheWidth: 40,
                                    ),
                            title: Text(data.docs[index]['title']),
                            subtitle: Text(data.docs[index]['sub']),
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
                Text('   Điện thoại: 028.38212360 (22 & 25)',
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                Text('Email: nguyenngocthanh@caothang.edu.vn',
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                Text('Website: NhietLanh.caothang.edu.vn',
                    style: TextStyle(fontSize: 16, color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
