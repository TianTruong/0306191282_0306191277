// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, sized_box_for_whitespace, avoid_print

import 'package:app_tin_tuc_cao_thang/home/phongban/PDFView.dart';
import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:app_tin_tuc_cao_thang/home/tintuc/chitietbaiviet.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TinTuc extends StatefulWidget {
  const TinTuc({Key? key}) : super(key: key);

  @override
  State<TinTuc> createState() => _TinTucState();
}

class _TinTucState extends State<TinTuc> {
  final user = FirebaseAuth.instance.currentUser!;

  final Stream<QuerySnapshot> postsMoiNhat = FirebaseFirestore.instance
      .collection('posts')
      .orderBy('time', descending: true)
      .snapshots();

  final Stream<QuerySnapshot> postsYeuThich = FirebaseFirestore.instance
      .collection('posts')
      .orderBy('like', descending: true)
      .snapshots();

  final Stream<QuerySnapshot> postsNoiBat = FirebaseFirestore.instance
      .collection('posts')
      .orderBy('like', descending: true)
      .snapshots();

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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Slider(typePost: postsNoiBat),
                _buildDR(),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Tin tức',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                ),
                Tin(typePost: postsMoiNhat),
                _buildDR(),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Tin yêu thích',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                ),
                Tin(typePost: postsYeuThich)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Slider extends StatefulWidget {
  Slider({Key? key, required this.typePost}) : super(key: key);
  final typePost;
  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  int indexPost = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 7,
                  offset: const Offset(0, 5))
            ]),
        height: 200,
        child: StreamBuilder<QuerySnapshot>(
          stream: widget.typePost,
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

class Tin extends StatefulWidget {
  const Tin({Key? key, required this.typePost}) : super(key: key);
  final typePost;
  @override
  State<Tin> createState() => _TinState();
}

class _TinState extends State<Tin> {
  int number = 3;
  double cao = 250;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cao,
      child: StreamBuilder<QuerySnapshot>(
        stream: widget.typePost,
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
                                  fontSize: 16, fontWeight: FontWeight.bold),
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
