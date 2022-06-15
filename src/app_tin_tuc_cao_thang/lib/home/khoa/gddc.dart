// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GDDC extends StatefulWidget {
  const GDDC({Key? key}) : super(key: key);

  @override
  State<GDDC> createState() => _GDDCState();
}

class _GDDCState extends State<GDDC> {
  final Stream<QuerySnapshot> bomonkinhte =
      FirebaseFirestore.instance.collection('bomonkinhte').snapshots();
  final PageController _controller = PageController();
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
                  child: Text('Khoa Giáo dục đại cương',
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
                
            
                ],
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 2,
                effect: JumpingDotEffect(
                  activeDotColor: Colors.grey,
                  dotColor: Colors.grey.shade300,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
            ]),
          ),
              Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Center(
                  child: Text('Các thông tin Khoa Giáo dục đại cương',
                      style: TextStyle(
                        color: Colors.red,
                      )))),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: bomonkinhte,
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
                                          fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                  ),
                                    Container(
                                    padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.topLeft,
                                  child: Text(
                                      data.docs[index]['description1'],
                                      style: TextStyle(
                                          fontSize: 13),
                                    ),
                                  ),
                                    Container(
                                    padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.topLeft,
                                  child: Text(
                                      data.docs[index]['description2'],
                                      style: TextStyle(
                                          fontSize: 13),
                                    ),
                                  ),
                                 Container(
                                    padding: EdgeInsets.all(5.0),
                                      alignment: Alignment.topLeft,
                                  child: Text(
                                      data.docs[index]['description3'],
                                      style: TextStyle(
                                          fontSize: 13),
                                    ),
                                  )
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
                Text(' Điện thoại: 028.38212360 (19)',
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                Text('Email: phamdinhhuan@caothang.edu.vn',
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                Text('Website: gddc.caothang.edu.vn',
                    style: TextStyle(fontSize: 16, color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
