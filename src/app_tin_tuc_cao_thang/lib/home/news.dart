// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:app_tin_tuc_cao_thang/home/khoa/danhsachkhoa.dart';
import 'package:app_tin_tuc_cao_thang/home/phongban/danhsachphong.dart';
import 'package:app_tin_tuc_cao_thang/home/settings/information.dart';
import 'package:app_tin_tuc_cao_thang/home/tintuc/tintuc.dart';
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
                Slider(),
                // _buildDR(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: BuildButton(),
                ),
                // _buildDR(),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                  child: Text(
                    'Tin mới cập nhật',
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
        // color: Colors.blue.shade200,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
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
                  width: 80,
                  height: 80,
                  child: FlatButton(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home),
                            Text('Tin tức',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TinTuc(),
                            ));
                      })),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
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
                  width: 80,
                  height: 80,
                  child: FlatButton(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home),
                            Text('Khoa, bộ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Text('môn',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChonKhoa(),
                            ));
                      })),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
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
                  width: 80,
                  height: 80,
                  child: FlatButton(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home),
                            Text('Phòng',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Text('ban',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Departments(),
                            ));
                      })),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
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
                  width: 80,
                  height: 80,
                  child: FlatButton(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home),
                            Text('Đoàn',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Text('Hội',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                          ],
                        ),
                      ),
                      onPressed: () {})),
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
            Image.asset(
              'images/TuyenSinh.jpg',
              height: 150,
              fit: BoxFit.fill,
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
    return Container(
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.blue, width: 3),
      //   borderRadius: BorderRadius.circular(10),
      // ),
      height: 250,
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text('Tiêu đề bài viết'),
              subtitle: Text('Nội dung bài viết'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Tiêu đề bài viết'),
              subtitle: Text('Nội dung bài viết'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Tiêu đề bài viết'),
              subtitle: Text('Nội dung bài viết'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Tiêu đề bài viết'),
              subtitle: Text('Nội dung bài viết'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Tiêu đề bài viết'),
              subtitle: Text('Nội dung bài viết'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Tiêu đề bài viết'),
              subtitle: Text('Nội dung bài viết'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Tiêu đề bài viết'),
              subtitle: Text('Nội dung bài viết'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Tiêu đề bài viết'),
              subtitle: Text('Nội dung bài viết'),
            ),
          ),
        ],
      ),
    );
  }
}
