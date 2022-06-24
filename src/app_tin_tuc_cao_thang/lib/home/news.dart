// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:app_tin_tuc_cao_thang/home/doanhoi/doanhoi.dart';
import 'package:app_tin_tuc_cao_thang/home/khoa/danhsachkhoa.dart';
import 'package:app_tin_tuc_cao_thang/home/phongban/PDFView.dart';
import 'package:app_tin_tuc_cao_thang/home/phongban/danhsachphong.dart';
import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:app_tin_tuc_cao_thang/home/tintuc/chitietbaiviet.dart';
import 'package:app_tin_tuc_cao_thang/home/tintuc/tintuc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final user = FirebaseAuth.instance.currentUser!;

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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildButton(),
                _buildDR(),
                Slider(),
                _buildDR(),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 10.0),
                  child: Text(
                    'Tin giới thiệu',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                ListPost()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  const BuildButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Tin tức
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 7,
                                offset: const Offset(0, 5))
                          ]),
                      width: 65,
                      height: 65,
                      child: FlatButton(
                          child: Center(
                            child: Icon(Icons.newspaper,
                                color: Colors.lightBlue[700]),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TinTuc(),
                                ));
                          })),
                  Text('Tin tức',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),

            // Khoa, bộ môn
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 7,
                                offset: const Offset(0, 5))
                          ]),
                      width: 65,
                      height: 65,
                      child: FlatButton(
                          child: Center(
                            child: Icon(Icons.book_outlined,
                                color: Colors.lightBlue[700]),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChonKhoa(),
                                ));
                          })),
                  Text('Khoa, bộ môn',
                      style: TextStyle(color: Colors.black, fontSize: 13)),
                ],
              ),
            ),

            // Phòng ban
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 7,
                                offset: const Offset(0, 5))
                          ]),
                      width: 65,
                      height: 65,
                      child: FlatButton(
                          child: Center(
                            child: Icon(Icons.home_outlined,
                                color: Colors.lightBlue[700]),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Departments(),
                                ));
                          })),
                  Text('Phòng ban',
                      style: TextStyle(color: Colors.black, fontSize: 13)),
                ],
              ),
            ),

            // Đoàn, hội
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 7,
                                offset: const Offset(0, 5))
                          ]),
                      width: 65,
                      height: 65,
                      child: FlatButton(
                          child: Center(
                            child: Icon(Icons.flag_outlined,
                                color: Colors.lightBlue[700]),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoanHoi(),
                                ));
                          })),
                  Text('Đoàn, Hội',
                      style: TextStyle(color: Colors.black, fontSize: 13)),
                ],
              ),
            ),
          ],
        ));
  }
}

class Slider extends StatefulWidget {
  Slider({Key? key}) : super(key: key);

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  final Stream<QuerySnapshot> posts = FirebaseFirestore.instance
      .collection('posts')
      .where('type', isEqualTo: 'intro')
      .orderBy('like', descending: true)
      .snapshots();

  int indexPost = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 200,
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
              return const Center(child: CircularProgressIndicator());
            }

            final data = snapshot.requireData;

            return InkWell(
              child: CarouselSlider.builder(
                // carouselController: _controller,
                itemCount: 5,
                itemBuilder: (context, index, readIndex) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 200,
                          width: double.infinity,
                          child: Image.asset('images/LogoChinh.png')),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.7),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                        height: 65,
                        child: Center(
                          child: Text(data.docs[index]['title']),
                        ),
                      ),
                    ],
                  );
                },
                options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    setState(() {
                      indexPost = index;
                    });
                  },
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => data.docs[indexPost]['link'] == ''
                            ? ChiTietBaiViet(
                                idBaiViet: data.docs[indexPost].id,
                                title: data.docs[indexPost]['title'],
                                like: data.docs[indexPost]['like'],
                                content: data.docs[indexPost]['content'],
                                image: data.docs[indexPost]['image'],
                              )
                            : PDFView(url: data.docs[indexPost]['link'])));
              },
            );
          },
        ),
      ),
    );
  }
}

class ListPost extends StatefulWidget {
  const ListPost({Key? key}) : super(key: key);

  @override
  State<ListPost> createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
  final Stream<QuerySnapshot> posts = FirebaseFirestore.instance
      .collection('posts')
      .where('type', isEqualTo: 'intro')
      .orderBy('time', descending: true)
      .snapshots();

  int number = 3;
  double cao = 250;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cao,
      child: StreamBuilder<QuerySnapshot>(
        stream: posts,
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Text('Something went wrong.');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.requireData;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: number,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 60,
                          child: ListTile(
                            title: Text(
                              data.docs[index]['title'],
                              style: TextStyle(
                                  // color: Colors.grey[700],
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => data.docs[index]
                                                  ['link'] ==
                                              ''
                                          ? ChiTietBaiViet(
                                              idBaiViet: data.docs[index].id,
                                              title: data.docs[index]['title'],
                                              like: data.docs[index]['like'],
                                              content: data.docs[index]
                                                  ['content'],
                                              image: data.docs[index]['image'],
                                            )
                                          : PDFView(
                                              url: data.docs[index]['link'])));
                            },
                          ),
                        ),
                      );
                    }),
              ),
              number == 3
                  ? Container(
                      height: 40,
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              number = number + 1;
                              cao = cao + 70;
                            });
                          },
                          child: Text('Xem thêm')),
                    )
                  : Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  number = 3;
                                  cao = 250;
                                });
                              },
                              child: Text('Rút gọn')),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  number = number + 1;
                                  cao = cao + 70;
                                });
                              },
                              child: Text('Xem thêm'))
                        ],
                      ),
                    )
            ],
          );
        },
      ),
    );
  }
}
