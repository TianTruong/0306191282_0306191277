// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:app_tin_tuc_cao_thang/home/khoa/danhsachkhoa.dart';
import 'package:app_tin_tuc_cao_thang/home/phongban/danhsachphong.dart';
import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:app_tin_tuc_cao_thang/home/tintuc/tintuc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
                            child: Icon(Icons.newspaper),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TinTuc(),
                                ));
                          })),
                  Text('Tin tức',
                      style: TextStyle(color: Colors.black, fontSize: 13)),
                ],
              ),
            ),
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
                            child: Icon(Icons.book_outlined),
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
                            child: Icon(Icons.home_outlined),
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
                            child: Icon(Icons.flag_outlined),
                          ),
                          onPressed: () {})),
                  Text('Đoàn, Hội',
                      style: TextStyle(color: Colors.black, fontSize: 13)),
                ],
              ),
            ),
          ],
        ));
  }
}

class Slider extends StatelessWidget {
  const Slider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController _controller = PageController();

    return Container(
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 7,
                offset: const Offset(0, 5))
          ]),
      child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        PageView(
          controller: _controller,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'images/TuyenSinh.jpg',
                height: 150,
                fit: BoxFit.fill,
              ),
            ),
            Image.asset(
              'images/LogoChinh.png',
              height: 150,
            ),
            Image.asset(
              'images/TuyenSinh.jpg',
              height: 150,
              fit: BoxFit.fill,
            ),
            Image.asset(
              'images/LogoChinh.png',
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
    );
  }
}

class ListPost extends StatelessWidget {
  const ListPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> posts = FirebaseFirestore.instance
        .collection('posts')
        .orderBy('time', descending: true)
        .snapshots();

    return Container(
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.blue, width: 3),
      //   borderRadius: BorderRadius.circular(10),
      // ),
      height: 250,
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
                    child: ListTile(
                      title: Text(
                        data.docs[index]['title'],
                        style: TextStyle(
                            // color: Colors.grey[700],
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      // ReadMoreText(
                      //   data.docs[index]['title'],
                      //   style: TextStyle(
                      //       color: Colors.grey[700],
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.bold),
                      //   trimLines: 1,
                      //   trimMode: TrimMode.Line,
                      //   trimCollapsedText: '',
                      //   // trimExpandedText: 'Show less',
                      //   // moreStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      // ),

                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ChiTietBaiViet()));
                      },
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
