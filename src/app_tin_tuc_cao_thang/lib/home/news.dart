// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:app_tin_tuc_cao_thang/home/khoa/danhsachkhoa.dart';
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

class Slider extends StatefulWidget {
  Slider({Key? key}) : super(key: key);

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  final Stream<QuerySnapshot> posts = FirebaseFirestore.instance
      .collection('posts')
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
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 7,
                  offset: const Offset(0, 5))
            ]),
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
                  // final image_path = data.docs[index].avt;
                  return Text(data.docs[index]['title']);
                },
                options: CarouselOptions(
                  initialPage: 0,
                  // height: 250,
                  autoPlay: true,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    setState(() {
                      indexPost = index;
                      // print(index);
                      // print(i);
                    });
                  },
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChiTietBaiViet(
                            idBaiViet: data.docs[indexPost].id,
                            title: data.docs[indexPost]['title'],
                            like: data.docs[indexPost]['like'])));
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
  int number = 3;

  @override
  Widget build(BuildContext context) {
    // final CollectionReference loai = FirebaseFirestore.instance
    //     .collection('posts');

    final Stream<QuerySnapshot> posts = FirebaseFirestore.instance
        .collection('posts')
        .where('type', isEqualTo: 'intro')
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChiTietBaiViet(
                                          idBaiViet: data.docs[index].id,
                                          title: data.docs[index]['title'],
                                          like: data.docs[index]['like'])));
                            },
                          ),
                        ),
                      );
                    }),
              ),
              number < data.size
                  ? TextButton(
                      onPressed: () {
                        setState(() {
                          number = number + 1;
                        });
                      },
                      child: Text('Xem thêm'))
                  : TextButton(
                      onPressed: () {
                        setState(() {
                          number = 3;
                        });
                      },
                      child: Text('Rút gọn'))
            ],
          );
        },
      ),
    );
  }
}
