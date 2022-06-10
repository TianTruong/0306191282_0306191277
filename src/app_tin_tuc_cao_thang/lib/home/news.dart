// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:app_tin_tuc_cao_thang/home/tintuc/tintuc.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
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
                  padding: const EdgeInsets.only(bottom: 10.0),
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

  _containerBTN(String label, Color col, IconData icon) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(color: Colors.blue, width: 3),
          borderRadius: BorderRadius.circular(20),
        ),
        width: 90,
        height: 80,
        child: FlatButton(
            child: Center(
              child: Text(label,
                  style: TextStyle(color: Colors.black, fontSize: 12)),
            ),
            onPressed: () {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _containerBTN('Giới thiệu', Colors.blue, Icons.home),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(color: Colors.blue, width: 3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 90,
                  height: 80,
                  child: FlatButton(
                      child: Center(
                        child: Text('Tin tức',
                            style:
                                TextStyle(color: Colors.black, fontSize: 12)),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TinTuc(),
                            ));
                      })),
              _containerBTN('Khoa, bộ môn', Colors.blue, Icons.home),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _containerBTN('Phòng ban', Colors.blue, Icons.home),
              _containerBTN('Tuyển sinh', Colors.blue, Icons.home),
              _containerBTN('Đoàn, hội', Colors.blue, Icons.home),
            ],
          ),
        ],
      ),
    );
  }
}

class Slider extends StatelessWidget {
  const Slider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController _controller = PageController();

    return Container(
      height: 200,
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
        children: const [
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
